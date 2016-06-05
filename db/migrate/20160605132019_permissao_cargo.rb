class PermissaoCargo < ActiveRecord::Migration
  def change
    Permissao.create(
        modulo: Permissao.modulos[:igreja],
        tipo: Permissao.tipos[:acesso],
        alias: 'permissaoCargo',
        descricao: 'Nível de acesso ao menu de cargos'
    )

    p = Permissao.find_by_alias('permissaoCargo')

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
