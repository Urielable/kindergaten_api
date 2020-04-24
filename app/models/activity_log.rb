class ActivityLog < ApplicationRecord
  IN_PROGRESS = I18n.t 'in_progress'
  FINISHED = I18n.t 'finished'
  STATUS = [IN_PROGRESS, FINISHED]

  belongs_to :baby
  belongs_to :assistant
  belongs_to :activity

  validates :baby_id, presence: true
  validates :assistant_id, presence: true
  validates :activity_id, presence: true
  validates :start_time, presence: true


  scope :basic, -> {
    select(:id,
      :assistant_id,
      :baby_id,
      :comments,
      :start_time,
      :stop_time)
  }

  scope :assistant_info, -> {
    select('assistants.name as assistant_name')
    .joins(:assistant)
  }

  scope :activity_info, -> {
    select('activities.name as activity_name')
    .joins(:activity)
  }

  scope :baby_info, -> {
    select('babies.name as baby_name')
    .joins(:baby)
  }

  scope :filter_baby, -> (baby_id) {
    if baby_id && !baby_id.nil? && !baby_id.empty?
      where(baby_id: baby_id)
    end
  }    

  def self.activiy_logs_baby baby_id
    self.basic
    .assistant_info
    .activity_info
    .baby_info
    .filter_baby(baby_id)
  end

  def status
    stop_time.present? ? FINISHED : IN_PROGRESS
  end

end
