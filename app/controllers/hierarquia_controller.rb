class HierarquiaController < ApplicationController

  def preencher_igrejas
    render json: Igreja.where(id: current_user.igrejas_ids)
  end

  def preencher_responsaveis
    retorno = []

    Membro.joins(:cargo).where(igreja_id: params[:igreja_id], 'cargos.lideranca' => true).each do |m|
      retorno << {id: m.id, nome: m.pessoa.nome}
    end

    render json: retorno
  end

  def preencher_redes
    retorno = []

    Rede.where(igreja_id: params[:igreja_id]).each do |r|
      retorno << {id: r.id, descricao: r.descricao}
    end

    render json: retorno
  end

end
