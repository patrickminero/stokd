class CompanyPolicy < ApplicationPolicy
  def update?
    !user.nil?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
