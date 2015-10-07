# Fakesite

[![Build Status](https://api.travis-ci.org/emn178/fakesite.png)](https://travis-ci.org/emn178/fakesite)
[![Coverage Status](https://coveralls.io/repos/emn178/fakesite/badge.svg?branch=master)](https://coveralls.io/r/emn178/fakesite?branch=master)

An rails plugin that provides a stub framework to stub 3-party redirect page such as payment or oauth login.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fakesite', group: :development
```

And then execute:

    bundle

### Route
Add fakesite route in your `config/route.rb`
```Ruby
mount Fakesite::Engine => "/fakesite" if Rails.env.development?
```

## Usage

### Create Your Fakesite

Inherit `Fakesite::Base` class and implement methods:

```ruby
class TestFakesite < Fakesite::Base
	# assign an unique id for this fakesite
	def id
		:test
	end

	# implement the rule to stub external page by redirect url
	def match(external_uri)
		external_uri.host == "test.com"
	end

	# specify what the parameters will return to your site
	def parameters(external_uri)
		{:test_key1 => :value1, :test_key2 => :value2}
	end

	# overwrite where to return, default using return_url in external_uri query string if exsit
	def return_url(external_uri)
		params = query_to_hash(external_uri)
		params["custom_url"]
	end
end
```

### Register Fakesite
You can register your fakesites when rails initialize.
```Ruby
if Rails.env.development?
	Fakesite.register TestFakesite.new
	# You can also pass some options if needs, and using by @options in your class
	# Fakesite.register TestFakesite.new {:your => :option}
end
```

You can put the registration in `config/initializers/fakesite.rb`

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Contact
The project's website is located at https://github.com/emn178/fakesite  
Author: emn178@gmail.com
