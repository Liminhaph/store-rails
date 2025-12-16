require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "product must have name" do
    product = Product.new
    assert_not product.save
  end
end
