require "../../src/sabo"

document = Sabo::WSDL::Document.new("http://www.dneonline.com/calculator.asmx?WSDL")
client = Sabo::Client.new(document: document, version: "1.2")

response = client.call(operation: "Add", body: {"intA" => Sabo::Parameter.new(5), "intB" => Sabo::Parameter.new(5)})
puts response.result

response = client.call(operation: "Subtract", body: {"intA" => Sabo::Parameter.new(10), "intB" => Sabo::Parameter.new(5)})
puts response.result

response = client.call(operation: "Divide", body: {"intA" => Sabo::Parameter.new(10), "intB" => Sabo::Parameter.new(2)})
puts response.result

response = client.call(operation: "Multiply", body: {"intA" => Sabo::Parameter.new(25), "intB" => Sabo::Parameter.new(25)})
puts response.result
