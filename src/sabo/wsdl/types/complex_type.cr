require "./element"

module Sabo
  module WSDL
    module Types
      struct ComplexType
        getter name : String
        getter namespace : String
        property base_type : String?
        property elements : Array(Element)

        def initialize(@name, @namespace, @base_type = nil)
          @elements = [] of Element
        end
      end
    end
  end
end
