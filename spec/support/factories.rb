module Factories
  def create_job(attributes = {})
    attributes[:email] ||= "fernando@example.com"
    attributes[:url] ||= "http://example.com/panama-papers"
    attributes[:time] ||= Time.now

    Job.create!(attributes)
  end
end
