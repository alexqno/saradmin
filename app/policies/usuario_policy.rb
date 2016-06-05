class UsuarioPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    if @user.tem_permissao ['permissaoUsuario']
      return true
    end
    return false
  end

  def new?
    if @user.permissao('permissaoUsuario').alterar?
      return true
    end
    return false
  end

  def edit?
    return new?
  end
end
