module Fakesite
  class Base
    def initialize(options = {})
      @options = options
    end

    def id
    end

    def match(external_uri)
      false
    end

    def parameters(external_uri)
      {}
    end

    def return_parameters(params)
      params
    end

    def return_url(external_uri)
      params = query_to_hash(external_uri)
      params["return_url"] || '/'
    end

    def redirect_url(external_uri, params)
      append_parameters(return_url(external_uri), return_parameters(params))
    end

    protected

    def query_to_hash(uri)
      uri.query ? Hash[CGI.parse(uri.query).map {|key,values| [key, values[0] || true]}] : {}
    end

    def append_parameters(url, params)
      query_string = URI.encode_www_form(params)
      if query_string == ""
        return url
      else
        url + (url.include?('?') ? '&' : '?') + query_string
      end
    end
  end
end
