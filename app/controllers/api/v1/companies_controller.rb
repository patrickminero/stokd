class Api::V1::CompaniesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_company, only: [ :show ]
  def index
    @companies = policy_scope(Company).all
  end

  def show
  end

  def update
    if @company.update(company_params)
      render :show
    else
      render_error
    end
  end

  private

  def company_params
    params.require(:company).permit(:product_categories, :description)
  end

  def render_error
    render json: { errors: @restaurant.errors.full_messages },
      status: :unprocessable_entity
  end

  def set_company
    @company = Company.find(params[:id])
    authorize @company  # For Pundit
  end
end