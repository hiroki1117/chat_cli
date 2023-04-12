require "openai"

client = OpenAI::Client.new(access_token: ENV["OPENAI_ACCESS_TOKEN"])

# 各種設定
selected_model = "gpt-3.5-turbo"
system_role_message = "you are good smart assistant"
temperature = 0.6

# 会話
conversation = [{role: "system", content: system_role_message}]

while true
    puts "you > "
    input_prompt = gets
    conversation.push({role: "user", content: input_prompt})

    response = client.chat(
        parameters: {
            model: selected_model,
            messages: conversation,
            temperature: temperature,
        })
    puts "ai > ", response.dig("choices", 0, "message", "content")
    conversation.push({role: "assistant", content: response.dig("choices", 0, "message", "content")})
end