class ActivityLog < ApplicationRecord
  IN_PROGRESS = I18n.t 'in_progress'
  FINISHED = I18n.t 'finished'
  STATUS = [IN_PROGRESS, FINISHED]

  before_save :calculate_duration

  belongs_to :baby
  belongs_to :assistant
  belongs_to :activity

  validates :baby_id, presence: true
  validates :assistant_id, presence: true
  validates :activity_id, presence: true
  validates :start_time, presence: true

  validate :validate_stop_time, on: :update

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
    select('CONCAT(babies.name, " ", babies.father_name, " ", babies.mother_name) as baby_name')
    .joins(:baby)
  }

  scope :filter_baby, -> (baby_id) {
    if baby_id && !baby_id.nil? && !baby_id.empty?
      where(baby_id: baby_id)
    end
  }

  scope :filter_assistant, -> (assistant_id) {
    if assistant_id && !assistant_id.nil? && !assistant_id.empty?
      where(assistant_id: assistant_id)
    end
  }

  scope :filter_status, -> (status) {
    if status == FINISHED
      finished
    elsif status == IN_PROGRESS
      in_progress
    end
  }

  def self.activiy_logs_baby baby_id, assistant_id, status
    self.basic
    .assistant_info
    .activity_info
    .baby_info
    .filter_baby(baby_id)
    .filter_assistant(assistant_id)
    .filter_status(status)
  end

  def status
    stop_time.present? ? FINISHED : IN_PROGRESS
  end

  private
    def calculate_duration
      if self.stop_time.present?
        self.duration = ((self.stop_time - self.start_time) / 60).to_i
      end
    end

    def validate_stop_time
      if self.stop_time.present?
        if self.stop_time <= self.start_time
          errors.add(:activity_log, I18n.t('validate_stop_time'))
        end
      end
    end

end
