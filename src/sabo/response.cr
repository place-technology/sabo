module Sabo
  class Response < Halite::Response
    getter operation : String

    def initialize(uri, conn, history, @operation : String)
      super(uri, conn, history)
    end

    def json
      JSON.parse(XMLConverter.new(XML.parse(self.body)).to_h.to_json)
    end

    def result
      json
        .["Envelope"]
        .["Body"]
        .[[operation, "Response"].join]
        .[[operation, "Result"].join]
    end
  end
end
