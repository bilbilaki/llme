part of 'llmmodels.dart';
const ChatModel gemini20ProExp0205 = ChatModel(
 // The real model id
 id: "gemini-2.0-pro-exp-02-05",
 
 // The display name if desired (optional)
 displayName: "gemini-2.0-pro-exp-02-05",
 
 // How much the model costs in USD
 cost: ChatModelCost(input: 3.5, output: 7.0),
 
 // Capabilities of this model
 capabilities: ChatModelCapabilities(
 // Can it use tools? (from supports_function_calling)
 tools: false,
 
 // Default to false. This is a client-side compatibility flag.
 ultraCompatibleMode: false,
 
 // Default to supported for modern models.
 systemMode: ChatModelSystemMode.supported,
 
 // The context window in tokens (from max_input_tokens)
 contextWindow: 0,
 
 // The maximum token output (from max_output_tokens)
 maxTokenOutput: 0,
 
 // What modalities this model can use as inputs
 inputModalities: [Modality.text],
 
 // What modalities this model can use as outputs (Default)
 outputModalities: [Modality.text],
 
 // Does this model "reason" (inferred from tool use)
 reasoning: false,
 
 // Does this model support structured outputs? (from supports_response_schema)
 structuredOutput: false,
 
 // Is this model streamable output? (Default to true for modern APIs)
 streaming: true,
 
 // Can this model see tool messages? (inferred from tool use)
 seesToolMessages: false,
 ),
);