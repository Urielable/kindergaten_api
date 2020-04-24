json.activity_log do
  json.activity_log_id @activity_log.id
  json.assistant_id @activity_log.assistant_id
  json.baby_id @activity_log.baby_id
  json.comments @activity_log.comments
  json.start_time @activity_log.start_time.to_formatted_s(:iso8601)
  json.stop_time @activity_log.stop_time.to_formatted_s(:iso8601) if @activity_log .stop_time
  json.status @activity_log.status
end 