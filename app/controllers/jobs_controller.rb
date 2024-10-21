class JobsController < ApplicationController
  before_action :set_job, only: [:show, :update, :destroy]

  def index
    @jobs = Job.all
    render json: @jobs
  end

  def show
    render json: @job
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      render json: @job, status: :created
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def update
    if @job.update(job_params)
      render json: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @job.destroy
    head :no_content
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  # Strong parameters for allowing only safe attributes
  def job_params
    params.require(:job).permit(:id, :location, :title, :description, :jobAddress, :userClientId, :userClientName, :userAssigneeId, :userAssigneeName, :createdOn, :jobStatus)
  end
end
