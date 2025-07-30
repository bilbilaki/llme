part of 'llmmodels.dart';
const ChatModel deepseekReasoner = ChatModel(
 // The real model id
 id: "deepseek-reasoner",
 
 // The display name if desired (optional)
 displayName: "deepseek-reasoner",
 
 // How much the model costs in USD
 cost: ChatModelCost(input: 0.55, output: 2.19),
 
 // Capabilities of this model
 capabilities: ChatModelCapabilities(
 // Can it use tools? (from supports_function_calling)
 tools: true,
 
 // Default to false. This is a client-side compatibility flag.
 ultraCompatibleMode: false,
 
 // Default to supported for modern models.
 systemMode: ChatModelSystemMode.supported,
 
 // The context window in tokens (from max_input_tokens)
 contextWindow: 65536,
 
 // The maximum token output (from max_output_tokens)
 maxTokenOutput: 8192,
 
 // What modalities this model can use as inputs
 inputModalities: [Modality.text],
 
 // What modalities this model can use as outputs (Default)
 outputModalities: [Modality.text],
 
 // Does this model "reason" (inferred from tool use)
 reasoning: true,
 
 // Does this model support structured outputs? (from supports_response_schema)
 structuredOutput: false,
 
 // Is this model streamable output? (Default to true for modern APIs)
 streaming: true,
 
 // Can this model see tool messages? (inferred from tool use)
 seesToolMessages: true,
 ),
);