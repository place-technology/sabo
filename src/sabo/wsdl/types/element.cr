module Sabo
  module WSDL
    module Types
      struct Element
        getter name : String
        property type : String?
        property nillable : String?
        property minOccurs : String?
        property maxOccurs : String?

        def initialize(@name, @type = nil, @nillable = nil, @minOccurs = nil, @maxOccurs = nil)
        end
      end
    end
  end
end
