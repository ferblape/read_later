class Job < ApplicationRecord
  validates :email, presence: true, email: true
  validates :url, presence: true, url: true
  validates :time, presence: true, timestamp: true
end
