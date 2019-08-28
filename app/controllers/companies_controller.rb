class CompaniesController < ApplicationController

  def new
    @company = Company.find(current_user.company.id)
  end

  def create
	@company = Company.new(company_params.merge(user_id: current_user.id))
    if @company.save
      redirect_to jobs_path
    else
      render 'new'
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
   
    if @company.update(company_params)
      redirect_to jobs_path
    else
      render 'edit'
    end
  end

  private
    def company_params
      params.require(:company).permit(:name, :mobile, :address, :url)
    end
end
