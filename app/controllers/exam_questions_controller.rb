# -*- coding: utf-8 -*-
class ExamQuestionsController < ApplicationController
  before_filter :load_curriculum
  
  def index
    redirect_to new_curriculum_exam_question_exam_answer_path(@curriculum, @curriculum.exam_questions.order(:number).first)
  end

  def show
    @exam_question = @curriculum.exam_questions.find(params[:id])
  end

  # GET /exam_questions/new
  # GET /exam_questions/new.xml
  def new
    @exam_question = ExamQuestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @exam_question }
    end
  end

  # GET /exam_questions/1/edit
  def edit
    @exam_question = ExamQuestion.find(params[:id])
  end

  # POST /exam_questions
  # POST /exam_questions.xml
  def create
    @exam_question = ExamQuestion.new(params[:exam_question])

    respond_to do |format|
      if @exam_question.save
        format.html { redirect_to(@exam_question, :notice => 'Exam question was successfully created.') }
        format.xml  { render :xml => @exam_question, :status => :created, :location => @exam_question }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @exam_question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /exam_questions/1
  # PUT /exam_questions/1.xml
  def update
    @exam_question = ExamQuestion.find(params[:id])

    respond_to do |format|
      if @exam_question.update_attributes(params[:exam_question])
        format.html { redirect_to(@exam_question, :notice => 'Exam question was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @exam_question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_questions/1
  # DELETE /exam_questions/1.xml
  def destroy
    @exam_question = ExamQuestion.find(params[:id])
    @exam_question.destroy

    respond_to do |format|
      format.html { redirect_to(exam_questions_url) }
      format.xml  { head :ok }
    end
  end
  
  private

  def load_curriculum
    @curriculum = Curriculum.find(params[:curriculum_id])
  end
end
