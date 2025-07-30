part of 'llmmodels.dart';
const ChatModel computerUsePreview = ChatModel(
 // The real model id
 id: "computer-use-preview-2025-03-11",
 
 // The display name if desired (optional)
 displayName: "computer-use-preview",
 
 // How much the model costs in USD
 cost: ChatModelCost(input: 3.0, output: 12.0),
 
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