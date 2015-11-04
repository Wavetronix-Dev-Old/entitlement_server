class RolesController < ApplicationController
  before_action :find_role
  after_action :verify_authorized

  def index
    @roles = Role.order(:name)
    authorize :role
  end

  def new
    @role = Role.new
    authorize @role
  end

  def edit
    authorize @role
  end

  def create
    @role = Role.new(role_params)
    authorize @role
    if @role.save
      redirect_to roles_path, notice: %(Created "#{@role.name}" successfully.)
    else
      render :new
    end
  end

  def update
    authorize @role
    if @role.update(role_params)
      redirect_to roles_path, notice: %(Updated "#{@role.name}" successfully.)
    else
      render :edit
    end
  end

  def destroy
    authorize @role
    @role.destroy
    redirect_to roles_path
  end

  private

  def find_role
    @role = Role.find(params[:id]) if params[:id]
  end

  def role_params
    params.require(:role).permit(:name)
  end
end
