json.extract! my_thread, :id, :title, :content, :created_at, :updated_at
json.url my_thread_url(my_thread, format: :json)
