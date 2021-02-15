class CompaniesController < ApplicationController

    private

    def companies_params
        params.require(:company).permit(:name, :description, :price, :business_type, product_categories: [])
    end
end
