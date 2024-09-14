require "openai"
client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY2"))

puts "Hello! How can I help you today?"
(1..50).each do
  print "-"
end
puts "\n"
questions = ""

close = false
i = 0;
while !close
  question = gets.chomp
  questions+=question
  message_list = [
    {
      "role" => "system",
      "content" => "You are a helpful assistant who talks straight forward and logically."
    },
    {
      "role" => "user",
      "content" => question
    }
  ]

  api_response = client.chat(
    parameters: {
      model: "gpt-3.5-turbo",
      messages: message_list
    }
  )

  # pp api_response.keys
  (1..50).each do
    print "-"
  end
  puts "\n"
  reply = api_response.fetch("choices").fetch(0).fetch("message").fetch("content")
  puts reply
  (1..50).each do
    print "-"
  end
  puts "\n"
  if question == "bye"
    close = true
  else
    close = false
  end
  i+=1
end 
