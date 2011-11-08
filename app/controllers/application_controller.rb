# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user_session, :current_user
  before_filter :require_login

  private

  def current_user_session
    @current_user_session ||= UserSession.find
  end

  def current_user
    @current_user ||= current_user_session && current_user_session.user
  end

  def require_login
    redirect_to login_path unless current_user
  end

  def render_form_dialog(options = {})
    @template = options[:partial]
    @title = options[:title]
    render "dialog/form"
  end

  def render_show_dialog(options = {})
    @template = options[:partial]
    @title = options[:title]
    render "dialog/show"
  end

  def render_notify_dialog(options = {})
    @template = options[:partial]
    @title = options[:title]
    @reload_url = options[:reload_url]
    render "dialog/notify"
  end
end
