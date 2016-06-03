class ContribuicaoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    if @user.tem_permissao ['permissaoContribuicao']
      return true
    end
    return false
  end

  def new?
    if @user.permissao('permissaoContribuicao').alterar?
      return true
    end
    return false
  end

  def edit?
    return new?
  end
end
