class Decoder
  attr_reader :alphabet_map
  attr_reader :state

  # States
  UPPERCASE   = 1
  LOWERCASE   = 2
  PUNCTUATION = 3

  def initialize
    @alphabet_map = build_alphabet_map
    @state = UPPERCASE #Starts with uppercase
  end


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

  def to_letter(integer)
    remainder = integer % 27
    self.alphabet_map[remainder]
  end
end
