module Sabo
  module WSDL
    module Types
      struct TypeNamespace
        getter type : String
        getter field : String?
        getter namespace : String

        def initialize(@type, @namespace, @field = nil)
        end
      end
    end
  end
end
