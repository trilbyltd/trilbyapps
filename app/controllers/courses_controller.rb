class CoursesController < ApplicationController

def index
	@courses = Course.all

	respond_to do |format|
      format.html # index.html.erb
      format.xml { render xml: @courses}
      format.json { render json: @courses }
    end
end

def show
	@course = Course.find(params[:id])

	respond_to do |format|
      format.html # show.html.erb
      format.xml { render xml: @course }
      format.json { render json: @course }
    end
end

def new
	@course = Course.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
end

def create
  @course = Course.new(params[:course])

	respond_to do |format|
      if @course.save
        format.html { redirect_to courses_url, notice: 'Course was successfully created.' }
        format.json { render json: @course, status: :created, location: @course }
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
end

def edit
	@course = Course.find(params[:id])
end

def update
	@course = Course.find(params[:id])
end

def destroy
	@course = Course.find(params[:id])
end

end
