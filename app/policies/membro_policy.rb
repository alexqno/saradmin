class MembroPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    if @user.tem_permissao ['permissaoMembro']
      return true
    end
    return false
  end

  def new?
    if @user.permissao('permissaoMembro').alterar?
      return true
    end
    return false
  end

  def edit?
    return new?
  end
end
