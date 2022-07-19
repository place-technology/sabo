module Sabo
  class Client
    getter document : WSDL::Document
    getter version : String

    def initialize(@document : WSDL::Document, @prefix : String = "http://www.example.com/", @version : String = "1.2")
    end

    def call(operation : String, body : Hash(String, Parameter), headers : HTTP::Headers = HTTP::Headers.new)
      client = Halite::Client.new
      request = Request.new(operation, body, @document, headers, @version, @prefix)
      response = client.perform(request, client.options)

      if response.status_code != 200
        pp response.body
        raise Exception.new("Received a #{response.status_code} status code from the server.")
      end

      Response.new(response.uri, response.conn, response.history, operation)
    end

    def operation(operation : String)
      document.operations[operation]
    end

    def operations
      document.operations.map do |k, _v|
        k
      end
    end
  end
end
