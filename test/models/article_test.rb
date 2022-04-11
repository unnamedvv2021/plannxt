require "test_helper"
require 'net/http'
require 'json'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  #test "should response json" do
  #  source = 'https://a950b6901ea94dafbe78d0bcd7a83fa8.vfs.cloud9.us-east-1.amazonaws.com/articles_json'
  #  resp = Net::HTTP.get_response(URI.parse(source))
  #  data = resp.body
  #  res = JSON.parse(data)
  #  assert_equal "Hello Rails", res["title"]
  #end
end
