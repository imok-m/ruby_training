# -*- coding: utf-8 -*-
class AdminController < ApplicationController
  before_filter :require_admin

  private

  def require_admin
    redirect_to logout_url unless current_user && current_user.admin?
  end
end
