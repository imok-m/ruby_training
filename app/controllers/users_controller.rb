# -*- coding: utf-8 -*-
class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      render :success
    else
      render :failed
    end
  end
end
