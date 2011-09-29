require 'test_helper'

class CandidatesControllerTest < ActionController::TestCase
  setup do
    @candidate = candidates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:candidates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create candidate" do
    assert_difference('Candidate.count') do
      post :create, :candidate => @candidate.attributes
    end

    assert_redirected_to candidate_path(assigns(:candidate))
  end

  test "should show candidate" do
    get :show, :id => @candidate.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @candidate.to_param
    assert_response :success
  end

  test "should update candidate" do
    put :update, :id => @candidate.to_param, :candidate => @candidate.attributes
    assert_redirected_to candidate_path(assigns(:candidate))
  end

  test "should destroy candidate" do
    assert_difference('Candidate.count', -1) do
      delete :destroy, :id => @candidate.to_param
    end

    assert_redirected_to candidates_path
  end
end
