module Sabo
  module WSDL
    module Types
      struct Message
        getter name : String
        getter type : String?
        getter element : String?

        def initialize(@name, @element = nil, @type = nil)
        end
      end
    end
  end
end
