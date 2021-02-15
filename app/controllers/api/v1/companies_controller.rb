class Api::V1::CompaniesController < Api::V1::BaseController
  before_action :set_company, only: [ :show ]
  def index
    @companies = policy_scope(Company).all
  end

  def show
  end

  def set_company
    @company = Company.find(params[:id])
    authorize @company  # For Pundit
  end
end