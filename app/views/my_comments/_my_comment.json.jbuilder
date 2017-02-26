json.extract! my_comment, :id, :content, :my_thread_id, :created_at, :updated_at
json.url my_comment_url(my_comment, format: :json)
