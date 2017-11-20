class LuhnChecksum
  def double_digit_sum(digit)
    # Takes an input integer and doubles it. If the doubled number is greater than 10, then sum the two digits in the double number 
    # So if the doubled number is 14, return 1 + 4

    double_digit = digit * 2
    if double_digit  >= 10
        sum = 1 + (double_digit % 10)
    else
        sum = double_digit
    end
  end

  def get_checksum(number)
    # Luhn's algorithm works from the right to left of the number
    reverse_number = number.to_s.reverse
    digit_array = reverse_number.split("")

    sum = 0
    digit_array.each_with_index do |digit, index|
      digit = digit.to_i
      cardinal_place = index + 1

      if 1 == (cardinal_place % 2)
        # Double every other number, starting with the first digit from the right
        # Add the doubled number to the sum
        sum += double_digit_sum(digit)
      else
        # If the cardinal place is even, just add the digit to the sum
        sum += digit
      end
    end

    # Sum + check_digit must be divisible by 10
    # If sum is 67, then check_digit = 3
    check_digit = 10 - (sum % 10)
  end
end
