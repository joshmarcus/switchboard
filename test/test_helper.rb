ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  def login_as(user)
    @request.cookies[:auth_token] = (user ? users(user).auth_token : nil)
  end

  def assert_links_to(href, content=nil,message=nil)
    assert_tag tag: 'a', content: content, attributes: { href: href }
  end

  def assert_does_not_link_to(href, content=nil,message=nil)
    assert_tag tag: 'a', content: content, attributes: { href: href }, count: 0
  end
end
