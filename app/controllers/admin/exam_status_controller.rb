# -*- coding: utf-8 -*-
class Admin::ExamStatusController < AdminController
  before_filter :load_user

  def index
    @curriculums = Curriculum.all
  end

  def show
    @curriculum = Curriculum.find(params[:id])
    @questions = @curriculum.exam_questions
    @answers = @curriculum.exam_answers.where(:user_id => params[:user_id]).index_by(&:exam_question_id)
  end

  def update
    ExamAnswer.transaction {
      params[:score] && params[:score].each {|exam_question_id, score|
        exam_answer = ExamAnswer.where(:user_id => params[:user_id], :exam_question_id => exam_question_id).first
        exam_answer.score = score
        exam_answer.save!
      }
    }
    redirect_to admin_user_exam_status_path
  rescue
    redirect_to admin_user_exam_state_path(params[:curriculum_id])
  end

  private

  def load_user
    @user = User.find(params[:user_id])
  end
end
