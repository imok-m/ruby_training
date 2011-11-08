# -*- coding: utf-8 -*-
class Curriculum < ActiveRecord::Base
  has_attached_file :textbook

  has_many :exam_questions
  has_many :exam_answers, :through => :exam_questions

  def questions_count
    exam_questions.count
  end

  def answers_count(user_id = nil)
    answers = if user_id
      exam_answers.where(:user_id => user_id)
    else
      exam_answers
    end
    answers.count
  end

  def finished?(user_id)
    questions_count <= answers_count(user_id)
  end

  def unfinished?(user_id)
    !finished?(user_id)
  end
end
