part of 'llmmodels.dart';
const ChatModel gpt4120250414 = ChatModel(
 // The real model id
 id: "gpt-4.1-2025-04-14",
 
 // The display name if desired (optional)
 displayName: "gpt-4.1",
 
 // How much the model costs in USD
 cost: ChatModelCost(input: 2.0, output: 8.0),
 
 // Capabilities of this model
 capabilities: ChatModelCapabilities(
 // Can it use tools? (from supports_function_calling)
 tools: true,
 
 // Default to false. This is a client-side compatibility flag.
 ultraCompatibleMode: false,
 
 // Default to supported for modern models.
 systemMode: ChatModelSystemMode.supported,
 
 // The context window in tokens (from max_input_tokens)
 contextWindow: 1047576,
 
 // The maximum token output (from max_output_tokens)
 maxTokenOutput: 32768,
 
 // What modalities this model can use as inputs
 inputModalities: [Modality.text, Modality.image],
 
 // What modalities this model can use as outputs (Default)
 outputModalities: [Modality.text],
 
 // Does this model "reason" (inferred from tool use)
 reasoning: true,
 
 // Does this model support structured outputs? (from supports_response_schema)
 structuredOutput: true,
 
 // Is this model streamable output? (Default to true for modern APIs)
 streaming: true,
 
 // Can this model see tool messages? (inferred from tool use)
 seesToolMessages: true,
 ),
);