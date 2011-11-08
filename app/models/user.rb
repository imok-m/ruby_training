# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  acts_as_authentic

  has_many :exam_answers

  def admin?
    admin_flag
  end
end
