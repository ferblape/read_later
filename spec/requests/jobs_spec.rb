require 'rails_helper'

RSpec.describe "Jobs", type: :request do
  describe "POST /jobs" do
    let(:time) { "Sun Oct 09 2016 12:36:14 GMT+0200 (CEST)" }

    it "with valid attributes, creates a job" do
      post jobs_path, params: { job: { email: 'fulano@example.com', time: time, url: 'http://example.com/panama-papers'}}, as: :json
      expect(response).to have_http_status(:created)

      last_job = Job.last
      expect(last_job.email).to eq('fulano@example.com')
      expect(last_job.url).to eq('http://example.com/panama-papers')
    end

    it "with invalid attributes, returns an error" do
      post jobs_path, params: { job: { email: 'fulano', time: time, url: 'http://example.com/panama-papers'}}, as: :json
      expect(response).to have_http_status(:bad_request)

      expect(Job.count).to eq(0)
    end
  end
end
