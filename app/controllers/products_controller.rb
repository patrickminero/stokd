class ProductsController < ApplicationController

    private

    def companies_params
        params.require(:product).permit(:name, :description, :price, :quantity, :category, :sku, attributes: {} )
    end
end
