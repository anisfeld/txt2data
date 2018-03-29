class DescriptionsController < ApplicationController
	def new
		@description = Description.new
	end

	def create

		
		@description = Description.new(:flex_good_tf => params["description"]["flex_good_tf"],
							:flex_good => params["description"]["flex_good"],
							:flex_bad_tf => params["description"]["flex_bad_tf"],
							:flex_bad => params["description"]["flex_bad"],
							:work_from_home_tf => params["description"]["work_from_home_tf"],
							:work_from_home => params["description"]["work_from_home"],
							:benefits_string => params["description"]["benefits_string"],
							:txt_id => params["description"]["tid"])



		if @description.save
        	tid = params["description"]["tid"].next
    	else
        	tid = params["description"]["tid"]
   		end
   		# take id
   		redirect_to "/descriptions/new/#{tid}"
	end

	# private

	# def description
	#     params["description"].require(:description).permit!
	# end
end