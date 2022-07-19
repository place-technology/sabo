module Sabo
  module WSDL
    module Types
      struct Parameter
        getter name : String
        getter type : String

        def initialize(@name, @type)
        end
      end
    end
  end
end
