module Sabo
  module WSDL
    module Types
      struct TypeDefinition
        getter type : String
        getter field : String?
        getter tag : String

        def initialize(@type, @field, @tag = nil)
        end
      end
    end
  end
end
