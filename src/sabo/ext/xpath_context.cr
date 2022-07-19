module XML
  class XPathContext
    def register_namespace(prefix : Symbol, uri : String?)
      register_namespace(prefix.to_s, uri)
    end
  end
end
