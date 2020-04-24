json.activities do
  json.array! @activity_log do |activity|
    json.activity_log_id activity.id
    json.assistant_id activity.assistant_id
    json.baby_id activity.baby_id
    json.comments activity.comments
    json.assistant_name activity.assistant_name
    json.baby_name activity.baby_name
    json.start_time activity.start_time.to_formatted_s(:iso8601)
    json.stop_time activity.stop_time.to_formatted_s(:iso8601) if activity.stop_time
    json.status activity.status
  end
end 