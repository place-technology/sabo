module Sabo
  class Builder
    getter version : String

    def initialize(@version : String = "1.2")
    end

    def build(op_name, tns, body_parameters : Hash(String, Parameter)? = nil, input_headers : Hash(String, Parameter)? = nil)
      case @version
      when "1.1"
        XML.build(indent: "") do |xml|
          xml.element("Envelope", {"xmlns" => "http://schemas.xmlsoap.org/soap/envelope/"}) do
            build_header(xml, input_headers) if input_headers
            build_body(op_name, tns, xml, body_parameters)
          end
        end
      when "1.2"
        XML.build(indent: "") do |xml|
          xml.element("Envelope", {"xmlns" => "http://www.w3.org/2003/05/soap-envelope"}) do
            build_header(xml, input_headers) if input_headers
            build_body(op_name, tns, xml, body_parameters)
          end
        end
      end
    end

    def build_header(xml, input_headers)
      xml.element("Header") do
        input_headers.each do |k, v|
          add_element(xml, k, v)
        end
      end
    end

    def build_body(op_name, tns, xml, body_parameters)
      xml.element("Body") do
        xml.element(op_name, {"xmlns" => tns}) do
          if body_parameters
            body_parameters.each do |k, v|
              add_element(xml, k, v)
            end
          end
        end
      end
    end

    def add_element(xml, key, element)
      attributes = {} of String => String
      attributes["xmlns"] = element.namespace.not_nil! if element.namespace

      xml.element(key, attributes) do
        case (value = element.value)
        when Hash
          value.each do |k, v|
            add_element(xml, k, v)
          end
        when Array
          value.each do |v|
            add_element(xml, key, v)
          end
        else
          xml.text(value.to_s)
        end
      end
    end
  end
end
