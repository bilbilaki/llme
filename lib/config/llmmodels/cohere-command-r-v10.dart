part of 'llmmodels.dart';
const ChatModel cohereCommandRV10 = ChatModel(
 // The real model id
 id: "cohere.command-r-v1:0",

 // The display name if desired (optional)
 displayName: "command-r-v1:0",

 // How much the model costs in USD
 cost: ChatModelCost(input: 0.5, output: 1.5),

 // Capabilities of this model
 capabilities: ChatModelCapabilities(
 // Can it use tools? (from supports_function_calling)
 tools: false,

 // Default to false. This is a client-side compatibility flag.
 ultraCompatibleMode: false,

 // Default to supported for modern models.
 systemMode: ChatModelSystemMode.supported,

 // The context window in tokens (from max_input_tokens)
 contextWindow: 4096,

 // The maximum token output (from max_output_tokens)
 maxTokenOutput: 1024,

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