# -*- coding: utf-8 -*-
class ExamAnswersController < ApplicationController
  before_filter :load_curriculum, :load_exam_question

  def index
    @questions = @curriculum.exam_questions
    @answers = @curriculum.exam_answers.where(:user_id => current_user.id).index_by(&:exam_question_id)
  end

  def show
    @exam_answer = ExamAnswer.find(params[:id])
  end

  def new
    @exam_answer = ExamAnswer.new
  end

  def edit
    @exam_answer = ExamAnswer.find(params[:id])
  end

  def create
    @exam_answer = @exam_question.exam_answers.new(params[:exam_answer])
    @exam_answer.user_id = current_user.id
    if @exam_answer.save
      next_question = @curriculum.exam_questions.where("number > ?", @exam_question.number).order(:number).first
      if next_question
        redirect_to new_curriculum_exam_question_exam_answer_path(@curriculum, next_question)
      else
        render 'finished'
      end
    else
      render :action => "new"
    end
  end

  def update
    @exam_answer = ExamAnswer.find(params[:id])

    respond_to do |format|
      if @exam_answer.update_attributes(params[:exam_answer])
        format.html { redirect_to(@exam_answer, :notice => 'Exam answer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @exam_answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @exam_answer = ExamAnswer.find(params[:id])
    @exam_answer.destroy

    respond_to do |format|
      format.html { redirect_to(exam_answers_url) }
      format.xml  { head :ok }
    end
  end

  private

  def load_curriculum
    @curriculum = Curriculum.find(params[:curriculum_id])
  end

  def load_exam_question
    @exam_question = ExamQuestion.find(params[:exam_question_id]) if params[:exam_question_id]
  end
end
