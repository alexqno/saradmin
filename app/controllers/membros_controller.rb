class MembrosController < ApplicationController
  before_action :preencher_listas, only: [:new, :edit]
  before_action :set_membro, only: [:show, :edit, :update, :destroy]

  def index
    @tela = 'Listar Membros'
    @membros = Membro.all
  end

  def new
    @tela = 'Cadastrar Membro'
    @membro = Membro.new
    @membro.build_pessoa(estado_civil: Pessoa.estado_civis[:solteiro])

    @membro.pessoa.pessoa_enderecos.build(descricao: 'Principal').build_endereco.build_bairro
    @membro.pessoa.pessoa_enderecos.build(descricao: 'Comercial').build_endereco.build_bairro

    @membro.pessoa.contatos.build(tipo: Contato.tipos[:email])
    @membro.pessoa.contatos.build(tipo: Contato.tipos[:telefone])
    @membro.pessoa.contatos.build(tipo: Contato.tipos[:telefone_comercial])
  end

  def create
    @membro = Membro.new(membro_params)

    respond_to do |format|
      if @membro.save
        format.html { redirect_to @membro, notice: 'Membro criado com sucesso.' }
        format.json { render :show, status: :created, location: @membro }
      else
        format.html { render :new }
        format.json { render json: @membro.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @tela = 'Alterar Membro'

    if not(@membro.pessoa.enderecos.nil?) && @membro.pessoa.enderecos.length > 0
      if not(@membro.pessoa.enderecos[0].cidade.nil?)
        @cidades = Cidade.where("estado_id = ?", @membro.pessoa.enderecos[0].cidade.estado.id).order("nome")
      end
    else
      @membro.pessoa.pessoa_enderecos.build(descricao: 'Principal').build_endereco.build_bairro
      @membro.pessoa.pessoa_enderecos.build(descricao: 'Comercial').build_endereco.build_bairro
    end
  end

  def update
    respond_to do |format|
      if @membro.update(membro_params)
        format.html { redirect_to @membro, notice: 'Membro alterado com sucesso.' }
        format.json { render :show, status: :ok, location: @membro }
      else
        format.html { render :edit }
        format.json { render json: @membro.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @tela = 'Visualizar Membro'
  end

  def report
    @membros = Membro.where(igreja_id: 34)
    respond_to do |format|
      format.pdf do
        pdf = MembroReport.new(@membros)
        send_data pdf.render, filename: "membros_report.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  private

  def set_membro
    @membro = Membro.find(params[:id])
  end

  def preencher_listas
    @estados = Estado.order('nome')
    @cidades = Cidade.where('estado_id = ?', Estado.first.id).order('nome')

    @igreja_ops = Igreja.all.collect.map do |i|
      [i.descricao, i.id]
    end

    @cargo_ops = Cargo.all.collect.map do |i|
      [i.descricao, i.id]
    end

    @estados_civis_ops = Pessoa.estado_civis.collect.map do |e|
      e
    end
  end

  def membro_params
    params.require(:membro).permit(
        :numero_cadastro,
        :igreja_id,
        :cargo_id,
        :email,
        :telefone,
        pessoa_attributes: [
            :id,
            :nome,
            :data_nascimento,
            :cpf,
            :rg,
            :estado_civil,
            :titulo_eleitor_numero_inscricao,
            :titulo_eleitor_zona,
            :titulo_eleitor_secao,
            :titulo_eleitor_data_emissao,
            pessoa_enderecos_attributes: [
                :id,
                :descricao,
                endereco_attributes: [
                    :id,
                    :estado_id,
                    :cidade_id,
                    :logradouro,
                    :numero,
                    :cep,
                    :complemento,
                    :ponto_referencia,
                    bairro_attributes: [
                        :id,
                        :nome
                    ]
                ]
            ],
            contatos_attributes: [
                :id,
                :tipo,
                :descricao
            ]
        ]
    )
  end

end
