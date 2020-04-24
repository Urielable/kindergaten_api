class Activity < ApplicationRecord
  belongs_to :baby
  belongs_to :assistant
  belongs_to :activity
end
