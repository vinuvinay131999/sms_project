class StudentsController < ApplicationController
  # before_action :signed_in_user
  # before_action :signed_in_student

  # ,except: [:index,:show]
  def show

    session[:student_id]= params[:id]
    @student = Student.find(params[:id])
  end


  def index
    if current_student.present?
      redirect_to "/students/#{current_student.id}"
    end
    @students = Student.all
  end



  def new
    @student = Student.new
  end


  def create
    # render plain: params[:student]
    @student = Student.create(student_params)
    if @student.save
      flash.notice ="Student Created"
    redirect_to students_path(@student)
    else
      # render 'new'
      # flash.alert ="Something went wrong"
      flash.alert =  @student.errors.full_messages
      # ="please make sure fill all the requried details"
      redirect_to new_student_path
      end
  end


  def edit
    @student = Student.find(params[:id])
  end



  def update

    @student = Student.find(params[:id])
    if @student.update(student_params)
      flash.notice = "#{@student.first_name}'s details updated successfully"
      redirect_to @student
    else
      flash.alert = ["Something prevented the student from getting updated", "please make sure you fill all the required details"]
      redirect_to students_path
      end
    end


  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end
end

  private
  def student_params
    params.require(:student).permit(:first_name,:last_name,:father_name,:mother_name,:date_of_birth,:blood_group,:standard,:contact_number,:email,:password)
  end
