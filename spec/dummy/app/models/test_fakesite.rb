class TestFakesite < Fakesite::Base
	def id
		:test
	end

	def match(external_uri)
		external_uri.host == "test.com"
	end

	def parameters(external_uri)
		{:test_key1 => :value1, :test_key2 => :value2}
	end

	def return_url(external_uri)
		append_parameters(super(external_uri), :return => 1)
	end
end
