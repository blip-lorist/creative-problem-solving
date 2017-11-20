require 'minitest/autorun'
require_relative 'luhn_checksum'

describe LuhnChecksum do
  before do
    @checksum = LuhnChecksum.new
  end

  describe "#double digit sum" do
    it "doubles the digit" do
      assert_equal(8, @checksum.double_digit_sum(4))
    end

    it "it sums the parts of doubled digits that can be divided by 10" do
      # double_digit_sum(9) 
      #  9 * 2 = 18
      #  1 + 8 = 9
      assert_equal(9, @checksum.double_digit_sum(9))
    end
  end

  describe "# print checksum" do
    it "prints the checksum of a number" do
      assert_equal(3, @checksum.get_checksum(7992739871))
    end
  end
end
