class ResponsesController < ApplicationController

	def new
		@question = Question.where(:status => "open").limit(1).first
		redirect_to no_hits_responses_path unless @question
		@response = @question.responses.new
		@disabled = Turkee::TurkeeFormHelper::disable_form_fields?(params)
	end

	def create
		@response = Response.create(params[:response])
		if @response
			redirect_to response_path(@response)
		else
			redirect_to :back
		end
	end

	def show
		@response = Response.find(params[:id])
	end

	def no_hits
	end
end