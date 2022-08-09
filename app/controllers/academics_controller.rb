class AcademicsController < ApplicationController
  before_action :set_student, except: [:update,:create]

  def new

    # if session[:student_id] != nil
      @academic = Academic.new
      if @student.academics.count !=0
        @student.academics.each do |a|
          if a.exam_type == params[:exam_type].capitalize
            flash.alert = "#{params[:exam_type].capitalize} already exists.\n You can edit this"

            @academic = Academic.find(a.id)
            redirect_to '/academics/'+@student.id.to_s+'/edit?exam_type='+params[:exam_type]
          end

      end
      # end
    # else
    #   flash.alert = "select a student"
    #   redirect_to students_path
    end

  end
  # def index
  #   @student = Student.find(session[:student_id])
  # #
  # end

  def create
    # debugger
    @academic = Academic.new(academic_params)
    @academic.student_id = session[:student_id]
    if @academic.save
      flash.notice = "academics created for #{Student.find(session[:student_id]).first_name}"
      redirect_to students_path
    else

      flash.alert = "something went wrong"
      redirect_to students_path
    end
  end



  def edit

    if params[:exam_type] == 'quarterly'
      @academic = Academic.find(@student.academics[0].id)
    elsif params[:exam_type] == 'half-yearly'
      @academic = Academic.find(@student.academics[1].id)
    elsif params[:exam_type] == 'annual'
      @academic = Academic.find(@student.academics[2].id)
    end
    p @academic
  end


  def update

    @academic = Academic.find(params[:id])
    @student = @academic.student
    if @academic.update(academic_params)
      flash.notice = "#{@student.first_name}'s #{params[:exam_type]} updated successfully"
      redirect_to @student
    else

      flash.alert = "something went wrong"
      redirect_to students_path
    end
  end

  private

  def set_academic

  end

  def academic_params
     params.require(:academic).permit(:english, :maths, :science, :social, :computer, :exam_type)
  end

  def set_student
     @student = Student.find(session[:student_id])
    # @student = Student.find(params[:id])
  end
end




