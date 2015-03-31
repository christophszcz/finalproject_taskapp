class AssignmentsController < ApplicationController
	# before_filter :require_login_from_http_basic, only: [:create, :update]
	def new
		@assignment = Assignment.new
	end

	def create
		# old: @made_tasks              = Assignment.new(assignment_params)
		@assignment                     = Assignment.new(assignment_params)
		@assignment.customer            = current_user
		@assignment.updating_assignment = false

		# onclick current_user.id => worker_id
		if @assignment.save
			redirect_to assignments_path flash[:notice] =  "You have successfully posted a task!"
			# old: redirect_to assignment_path(@made_task.id)
		else 
			render :new
		end
	
	end


	# def show
	# 	  @assignment_manager = Assignment_manager.find(params[:id])
	# end

	# def index
	# 	@assignments = Assignment.search(params[:search])
	# 	@assignments = Assignment.order('assignments.created_at DESC').page(params[:page]).order(:name)
	# end

	def index
	  if params[:search]
	    @assignments = Assignment.all.search(params[:search]).order("created_at DESC")
	  else
	    @assignments = Assignment.all.order('created_at DESC')
	  end
	
	end

	def show
		@assignment = Assignment.find(params[:id])
	end

	def update
		@assignment        = Assignment.find(params[:id])
		@assignment.worker = current_user
		if @assignment.save
			flash[:notice] = "You have successfully accepted a task!"
			redirect_to assignment_path(@assignment) 
		else
			render :new
		end
	end

	# def edit
	# 	@assignment = Assignment.find(params[:id])
	# end

	def assign_me
		@assignment        = Assignment.find(params[:id])
		@assignment.worker = current_user
		@assignment.customer= Assignment.find(params[:id]).customer
		@assignment.save 
		UserMailer.exchange_information(@assignment).deliver_now
		
       # Instantiate a Twilio client
      client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])
      
      # Create and send an SMS message
      client.account.sms.messages.create(
        from: TWILIO_CONFIG['from'],
        to: @assignment.worker.phone,
        body: "You have selected to perform a Task on taskhackr.com. Please check your email messages for more details!"
      )
		client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])

		client.account.sms.messages.create(
        from: TWILIO_CONFIG['from'],
        to: @assignment.customer.phone, 
        body: "A taskhackr has chosen complete your task. Please check your email messages for more details!"
      )

		flash[:notice] = "An email as well as SMS reminder have been sent!"
		redirect_to assignment_path(@assignment)
	end

	private
		def assignment_params
		params.require(:assignment).permit(:title,
			:description,
			:price, 
			:date,
			:time,
			:customer_id,
			:worker_id
		)
		end
end
