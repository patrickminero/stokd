class Api::V1::ProductsController < Api::V1::BaseController
    def index
      @products = policy_scope(Product).where(company_id: params[:company_id])
    end

    def show
      @product = Product.find(params[:id])
      authorize @product
    end

    def update
      if is_authorized
        if @company.update(company_params)
          render :show
        else
          render_error
        end
      else
        render_unathorized
      end
      authorize @company
    end
  
    private
  
    def company_params
      params.require(:company).permit(:description, product_categories: [])
    end
  
    def render_error
      render json: { errors: @company.errors.full_messages },
        status: :unprocessable_entity
    end
  
    def render_unathorized
      render json: { errors: @company.errors.full_messages, message: 'Not authorized' },
        status: :unprocessable_entity
    end
  
    def set_product
      @product = Product.find(params[:product_id])
      authorize @company  # For Pundit
    end
  
    def is_authorized
      @company.employees.include?(current_user.id)
      authorize @company
    end

 
  end