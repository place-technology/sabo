module Sabo
  struct Parameter
    alias Type = Int8 | Int16 | Int32 | Int64 | UInt8 | UInt16 | UInt32 | UInt64 | UInt128 | Float32 | Float64 | Bool | String | Array(Parameter) | Hash(String, Parameter)

    @value : Type
    @namespace : String?

    def initialize(@value : Type, *, @namespace = nil)
    end

    getter :value
    getter :namespace

    def self.from_hash(hash : Hash, *, namespace = nil)
      parameter = hash.reduce({} of String => Parameter) do |memo, (k, v)|
        raise "Could not parse key" if !k.is_a?(String)
        case v
        when Type  then memo[k] = Parameter.new(v)
        when Hash  then memo[k] = from_hash(v)
        when Array then memo[k] = from_array(v)
        when Nil
        else
          raise "Could not parse value"
        end

        memo
      end

      Parameter.new(parameter, namespace: namespace)
    end

    def self.from_array(array : Array, *, namespace = nil)
      parameter = array.reduce([] of Parameter) do |memo, v|
        case v
        when Type  then memo.push(Parameter.new(v))
        when Hash  then memo.push(from_hash(v))
        when Array then memo.push(from_array(v))
        when Nil
        else
          raise "Could not parse value"
        end

        memo
      end

      Parameter.new(parameter, namespace: namespace)
    end
  end
end
