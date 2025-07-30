part of 'llmmodels.dart';
const ChatModel openaiTts1Hd = ChatModel(
  // The real model id
  id: "tts-1-hd",

  // The display name if desired (optional)
  displayName: "tts",

  // How much the model costs in USD
  cost: ChatModelCost(input: 30.0, output: 0.0),

  // Capabilities of this model
  capabilities: ChatModelCapabilities(
    // Can it use tools? (from supports_function_calling)
    tools: false,

    // Default to false. This is a client-side compatibility flag.
    ultraCompatibleMode: false,

    // Default to supported for modern models.
    systemMode: ChatModelSystemMode.supported,

    // The context window in tokens (fallback to max_tokens not present)
    contextWindow: 0,

    // The maximum token output (fallback to max_tokens not present)
    maxTokenOutput: 0,

    // What modalities this model can use as inputs
    inputModalities: [Modality.text],

    // What modalities this model can use as outputs (Default)
    outputModalities: [Modality.text],

    // Does this model "reason" (inferred from tool use)
    reasoning: false,

    // Does this model support structured outputs? (fallback to false)
    structuredOutput: false,

    // Is this model streamable output? (Default to true for modern APIs)
    streaming: true,

    // Can this model see tool messages? (inferred from tool use)
    seesToolMessages: false,
  ),
);