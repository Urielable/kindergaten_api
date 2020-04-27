# -*- encoding : utf-8 -*-
class LoadActivityLogAction
  def self.execute(params = {})
    baby_id      = params.fetch(:baby_id, nil) != '0' ? params.fetch(:baby_id, nil) : nil
    assistant_id = params.fetch(:assistant_id, nil)  != '0' ? params.fetch(:assistant_id, nil) : nil
    status       = params.fetch(:status, nil)  != '0' ? params.fetch(:status, nil) : nil
    activity_logs = ActivityLog.activiy_logs_baby(baby_id, assistant_id, status)
    if activity_logs.blank?
      [{"message":{
        "activity_logs": "#{I18n.t 'activity_logs_not_found'}"
      }}, false]
    else
      [activity_logs, true]
    end
  end
end
