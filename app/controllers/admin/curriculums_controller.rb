# -*- coding: utf-8 -*-
class Admin::CurriculumsController < AdminController
  def index
    @curriculums = Curriculum.order(:sort_order)
  end

  def show
    @curriculum = Curriculum.find(params[:id])
  end

  def new
    @curriculum = Curriculum.new
  end

  def edit
    @curriculum = Curriculum.find(params[:id])
  end

  def create
    @curriculum = Curriculum.new(params[:curriculum])
    if @curriculum.save
      render :success
    else
      render :failed
    end
  end

  def update
    @curriculum = Curriculum.find(params[:id])
    if @curriculum.update_attributes(params[:curriculum])
      render :success
    else
      render :failed
    end
  end

  def destroy
    @curriculum = Curriculum.find(params[:id])
    @curriculum.destroy
  end
end
