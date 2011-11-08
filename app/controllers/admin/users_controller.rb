# -*- coding: utf-8 -*-
class Admin::UsersController < AdminController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      render :success
    else
      render :failed
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      render :success
    else
      render :failed
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
end
