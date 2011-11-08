# -*- coding: utf-8 -*-
class CurriculumsController < ApplicationController
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
      redirect_to(@curriculum, :notice => 'Curriculum was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @curriculum = Curriculum.find(params[:id])
    if @curriculum.update_attributes(params[:curriculum])
      redirect_to(@curriculum, :notice => 'Curriculum was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @curriculum = Curriculum.find(params[:id])
    @curriculum.destroy
    redirect_to(curriculums_url)
  end
end
