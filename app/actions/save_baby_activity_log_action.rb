# -*- encoding : utf-8 -*-
class SaveBabyActivityLogAction

  def self.execute(params)
    # TODO: adds attributes for query
    baby = Baby.find_by_id(params[:baby_id])
    if baby
      activity_log = baby.activity_logs.create(params)
      if activity_log.valid?
        [activity_log, true]
      else
        [{"message": activity_log.errors.messages }, false]
      end
    else
      [{"message": {"baby_is_required": "#{I18n.t 'baby_dont_exist'}"}}, false]
    end
  end
  
end