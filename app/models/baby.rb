class Baby < ApplicationRecord
  has_many :activity_logs

  def months
    ((Date.today - birthday).to_f / 365 * 12).round if birthday
  end
end
