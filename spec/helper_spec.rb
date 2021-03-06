require 'rubygems'
require 'bundler/setup'

require 'ebay_commerce'

require 'vcr'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
	# Run specs in random order to surface order dependencies. If you find an
	# order dependency and want to debug it, you can fix the order by providing
	# the seed, which is printed after each run.
	#     --seed 1234
	config.order = 'random'

	config.expect_with :rspec do |c|
		c.syntax = :expect
	end

	# some (optional) config here
	config.after(:each) do
		EbayCommerce.reset
	end
end