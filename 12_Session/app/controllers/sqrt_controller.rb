class SqrtController < ApplicationController
  def input
  end

  def view
    @result = []
    params[:v1].to_i.times { |number|
      number_10 = number.to_s
      number_2 = binary number
      if number_10.reverse.eql?( number_10 ) and number_2.reverse.eql?( number_2 )
        @result += [[number_10, number_2]]
      end
    }
  end

  private
  def binary (number)
    number_2 = '0' if number == 0
    while number != 0
      mod = number % 2
      number /= 2
      number_2 = mod.to_s + number_2.to_s
    end
    number_2
  end

end
