class Job < ApplicationRecord
  validates :email, presence: true, email: true
  validates :url, presence: true, url: true
  validates :time, presence: true, timestamp: true

  scope :pending_for_current_period, ->{ where(sent: false).where("time <= ?", Time.now.beginning_of_hour.utc) }

  def process!
    summary = WebScraper.new.scrape(self.url)
    UserMailer.deliver_summary(email: self.email, summary: summary).deliver_now
    self.update_attributes sent: true
  end
end
