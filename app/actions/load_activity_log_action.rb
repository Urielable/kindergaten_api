# -*- encoding : utf-8 -*-
class LoadActivityLogAction
  def self.execute(baby_id)
      activity_logs = ActivityLog.activiy_logs_baby(baby_id)
      if activity_logs.blank?
        [{"message":{
          "activity_logs": "#{I18n.t 'activity_logs_not_found'}"
        }}, false]
      else
        [activity_logs, true]
      end
  end
end
