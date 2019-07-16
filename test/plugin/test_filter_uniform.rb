require "helper"
require "fluent/plugin/filter_uniform.rb"

class UniformFilterTest < Test::Unit::TestCase
  setup do
    Fluent::Test.setup
  end

  test "failure" do
    flunk
  end

  private

  def create_driver(conf)
    Fluent::Test::Driver::Filter.new(Fluent::Plugin::UniformFilter).configure(conf)
  end
end
