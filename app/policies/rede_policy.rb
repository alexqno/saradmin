class RedePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    if @user.tem_permissao(['usuarioPodeAcessarTodosOsNiveisDaIgreja']) && @user.tem_permissao(['permissaoRede'])
      return true
    else
      membro = Membro.find_by_user_id(@user.id)

      unless membro.nil?
        redes = Rede.where(id: membro.redes_ids)

        if redes.length > 0
          return true
        end
      end

      return false
    end
  end

  def new?
    if @user.permissao('permissaoRede').alterar?
      return true
    else
      membro = Membro.find_by_user_id(@user.id)

      unless membro.nil?
        redes = Rede.where(id: membro.redes_ids)

        if redes.length > 0
          return true
        end

      end

      return false
    end
  end

  def edit?
    return new?
  end
end
