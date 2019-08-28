class SeekersController < ApplicationController
  def index
  	@jobs = Job.all
  end

  def new
    @seeker = Seeker.find(current_user.id)
  end

  def create
    @seeker = Seeker.new(seeker_params)
    if @seeker.save
      redirect_to seekers_path()
    else
      render 'new'
    end
  end

  def show
    @job = Job.find(params[:id])
    @company_id = @job.company_id
    @company = Company.find(@company_id)
  end

  def edit
    @seeker = Seeker.find(params[:id])
  end

  def update
    @seeker = Seeker.find(params[:id])
   
    if @seeker.update(seeker_params)
      redirect_to seekers_path
    else
      render 'edit'
    end
  end

  private
    def seeker_params
      params.require(:seeker).permit(:name, :mobile, :gender, :dob, :address)
    end
end
