@echo off
REM Create project folder
mkdir GeminiChatBot
cd GeminiChatBot

REM Create requirements.txt
echo langchain> requirements.txt
echo langchain-community>> requirements.txt
echo google-generativeai>> requirements.txt
echo gradio>> requirements.txt

REM Create app.py using echo and append
(
echo import os
echo import gradio as gr
echo from langchain.chains import LLMChain
echo from langchain.prompts import PromptTemplate
echo from langchain.memory import ConversationBufferMemory
echo from langchain_google_genai import ChatGoogleGenerativeAI
echo.
echo os.environ["GOOGLE_API_KEY"] = os.getenv("GOOGLE_API_KEY", "your-api-key-here")
echo.
echo template = ""^"
echo You are a helpful assistant to answer user queries.
echo ^{chat_history^}
echo User: ^{user_message^}
echo Chatbot:
echo ""^"
echo.
echo prompt = PromptTemplate(
echo     input_variables=["chat_history", "user_message"],
echo     template=template,
echo )
echo.
echo memory = ConversationBufferMemory(memory_key="chat_history", return_messages=True)
echo.
echo llm = ChatGoogleGenerativeAI(
echo     model="gemini-pro",
echo     temperature=0.5
echo )
echo.
echo llm_chain = LLMChain(
echo     llm=llm,
echo     prompt=prompt,
echo     memory=memory,
echo     verbose=True
echo )
echo.
echo def get_text_response(user_message, history):
echo     response = llm_chain.predict(user_message=user_message)
echo     return response
echo.
echo demo = gr.ChatInterface(
echo     fn=get_text_response,
echo     examples=["What is AI?", "Tell me a joke.", "How do I learn Python?"],
echo     title="Gemini ChatBot"
echo )
echo.
echo if __name__ == "__main__":
echo     demo.launch()
) > app.py

echo ✅ Files created successfully in GeminiChatBot folder!
pause
