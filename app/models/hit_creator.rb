class HitCreator
	extend ApplicationHelper

	DEFAULT_DESCRIPTION = "Please rate the following video 1-10 (ten being the best)"
	DEFAULT_PRICE        = 0.05


	def self.create(question)
		host = "https://eight-ball.herokuapp.com"
		hit_title = question.title
		hit_description = question.description
		model_name = :Question
		num_assignments = 3
		reward = DEFAULT_PRICE
		hit_lifetime = 5
		duration = nil
		qualifications = {}
		params = {:question_id => question.id}
		opts = {:form_url => question.response_url}


    # create_hit(host, hit_title, hit_description, typ, num_assignments, reward, lifetime,
    #                     duration = nil, qualifications = {}, params = {}, opts = {})

		hit = Turkee::TurkeeTask.create_hit(host, hit_title, hit_description, model_name,
																				num_assignments, reward, hit_lifetime,
																				duration, qualifications, params, opts)
		question.update_attribute(:hit_id, hit.hit_id)
	end

end