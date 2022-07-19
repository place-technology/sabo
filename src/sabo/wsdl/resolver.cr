module Sabo
  module WSDL
    class Resolver
      URL = /^http[s]?:/
      XML = /^</

      def self.resolve(document)
        raise ArgumentError.new("Unable to resolve: #{document.inspect}") unless document

        case document
        when URL then load_from_remote(document)
        when XML then document
        else          load_from_disc(document)
        end
      end

      private def self.load_from_remote(document)
        response = HTTP::Client.get(document)
        raise Exception.new("Error: #{response.status_code} for url #{document}") unless response.success?

        response.body
      end

      private def self.load_from_disc(document)
        File.read(document)
      end
    end
  end
end
