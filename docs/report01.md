# Project Report

## Overview
This project implements a chat application using various AI connectors, allowing users to interact with different models and tools. The application demonstrates sending messages with and without memory, utilizing tools, and streaming responses.

## Key Components

### 1. Chat Connectors
- **OpenAIConnector**: Connects to OpenAI's API for chat interactions.
- **AnthropicConnector**: Connects to Anthropic's API for chat interactions.

### 2. Message Handling
- **Message System**: Defines the structure for system and user messages.
- **MemoryChatProvider**: Stores conversation history for agents that remember previous interactions.

### 3. Agent Implementation
- **Agent**: Represents a chat agent that can remember past interactions and respond accordingly.
- **ConnectedChatModel**: Combines a model with a connector for chat functionality.

### 4. Tool Integration
- **ConfettiTool**: A custom tool that plays confetti on the user's screen with specified colors.
- **ConfettiToolSchema**: Defines the input schema for the ConfettiTool.

### 5. Streaming Responses
- Demonstrates how to stream responses from the OpenAI API for real-time interaction.

## Examples
### Example 1: Send Message Without Memory
- Sends a request to OpenAI asking about the capital of France and receives a response without retaining any memory.

### Example 2: Send Message With Memory (Agent)
- Uses an agent with memory to retain conversation history and respond to follow-up questions.

### Example 3: Send Message With Tool and Memory
- Integrates a tool (ConfettiTool) to perform actions based on user requests while retaining memory.

### Example 4: Streaming Output
- Streams responses from the OpenAI API for a detailed explanation of clean code, demonstrating real-time interaction.

## Conclusion
This project showcases the capabilities of integrating various AI models and tools into a chat application, providing a flexible and interactive user experience.