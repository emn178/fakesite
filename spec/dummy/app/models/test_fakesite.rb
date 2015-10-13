class TestFakesite < Fakesite::Base
  def parameters
    {:test_key1 => :value1, :test_key2 => :value2}
  end

  def return_url
    append_parameters(super, :return => 1)
  end

  def self.match(external_uri)
    external_uri.host == "test.com"
  end
end
