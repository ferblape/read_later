require 'rails_helper'

RSpec.describe JobProcessor, type: :model do
  describe '.process_jobs_for_current_period' do
    let(:current_time) { Time.parse('2016-10-13 17:13:00') }
    let(:job_time) { Time.parse('2016-10-13 17:00:00') }

    it 'should process only jobs for the current period' do
      Timecop.freeze current_time

      job1 = create_job time: job_time - 2.hours, sent: false
      job2 = create_job time: job_time, sent: false
      job3 = create_job time: job_time, sent: false
      job4 = create_job time: job_time + 1.hour, sent: false

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
