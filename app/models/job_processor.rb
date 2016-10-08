class JobProcessor
  def self.process_jobs_for_current_period
    Job.pending.for_current_period.each do |job|
      job.update_attributes sent: true
    end
  end
end
