class PermissaoEquipe < ActiveRecord::Migration
  def change

    Permissao.create(
        modulo: Permissao.modulos[:igreja],
        tipo: Permissao.tipos[:acesso],
        alias: 'permissaoEquipe',
        descricao: 'Nível de acesso ao menu de equipes'
    )

    p = Permissao.find_by_alias('permissaoEquipe')

    Grupo.all.each do |g|

      if(g.id == 1 || g.id == 2)

        GrupoPermissao.create(
            permissao_id: p.id,
            grupo_id: g.id,
            valor: GrupoPermissao.valores[:alterar]
        )

      else

        GrupoPermissao.create(
            permissao_id: p.id,
            grupo_id: g.id,
            valor: GrupoPermissao.valores[:nenhuma]
        )

      end

    end

  end
end
