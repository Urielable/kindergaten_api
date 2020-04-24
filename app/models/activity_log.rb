class ActivityLog < ApplicationRecord

  belongs_to :baby
  belongs_to :assistant
  belongs_to :activity

  validates :baby_id, presence: true
  validates :assistant_id, presence: true
  validates :activity_id, presence: true
  validates :start_time, presence: true
end
