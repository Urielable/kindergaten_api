json.activities do
  json.array! @response do |activity|
    json.activity_log_id activity.id
    json.assistant_id activity.assistant_id
    json.baby_id activity.baby_id
    json.comments activity.comments
    json.assistant_name activity.assistant_name
    json.baby_name activity.baby_name
    json.start_time activity.start_time.utc
    json.stop_time activity.stop_time.utc if activity.stop_time
    json.status activity.status
  end
end 