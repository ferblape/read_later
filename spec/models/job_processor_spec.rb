require 'rails_helper'

RSpec.describe JobProcessor, type: :model do
  describe '.process_jobs_for_current_period' do
    let(:current_time) { Time.parse('2016-10-13 17:13:00') }
    let(:job_time) { Time.parse('2016-10-13 17:00:00') }
    let(:summary) { Summary.new(title: 'Page title', body: 'This is the body') }

    it 'should process only jobs for the current period' do
      Timecop.freeze current_time

      allow_any_instance_of(WebScraper).to receive(:scrape).and_return(summary)
      allow(UserMailer).to receive(:deliver_summary).and_return(double(deliver_now: true))

      job1 = create_job time: job_time - 2.hours, sent: false
      job2 = create_job time: job_time, sent: false
      job3 = create_job time: job_time, sent: false
      job4 = create_job time: job_time + 1.hour, sent: false

      expect(Job).to receive(:pending_for_current_period).and_return([job1, job2, job3])

      JobProcessor.process_jobs_for_current_period

      job1.reload
      job2.reload
      job3.reload
      job4.reload

      expect(job1).to be_sent
      expect(job2).to be_sent
      expect(job3).to be_sent
      expect(job4).to_not be_sent
    end
  end
end
