module Halite
  class Client
    def perform(request : Halite::Request, options : Halite::Options) : Halite::Response
      raise RequestError.new("SSL context given for HTTP URI = #{request.uri}") if request.scheme == "http" && options.tls

      conn = make_connection(request, options)
      conn_response = conn.exec(request.verb, request.full_path, request.headers, request.body)
      handle_response(request, conn_response, options)
    rescue ex : IO::TimeoutError
      raise TimeoutError.new(ex.message)
    rescue ex : Socket::Error
      raise ConnectionError.new(ex.message)
    end
  end
end
