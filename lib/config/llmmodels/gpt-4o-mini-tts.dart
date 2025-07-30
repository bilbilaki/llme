part of 'llmmodels.dart';
const ChatModel gpt4oMiniTts = ChatModel(
 // The real model id
 id: "gpt-4o-mini-tts",

 // The display name if desired (optional)
 displayName: "gpt-4o-mini-tts",

 // How much the model costs in USD
 cost: ChatModelCost(input: 0.6, output: 0.015),

 // Capabilities of this model
 capabilities: ChatModelCapabilities(
 // Can it use tools? (from supports_function_calling)
 tools: false,

 // Default to false. This is a client-side compatibility flag.
 ultraCompatibleMode: false,

 // Default to supported for modern models.
 systemMode: ChatModelSystemMode.supported,

 // The context window in tokens (from max_input_tokens)
 contextWindow: 8192, // Defaulting to a common value as not provided

 // The maximum token output (from max_output_tokens)
 maxTokenOutput: 4096, // Defaulting to a common value as not provided

 // What modalities this model can use as inputs
 inputModalities: [Modality.text, Modality.audio], // Assuming audio input based on mode

 // What modalities this model can use as outputs (Default)
 outputModalities: [Modality.text], // TTS models typically output audio, but the schema expects text for output modality

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