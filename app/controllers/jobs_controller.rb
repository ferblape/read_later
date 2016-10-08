class JobsController < ApplicationController
  def create
    job = Job.new job_params
    if job.save
      render json: {}, status: :created
    else
      render json: job.errors.full_messages.to_json, status: :bad_request
    end
  end

  private

  def job_params
    params.require(:job).permit(:email, :url, :time)
  end
end
