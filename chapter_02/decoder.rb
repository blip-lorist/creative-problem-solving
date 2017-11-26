class Decoder
  attr_reader :alphabet_map
  attr_accessor :state

  # States
  UPPERCASE   = 1
  LOWERCASE   = 2
  PUNCTUATION = 3

  STATES_AND_DIVISORS = {
    1 => 27,
    2 => 27,
    3 => 9,
  }

  def initialize
    @alphabet_map = build_alphabet_map
    @state = UPPERCASE #Starts with uppercase
  end

  def decode(integer_array)

    message = []
    integer_array.each do |integer|
      divisor = STATES_AND_DIVISORS[self.state]
      remainder = integer % divisor

      if remainder == 0
        self.update_state
      else
        letter = self.alphabet_map[remainder]
        letter = letter.downcase if self.state == Decoder::LOWERCASE
        message << letter
      end
    end

    message.join("")
  end

  def update_state
    if self.state < 3
      self.state += 1 # increment
    else
      self.state = 1 # reset
    end
  end

  private

  def build_alphabet_map
    # Creates a map like: 
    # {
    #   1 => "A",
    #   2 => "B",
    #   ...
    # }

    alphabet_map = Hash.new
    alphabet = ("A".."Z").to_a
    (1..26).each_with_index do |number, index|
      alphabet_map[index + 1] =  alphabet[index]
    end
    alphabet_map
  end
end
