require 'test_helper'

class ExamAnswersControllerTest < ActionController::TestCase
  setup do
    @exam_answer = exam_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exam_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exam_answer" do
    assert_difference('ExamAnswer.count') do
      post :create, :exam_answer => @exam_answer.attributes
    end

    assert_redirected_to exam_answer_path(assigns(:exam_answer))
  end

  test "should show exam_answer" do
    get :show, :id => @exam_answer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @exam_answer.to_param
    assert_response :success
  end

  test "should update exam_answer" do
    put :update, :id => @exam_answer.to_param, :exam_answer => @exam_answer.attributes
    assert_redirected_to exam_answer_path(assigns(:exam_answer))
  end

  test "should destroy exam_answer" do
    assert_difference('ExamAnswer.count', -1) do
      delete :destroy, :id => @exam_answer.to_param
    end

    assert_redirected_to exam_answers_path
  end
end
