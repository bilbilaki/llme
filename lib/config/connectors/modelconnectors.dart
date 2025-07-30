import 'package:agentic/chat/connector/connector.dart';
import 'package:agentic/chat/connector/connector_anthropic.dart';
import 'package:agentic/chat/connector/connector_gemini.dart';
import 'package:agentic/chat/connector/connector_ollama.dart';
import 'package:agentic/chat/connector/connector_openai.dart';
import 'package:agentic/chat/connector/connector_xai.dart';
import 'package:llme/config/consts.dart';

ChatConnector openai = OpenAIConnector(apiKey: apiKey, baseUrl: '$baseUrl/v1');
ChatConnector anthropic = AnthropicConnector(apiKey: apiKey, baseUrl: baseUrl);
ChatConnector google = GoogleConnector(apiKey: apiKey, baseUrl: baseUrl);
ChatConnector xai = XaiConnector(apiKey: apiKey, baseUrl: baseUrl);
ChatConnector ollama = OLlamaConnector(apiKey: apiKey, baseUrl: baseUrl);