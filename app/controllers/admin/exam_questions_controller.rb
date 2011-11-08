# -*- coding: utf-8 -*-
class Admin::ExamQuestionsController < AdminController
  before_filter :load_curriculum

  def index
    @exam_questions = @curriculum.exam_questions
  end

  def show
    @exam_question = @curriculum.exam_questions.find(params[:id])
  end

  def new
    @exam_question = @curriculum.exam_questions.new()
  end

  def edit
    @exam_question = @curriculum.exam_questions.find(params[:id])
  end

  def create
    @exam_question = @curriculum.exam_questions.new(params[:exam_question])
    if @exam_question.save
      redirect_to([:admin, @curriculum, @exam_question], :notice => 'Exam question was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @exam_question = @curriculum.exam_questions.find(params[:id])
    if @exam_question.update_attributes(params[:exam_question])
      redirect_to([:admin, @curriculum, @exam_question], :notice => 'Exam question was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @exam_question = @curriculum.exam_questions.find(params[:id])
    @exam_question.destroy
    redirect_to(admin_curriculum_exam_questions_url)
  end

  private

  def load_curriculum
    @curriculum = Curriculum.find(params[:curriculum_id])
  end
end
