# -*- encoding : utf-8 -*-
class UpdateBabyActivityLogAction
  def self.execute(params, activity_log_id)
    # TODO: adds attributes for query
    activity = ActivityLog.find_by_id_and_baby_id(
      activity_log_id[:id],
      activity_log_id[:baby_id]
    )
    if activity
      activity_log = activity.update(params)
      if activity_log
        [activity, true]
      else
        if activity.errors.messages.empty?
          [{"message": {
            "activity_log_unexpected_problem": 
            "#{I18n.t 'activity_log_unexpected_problem'}"} }, false]
        else
          [{"message": activity.errors.messages }, false]
        end
      end
    else
      [{"message": {"activity_log_not_found": 
        "#{I18n.t 'activity_log_not_found'}"}}, false]
    end
  end
  
end