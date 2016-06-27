class JobsController < ApplicationController
  before_action :find_job,only: [:edit,:destroy,:show,:update]

  def index
    @jobs = Job.all.order('created_at DESC')
  end

  def new
    @job = Job.new
  end

  def create
    @job=Job.new(jobs_params)

    if @job.save
      redirect_to @job
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @job.update(jobs_params)
      redirect_to @job
    else
      render 'edit'
    end
  end

  def destroy
    @job.destroy
    redirect_to root_path
  end

  def show
  end

  private
  def find_job
    @job=Job.find(params[:id])
  end

  def jobs_params
    params.require(:job).permit(:title,:description,:company,:url)
  end

end
