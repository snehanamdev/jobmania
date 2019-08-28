class JobsController < ApplicationController
  def new
    @job = Job.new
  end
 
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end
  
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
   
    redirect_to jobs_path
  end

  def create
    @job = Job.new(job_params.merge(company_id: current_user.company.id))
    if @job.save
      redirect_to jobs_path()
    else
      render 'new'
    end
  end
 
  def update
    @job = Job.find(params[:id])
   
    if @job.update(job_params)
      redirect_to jobs_path
    else
      render 'edit'
    end
  end

  private
    def job_params
      params.require(:job).permit(:profile, :description, :salary, :location)
    end
end
