class CargoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    if @user.tem_permissao ['permissaoCargo']
      return true
    end
    return false
  end

  def new?
    if @user.permissao('permissaoCargo').alterar?
      return true
    end
    return false
  end

  def edit?
    return new?
  end
end
