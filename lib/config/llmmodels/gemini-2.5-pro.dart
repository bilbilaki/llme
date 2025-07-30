part of 'llmmodels.dart';
const ChatModel gemini2_5Pro = ChatModel(
 // The real model id
 id: "gemini-2.5-pro",

 // The display name if desired (optional)
 displayName: "gemini-2.5-pro",

 // How much the model costs in USD
 cost: ChatModelCost(input: 1.25, output: 10.0),

 // Capabilities of this model
 capabilities: ChatModelCapabilities(
 // Can it use tools? (from supports_function_calling)
 tools: false, // Assuming false as not provided in JSON

 // Default to false. This is a client-side compatibility flag.
 ultraCompatibleMode: false,

 // Default to supported for modern models.
 systemMode: ChatModelSystemMode.supported,

 // The context window in tokens (from max_input_tokens)
 contextWindow: 0, // Assuming 0 as not provided in JSON

 // The maximum token output (from max_output_tokens)
 maxTokenOutput: 0, // Assuming 0 as not provided in JSON

 // What modalities this model can use as inputs
 inputModalities: [Modality.text], // Defaulting to text as no other modalities are specified

 // What modalities this model can use as outputs (Default)
 outputModalities: [Modality.text],

 // Does this model "reason" (inferred from tool use)
 reasoning: false, // Assuming false as not provided in JSON

 // Does this model support structured outputs? (from supports_response_schema)
 structuredOutput: false, // Assuming false as not provided in JSON

 // Is this model streamable output? (Default to true for modern APIs)
 streaming: true,

 // Can this model see tool messages? (inferred from tool use)
 seesToolMessages: false, // Assuming false as not provided in JSON
 ),
);