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

    describe "#update_states" do
      it "cycles through states and in the correct order" do
        expected_states = [Decoder::UPPERCASE, Decoder::LOWERCASE, Decoder::PUNCTUATION, Decoder::UPPERCASE]

        expected_states.each do |expected_state|
          assert_equal(expected_state, @decoder.state)
          @decoder.update_state
        end
      end
    end
  end


  describe "#decode" do
    it "it converts ints to letters using INT % 27" do
      assert_equal("R", @decoder.decode([18]))
    end

    it "can switch states based on integer input" do
      assert_equal("Yes", @decoder.decode([241,0,32,20620,27]))
    end
  end
end
