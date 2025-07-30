part of 'llmmodels.dart';
const ChatModel dallE3 = ChatModel(
 // The real model id
 id: "dall-e-3",
 
 // The display name if desired (optional)
 displayName: "dall-e-3",
 
 // How much the model costs in USD
 cost: ChatModelCost(input: 0, output: 0.04),
 
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
 inputModalities: [Modality.text, Modality.image],
 
 // What modalities this model can use as outputs (Default)
 outputModalities: [Modality.text, Modality.image],
 
 // Does this model "reason" (inferred from tool use)
 reasoning: false,
 
 // Does this model support structured outputs? (from supports_response_schema)
 structuredOutput: false,
 
 // Is this model streamable output? (Default to true for modern APIs)
 streaming: false,
 
 // Can this model see tool messages? (inferred from tool use)
 seesToolMessages: false,
 ),
);