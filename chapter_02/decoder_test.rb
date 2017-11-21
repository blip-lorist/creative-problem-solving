require 'minitest/autorun'
require_relative 'decoder'

describe Decoder do
  before do
    @decoder = Decoder.new
  end

  describe "@alphabet_map" do
    it "is a hash that describe numbers and their corresponding alphabetical characters" do
      # Also known as the A1Z26 cipher
      assert_equal((1..26).to_a, @decoder.alphabet_map.keys)
      assert_equal(("A".."Z").to_a, @decoder.alphabet_map.values)
    end
  end

  describe "@states" do
    it "is an integer" do
      assert(@decoder.state.is_a?(Integer))
    end
  end


  describe "#to_letter" do
    it "it converts ints to letters using INT % 27" do
      assert_equal("R", @decoder.to_letter(18))
    end
  end
end
