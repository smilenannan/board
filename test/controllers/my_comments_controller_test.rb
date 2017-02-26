require 'test_helper'

class MyCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_comment = my_comments(:one)
  end

  test "should get index" do
    get my_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_my_comment_url
    assert_response :success
  end

  test "should create my_comment" do
    assert_difference('MyComment.count') do
      post my_comments_url, params: { my_comment: { content: @my_comment.content, my_thread_id: @my_comment.my_thread_id } }
    end

    assert_redirected_to my_comment_url(MyComment.last)
  end

  test "should show my_comment" do
    get my_comment_url(@my_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_my_comment_url(@my_comment)
    assert_response :success
  end

  test "should update my_comment" do
    patch my_comment_url(@my_comment), params: { my_comment: { content: @my_comment.content, my_thread_id: @my_comment.my_thread_id } }
    assert_redirected_to my_comment_url(@my_comment)
  end

  test "should destroy my_comment" do
    assert_difference('MyComment.count', -1) do
      delete my_comment_url(@my_comment)
    end

    assert_redirected_to my_comments_url
  end
end
