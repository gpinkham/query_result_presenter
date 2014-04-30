dir = File.dirname(File.expand_path(__FILE__))
$LOAD_PATH.unshift dir + '/../lib'

require 'test/unit'
require "mocha/setup"
require "shoulda-context"

require "query_result_presenter"
