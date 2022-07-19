require "./parameter"

module Sabo
  module WSDL
    module Types
      struct Operation
        getter name : String
        getter action : String
        getter inputs : Array(Message)
        getter outputs : Array(Message)?
        getter namespace_identifier : String?
        property parameters : Array(Parameter)

        def initialize(@name, @action, @inputs, @outputs = nil, @namespace_identifier = nil, @parameters = [] of Parameter)
        end
      end
    end
  end
end
