# -*- coding: utf-8 -*-
class ExamAnswer < ActiveRecord::Base
  belongs_to :user
  belongs_to :exam_question

  def self.answered(user_id, curriculum_id)
    where(:user_id => user_id).includes(:exam_question) & ExamQuestion.where(:curriculum_id => curriculum_id)
  end
end
