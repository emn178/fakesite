require 'yaml'

module Fakesite
  class Base
    attr_accessor :external_uri, :options, :params

    def initialize(options = {})
      self.options = options
    end

    def parameters
      {}
    end

    def return_parameters
      params
    end

    def return_url
      external_params["return_url"] || '/'
    end

    def redirect_url
      append_parameters(return_url, return_parameters)
    end

    def serialize
      YAML.dump(self)
    end

    def self.match(external_uri)
      false
    end

    def self.after_register
    end

    protected

    def external_params
      query_to_hash(external_uri)
    end

    def query_to_hash(uri)
      uri.query ? Hash[CGI.parse(uri.query).map {|key,values| [key, values[0] || true]}] : {}
    end

    def append_parameters(url, params)
      query_string = URI.encode_www_form(params || {})
      if query_string == ""
        return url
      else
        url + (url.include?('?') ? '&' : '?') + query_string
      end
    end
  end
end
