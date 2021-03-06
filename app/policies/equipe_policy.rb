class EquipePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    if @user.tem_permissao(['usuarioPodeAcessarTodosOsNiveisDaIgreja']) && @user.tem_permissao(['permissaoEquipe'])
      return true
    else
      membro = Membro.find_by_user_id(@user.id)

      unless membro.nil?
        equipes = Equipe.where(id: membro.equipes_ids)

        if equipes.length > 0
          return true
        end
      end

      return false
    end
  end

  def new?
    if @user.permissao('permissaoEquipe').alterar?
      return true
    else
      membro = Membro.find_by_user_id(@user.id)

      unless membro.nil?
        equipes = Equipe.where(id: membro.equipes_ids)

        if equipes.length > 0
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
