class JobProcessor
  def self.process_jobs_for_current_period
    Job.pending.for_current_period.each do |job|
      summary = WebScraper.new.scrape(job.url)
      UserMailer.deliver_summary(email: job.email, summary: summary).deliver_now
      job.update_attributes sent: true
    end
  end
end
