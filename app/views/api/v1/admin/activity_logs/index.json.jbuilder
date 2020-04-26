json.activities do
  json.array! @activity_log do |activity|
    json.activity_log_id activity.id
    json.assistant_id activity.assistant_id
    json.baby_id activity.baby_id
    json.comments activity.comments
    json.assistant_name activity.assistant_name
    json.activity_name activity.activity_name
    json.duration activity.stop_time.present? ? ((activity.stop_time - activity.start_time) / 60).to_i : 0
    json.baby_name activity.baby_name
    json.start_time activity.start_time.to_formatted_s('YYYY-MM-DD HH:MM:SS UTC')
    json.stop_time activity.stop_time.to_formatted_s('YYYY-MM-DD HH:MM:SS UTC') if activity.stop_time
    json.status activity.status
  end
end 