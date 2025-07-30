import 'package:agentic/chat/agent/agent.dart';
import 'package:agentic/chat/agent/chat_provider.dart';
import 'package:agentic/chat/connector/chat_request.dart';
import 'package:agentic/chat/connector/connected_model.dart';
import 'package:agentic/chat/connector/connector.dart';
import 'package:agentic/chat/connector/connector_anthropic.dart';
import 'package:agentic/chat/connector/connector_gemini.dart';
import 'package:agentic/chat/connector/connector_ollama.dart';
import 'package:agentic/chat/connector/connector_openai.dart';
import 'package:agentic/chat/connector/connector_xai.dart';
import 'package:agentic/chat/connector/model.dart';
import 'package:agentic/chat/connector/result.dart';
import 'package:agentic/chat/content/content.dart';
import 'package:agentic/chat/message/message.dart';
import 'package:agentic/chat/message/message_system.dart';
import 'package:agentic/chat/message/message_user.dart';
import 'package:agentic/chat/tool/tool.dart';
import 'package:agentic/chat/tool/tool_schema.dart';
import 'package:artifact/artifact.dart';
import 'package:llme/config/consts.dart';
import 'package:llme/config/llmmodels/llmmodels.dart';
import 'package:rational/rational.dart';

  import 'dart:io';

import 'package:agentic/agentic.dart';

// Generated code file for artifacts, will be created after running build_runner
part 'main.g.dart'; // Ensure filename matches, e.g., if this is main.dart

void main() async {
  // --- Example 1: Send Message Without Memory ---
  print('--- Example 1: Send Message Without Memory ---');
  final ChatConnector openaiConnector = OpenAIConnector(apiKey: "YOUR_OPENAI_API_KEY");

  // Send a single request; no history is remembered for subsequent calls.
  print("Request 1: Asking about capital of France...");
  ChatResult result1 = await openaiConnector(
    ChatRequest(
      messages: [
        Message.system("You are a helpful assistant."),
        Message.user("What is the capital of France?"),
      ],
      model: ChatModel.openai4_1Mini, // Using a smaller model for efficiency
    ),
  );
  print("Response 1: ${result1.message.content}");
  print("Tokens Used 1: ${result1.usage.totalTokens}");
  print("Cost 1: ${result1.realCost.toDouble()} USD\n");

  // A completely separate request; the model has no knowledge of the first interaction.
  print("Request 2: Asking for a haiku...");
  ChatResult result2 = await openaiConnector(
    ChatRequest(
      messages: [
        Message.system("You are a poetic assistant."),
        Message.user("Write a haiku about a blooming flower."),
      ],
      model: ChatModel.openai4_1Mini,
    ),
  );
  print("Response 2: ${result2.message.content}");
  print("Tokens Used 2: ${result2.usage.totalTokens}");
  print("Cost 2: ${result2.realCost.toDouble()} USD\n\n");

  // --- Example 2: Send Message With Memory (Agent) ---
  print('--- Example 2: Send Message With Memory (Agent) ---');
  // Using a different connector/model for variety
  final ChatConnector anthropicConnector = AnthropicConnector(apiKey: "YOUR_ANTHROPIC_API_KEY");

  // Setup an Agent with MemoryChatProvider to persistently store messages.
  Agent memoryAgent = Agent(
   llm: ConnectedChatModel(

     model: gpt41Mini, connector: openaiConnector,
    ),// A more capable model for conversation
    chatProvider: MemoryChatProvider(
      messages: [
        Message.system("You are a friendly chatbot that remembers conversation history."),
      ],
    ),
  );

  // First interaction: Ask an initial question.
  print("Agent interaction 1: Initial greeting...");
  await memoryAgent.addMessage(Message.user("Hello there!"));
  AgentMessage response3 = await memoryAgent();
  print("Agent Response 1: ${response3.content}\n");

  // Second interaction: Ask a follow-up question that relies on the previous one.
  // The agent automatically includes previous messages from its chatProvider.
  print("Agent interaction 2: Asking for a joke...");
  await memoryAgent.addMessage(Message.user("Can you tell me a short, funny joke?"));
  AgentMessage response4 = await memoryAgent();
  print("Agent Response 2: ${response4.content}\n");

  // Print all messages in the agent's memory to demonstrate retention.
  print("Current Agent Memory:");
  for (Message msg in await memoryAgent.readMessages()) {
    print("${msg.runtimeType.toString().replaceAll("Message", "")}: ${msg.content}");
  }
  print("Total Tokens for Memory Agent: ${memoryAgent.customData.entries.first.value.totalUsage.totalTokens}");
  print("Total Cost for Memory Agent: ${memoryAgent.customData.entries.first.value.totalUsage.totalCost.toDouble()} USD\n\n");

  // --- Example 3: Send Message With Tool and Memory ---
  print('--- Example 3: Send Message With Tool and Memory ---');
  // First, we setup the agent for tool usage
  Agent toolAgent = Agent(
    llm: ConnectedChatModel(

     model: gpt41Mini, connector: openaiConnector,
    ),
    chatProvider: MemoryChatProvider(
      messages: [
        Message.system("You are a helpful assistant that can play confetti on the user's screen."),
        Message.user("Please do red and yellow confetti."),
      ],
    ),
  );

  // Now, we invoke the agent with its initial state and our defined ConfettiTool.
  // The agent will decide if and how to use the tool based on the user's prompt.
  print("Agent thinking (first call with tool, requesting confetti)...");
  await toolAgent(tools: [ConfettiTool()]);
  print("Agent finished first call with tool.\n");

  // Add another message to utilize memory and ask about the tool's execution.
  await toolAgent.addMessage(
    Message.user("Based on our last interaction, was confetti successfully run?"),
  );

  // Invoke the agent again, this time also requesting a structured response
  // using the ConfettiCheck schema, demonstrating structured output capabilities.
  print("Agent thinking (second call for tool check, expecting structured response)...");
  await toolAgent(
    responseFormat: ToolSchema(
      name: "Output",
      description: "An output of whether confetti was run or not.",
      schema: $ConfettiCheck.schema,
    ),
  );
  print("Agent finished second call for tool check.\n");

  // Print the full chat state to see the messages, tool calls, and tool outputs.
  print("Final Chat State for Tool Agent:");
  for (Message i in await toolAgent.readMessages()) {
    print("${i.runtimeType.toString().replaceAll("Message", "")}: ${i.content}");
  }
  print("Total Tokens for Tool Agent: ${toolAgent.totalUsage.totalTokens}");
  print("Total Cost for Tool Agent: ${toolAgent.totalUsage.totalCost.toDouble()} USD\n\n");

  // --- Example 4: Streaming Output ---
  print('--- Example 4: Streaming Output ---');

  print("Streaming response for a detailed explanation of clean code...");
  // Use the stream method on the connector to get chunks of the response as they arrive.
  await for (ChatResultChunk chunk in openaiConnector.(
    ChatRequest(
      messages: [
        Message.system("You are a concise assistant."),
        Message.user("Tell me about the importance of clean code."),
      ],
      model: ChatModel.openai4_1Mini,
      stream: true, // Crucial: Enable streaming
    ),
  )) {
    if (chunk.message != null && chunk.message!.content != null) {
      // Print new content *incrementally* using stdout.write for continuous flow.
      stdout.write(chunk.message!.content);
    }
  }
  stdout.writeln("\nEnd of stream.\n");
}

