class Job < ApplicationRecord
  validates :email, presence: true, email: true
  validates :url, presence: true, url: true
  validates :time, presence: true, timestamp: true

  scope :pending, ->{ where(sent: false) }
  scope :for_current_period, ->{ where("time <= ?", Time.now.beginning_of_hour.utc) }
end
