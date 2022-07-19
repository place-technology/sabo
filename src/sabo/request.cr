module Sabo
  class Request < Halite::Request
    def initialize(operation : String, body : Hash(String, Parameter)?, document : WSDL::Document, headers : HTTP::Headers = HTTP::Headers.new, version : String = "1.2", prefix : String = "http://www.example.com/")
      builder = Builder.new(version)

      case version
      when "1.1"
        headers.add("Content-Type", "text/xml;charset=utf-8")
      when "1.2"
        headers.add("Content-Type", "application/soap+xml;charset=utf-8")
      else
        raise Exception.new("Incorrect SOAP version was provided, please use 1.1 or 1.2.")
      end

      headers.add("SOAPAction", [prefix, operation].join)

      # TODO: Add SOAP headers.
      # The last parameter can be SOAP headers, but for now let's not use it
      body = builder.build(operation, document.namespace, body, nil)

      super("POST", document.endpoint, headers, body)
    end
  end
end