// --- Tool Definitions for Example 3 ---
// These classes define the structure for the Confetti tool's input and a check.
// The @Artifact(generateSchema: true) annotation tells build_runner to generate
// a .g.dart file containing schema representations ($ConfettiToolSchema.schema).

@Artifact(generateSchema: true)
class ConfettiToolSchema {
  @describe("An array of colors to be used for the confetti particles.")
  final List<ConfettiColor> colors;

  const ConfettiToolSchema({this.colors = const []});

  // Constructor generated by build_runner for deserialization from tool arguments.
  factory ConfettiToolSchema.fromMap(Map<String, dynamic> map) =>
      _$ConfettiToolSchemaFromJson(map);
}

@Artifact(generateSchema: true)
class ConfettiColor {
  @describe("The red channel value for the color (0-255).")
  final int r;
  @describe("The green channel value for the color (0-255).")
  final int g;
  @describe("The blue channel value for the color (0-255).")
  final int b;

  const ConfettiColor({required this.r, required this.g, required this.b});

  @override
  String toString() => "($r,$g,$b)";

  // Constructor generated by build_runner for deserialization.
  factory ConfettiColor.fromMap(Map<String, dynamic> map) =>
      _$ConfettiColorFromJson(map);
}

// Custom tool implementation using Agentic's TransformerTool.
class ConfettiTool extends TransformerTool<ConfettiToolSchema, String> {
  ConfettiTool({
    super.name = "confetti",
    super.description = "Plays confetti on the user's screen with multiple color options.",
  });

  // Provides the JSON schema for this tool's input to the AI model.
  @override
  Map<String, dynamic> get schema => _$ConfettiToolSchemaToJson(ConfettiToolSchema());

  // Called when the AI decides to use this tool.
  @override
  Future<String> callTransform(Agent agent, ConfettiToolSchema request) async {
    print("TOOL ACTION: Playing Confetti in ${request.colors.map((c) => "RGB${c.toString()}").join(" AND ")}");

    // Return a string that describes the tool's action back to the AI.
    // This allows the AI to provide a natural language explanation to the user.
    return "Confetti played in ${request.colors.map((c) => "RGB${c.toString()}").join(" , ")}.";
  }

  // Specifies how to decode the AI's arguments (Map<String, dynamic>) into our schema class.
  @override
  ConfettiToolSchema decodeInput(Map<String, dynamic> input) =>
      ConfettiToolSchema.fromMap(input);

  // Specifies how to encode the tool's output (String) for the AI, though for a String, it's often a direct return.
  @override
  String encodeOutput(String output) => output;
}

@Artifact(generateSchema: true)
class ConfettiCheck {
  @describe("Indicates if confetti was successfully played.")
  final bool played;

  const ConfettiCheck({this.played = false});

  // Constructor generated by build_runner for deserialization.
  factory ConfettiCheck.fromMap(Map<String, dynamic> map) =>
      _$ConfettiCheckFromJson(map);
}