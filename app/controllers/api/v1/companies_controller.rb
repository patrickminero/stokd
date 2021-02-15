class Api::V1::CompaniesController < Api::V1::BaseController
  def index
    @companies = policy_scope(Company).all
  end
end