class ProfilesController < ApplicationController
  before_action :set_employee
  before_action :set_profile, only: %i[show edit update]

  def index; end

  def show; end

  def new
    @profile = Profile.new
  end

  def edit; end

  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      redirect_to employees_url, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to employees_url, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:profile).merge(employee_id: params['employee_id'])
  end

  def set_employee
    @employee = Employee.find(params['employee_id'])
  end

  def set_profile
    @profile = @employee.profiles.active.first
  end
end
