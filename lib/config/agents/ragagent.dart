import 'package:agentic/chat/agent/chat_provider.dart';
import 'package:agentic/chat/message/message.dart';
import 'package:agentic/chat/message/message_agent.dart';
import 'package:llme/config/connectors/modelconnectors.dart';
import 'package:llme/config/consts.dart';
import 'package:llme/config/llmmodels/llmmodels.dart';
import 'package:rag/pinecone_db.dart';
import 'package:rag/rag_agent.dart';

void main() async {
  RagAgent agent = RagAgent(
    user: "dan",
    llm: openai.connect(gpt41nano),
    chatProvider: MemoryChatProvider(
      messages: [
        // Initial system message
        Message.system(
          "You are a helpful assistant. You retrieve records about the patient 'Jane Doe' for caregivers. You will need to access data before you can answer the caregivers questions.",
        ),
      ],
    ),
    vectorSpace: PineconeVectorSpace(
      namespace: "<some namespace>",
      host: "https://name-xxx.pinecone.io",
      apiKey: pineconeKey,
    ),
  );

  await agent.addMessage(Message.user("What is the patients date of birth?"));
  AgentMessage answer = await agent.rag();

  /// Show output of model
  for (Message message in await agent.readMessages()) {
    print(
      "${message.runtimeType.toString().replaceAll("Message", "")}: ${message.content}",
    );
  }
}