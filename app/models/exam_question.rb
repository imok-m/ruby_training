# -*- coding: utf-8 -*-
class ExamQuestion < ActiveRecord::Base
  belongs_to :curriculum
  has_many :exam_answers
end
