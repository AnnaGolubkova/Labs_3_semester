class FactorialController < ApplicationController
  def input
  end

  def view
	  result = ''
	  params[:v1].to_i.times { |number|
	    if number == 0 
	    	result = [['0','0']] 
	    else
		  number_10 = number.to_s
		    if number_10.reverse.eql?( number_10 ) 
		      number_copie = number.to_i
		      number_2 = ''
		      while number_copie != 0 
		          mod = number_copie % 2;
		          number_copie /= 2;
		          number_2 = mod.to_s + number_2.to_s; 
		      end

		      if number_2.reverse.eql?( number_2 )
		        result += [[number_10, number_2]]
		      end
		    end
		 end

	  }
	  @result = result

	  respond_to do |format|
	    format.html
	    format.xml do
	      render xml:{
	      	result: {
	      		description: 'Result',
	      		type: @result.class.to_s, 
	      		value: @result
	      	},
	      	text: {
            decimal: { type: 'String', value: 'decimal' },
            binary: { type: 'String', value: 'binary' },
            repeatcalculation: { type: 'String', value: 'repeat_calculation' }
            }
          }
	    end
	 end

   end
end 