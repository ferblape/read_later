class JobProcessor
  def self.process_jobs_for_current_period
    Job.pending_for_current_period.each do |job|
      job.process!
    end
  end
end
