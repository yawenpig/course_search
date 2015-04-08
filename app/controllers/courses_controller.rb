class CoursesController < ApplicationController

	def index
		@courses=Course.all
		if params[:name].present?
			@courses=@courses.where("name like ?", "%#{params[:name]}%")
		end

		if params[:teache].present?
			@courses=@courses.where("teache like ?", "%#{params[:teache]}%")
		end

		if params[:time]
			@courses=@courses.where("time like ?", "%#{params[:time]}%")
		end

	end

	def new
		@course=Course.new
	end	

	def create
		@course=Course.new(course_params)
		if @course.save
			redirect_to courses_path
		else
			render :new
		end	
	end

	def show
		@course=Course.find(params[:id])
	end

	def edit
		@course=Course.find(params[:id])
	end

	def update
		@course=Course.find(params[:id])
		if @course.update(course_params)
			redirect_to course_path
		else
			render :edit
		end
	end

	def destroy
		@course=Course.find(params[:id])
		@course.destroy
		redirect_to root_path
	end	

	private
	def course_params
		params.require(:course).permit(:name, :teache, :place, :time, :credit)
	end

end
