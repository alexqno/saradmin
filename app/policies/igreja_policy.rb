class IgrejaPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    if @user.tem_permissao ['usuarioPodeAcessarTodosOsNiveisDaIgreja']
      if @user.tem_permissao ['permissaoIgreja']
        return true
      end
    else
      membro = Membro.find_by_user_id(@user.id)

      unless membro.nil?
        igrejas = Igreja.where(id: membro.igrejas_ids)

        if igrejas.length > 0
          return true
        end

      end

      return false
    end
  end

  def new?
    if @user.tem_permissao ['usuarioPodeAcessarTodosOsNiveisDaIgreja']
      if @user.permissao('permissaoIgreja').alterar?
        return true
      end
    else
      membro = Membro.find_by_user_id(@user.id)

      unless membro.nil?
        igrejas = Igreja.where(id: membro.igrejas_ids)

        if igrejas.length > 0
          return true
        end

      end

      return false
    end
  end

  def edit?
    if @user.tem_permissao ['usuarioPodeAcessarTodosOsNiveisDaIgreja']
      if @user.permissao('permissaoIgreja').alterar?
        return true
      end
    else
      membro = Membro.find_by_user_id(@user.id)

      unless membro.nil?
        igrejas = Igreja.where(id: membro.igrejas_ids)

        if igrejas.length > 0
          return true
        end

      end

      return false
    end
  end
end
