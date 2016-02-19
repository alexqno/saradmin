# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
grupo_list = [
  [ 'root', Grupo.status[:ativo] ],
  [ 'Administrador', Grupo.status[:ativo] ],
  [ 'Usuário', Grupo.status[:ativo] ]
]

grupo_list.each do |name, status|
  Grupo.create( descricao: name, status: status )
end

permissao_list = [
  [ 'permissaoUsuario', Permissao.modulos[:configuracao], Permissao.tipos[:acesso], 'Nível de acesso ao menu de usuários' ],
  [ 'permissaoGrupo', Permissao.modulos[:configuracao], Permissao.tipos[:acesso], 'Nível de acesso ao menu de grupo de usuário' ],
  [ 'usuarioPodeAcessarTodosOsNiveisDaIgreja', Permissao.modulos[:configuracao], Permissao.tipos[:sim_nao], 'Usuário pode acessar todos os níveis da igreja' ]
]

permissao_list.each do |aliass, modulo, tipo, descricao|
  Permissao.create( alias: aliass, modulo: modulo, tipo: tipo, descricao: descricao )
end

Grupo.all.each do |grupo|
  Permissao.all.each do |perm|
    if perm.acesso?
      valor = GrupoPermissao.valores[:nenhuma]
      if grupo.id == 1 || grupo.id == 2
        valor = GrupoPermissao.valores[:alterar]
      end
    else
      valor = GrupoPermissao.valores[:nao]
      if grupo.id == 1 || grupo.id == 2
        valor = GrupoPermissao.valores[:sim]
      end
    end
    GrupoPermissao.create( grupo_id: grupo.id, permissao_id: perm.id, valor: valor )
  end
end

User.create(
    name: 'root',
    email: 'arraytechbr@gmail.com',
    password: 'alexS2renan',
    password_confirmation: 'alexS2renan',
    status: User.status[:ativo],
    grupo_id: 1
)

p = Pais.create(:nome => 'Brasil', :sigla => 'BR')

e = Estado.create(:pais_id => p.id,:sigla => 'PB', :nome => "Paraíba")
e.cidades.create(:nome => "Água Branca")
e.cidades.create(:nome => "Aguiar")
e.cidades.create(:nome => "Alagoa Grande")
e.cidades.create(:nome => "Alagoa Nova")
e.cidades.create(:nome => "Alagoinha")
e.cidades.create(:nome => "Alcantil")
e.cidades.create(:nome => "Algodão de Jandaíra")
e.cidades.create(:nome => "Alhandra")
e.cidades.create(:nome => "Amparo")
e.cidades.create(:nome => "Aparecida")
e.cidades.create(:nome => "Arara")
e.cidades.create(:nome => "Araruna")
e.cidades.create(:nome => "Araçagi")
e.cidades.create(:nome => "Areia")
e.cidades.create(:nome => "Areia de Baraúnas")
e.cidades.create(:nome => "Areial")
e.cidades.create(:nome => "Aroeiras")
e.cidades.create(:nome => "Assunção")
e.cidades.create(:nome => "Bananeiras")
e.cidades.create(:nome => "Baraúna")
e.cidades.create(:nome => "Barra de Santa Rosa")
e.cidades.create(:nome => "Barra de Santana")
e.cidades.create(:nome => "Barra de São Miguel")
e.cidades.create(:nome => "Bayeux")
e.cidades.create(:nome => "Baía da Traição")
e.cidades.create(:nome => "Belém")
e.cidades.create(:nome => "Belém do Brejo do Cruz")
e.cidades.create(:nome => "Bernardino Batista")
e.cidades.create(:nome => "Boa Ventura")
e.cidades.create(:nome => "Boa Vista")
e.cidades.create(:nome => "Bom Jesus")
e.cidades.create(:nome => "Bom Sucesso")
e.cidades.create(:nome => "Bonito de Santa Fé")
e.cidades.create(:nome => "Boqueirão")
e.cidades.create(:nome => "Borborema")
e.cidades.create(:nome => "Brejo do Cruz")
e.cidades.create(:nome => "Brejo dos Santos")
e.cidades.create(:nome => "Caaporã")
e.cidades.create(:nome => "Cabaceiras")
e.cidades.create(:nome => "Cabedelo")
e.cidades.create(:nome => "Cachoeira dos Índios")
e.cidades.create(:nome => "Cacimba de Areia")
e.cidades.create(:nome => "Cacimba de Dentro")
e.cidades.create(:nome => "Cacimbas")
e.cidades.create(:nome => "Caiçara")
e.cidades.create(:nome => "Cajazeiras")
e.cidades.create(:nome => "Cajazeirinhas")
e.cidades.create(:nome => "Caldas Brandão")
e.cidades.create(:nome => "Camalaú")
e.cidades.create(:nome => "Campina Grande")
e.cidades.create(:nome => "Campo de Santana")
e.cidades.create(:nome => "Capim")
e.cidades.create(:nome => "Caraúbas")
e.cidades.create(:nome => "Carrapateira")
e.cidades.create(:nome => "Casserengue")
e.cidades.create(:nome => "Catingueira")
e.cidades.create(:nome => "Catolé do Rocha")
e.cidades.create(:nome => "Caturité")
e.cidades.create(:nome => "Conceição")
e.cidades.create(:nome => "Condado")
e.cidades.create(:nome => "Conde")
e.cidades.create(:nome => "Congo")
e.cidades.create(:nome => "Coremas")
e.cidades.create(:nome => "Coxixola")
e.cidades.create(:nome => "Cruz do Espírito Santo")
e.cidades.create(:nome => "Cubati")
e.cidades.create(:nome => "Cuitegi")
e.cidades.create(:nome => "Cuité")
e.cidades.create(:nome => "Cuité de Mamanguape")
e.cidades.create(:nome => "Curral Velho")
e.cidades.create(:nome => "Curral de Cima")
e.cidades.create(:nome => "Damião")
e.cidades.create(:nome => "Desterro")
e.cidades.create(:nome => "Diamante")
e.cidades.create(:nome => "Dona Inês")
e.cidades.create(:nome => "Duas Estradas")
e.cidades.create(:nome => "Emas")
e.cidades.create(:nome => "Esperança")
e.cidades.create(:nome => "Fagundes")
e.cidades.create(:nome => "Frei Martinho")
e.cidades.create(:nome => "Gado Bravo")
e.cidades.create(:nome => "Guarabira")
e.cidades.create(:nome => "Gurinhém")
e.cidades.create(:nome => "Gurjão")
e.cidades.create(:nome => "Ibiara")
e.cidades.create(:nome => "Igaracy")
e.cidades.create(:nome => "Imaculada")
e.cidades.create(:nome => "Ingá")
e.cidades.create(:nome => "Itabaiana")
e.cidades.create(:nome => "Itaporanga")
e.cidades.create(:nome => "Itapororoca")
e.cidades.create(:nome => "Itatuba")
e.cidades.create(:nome => "Jacaraú")
e.cidades.create(:nome => "Jericó")
e.cidades.create(:nome => "João Pessoa")
e.cidades.create(:nome => "Juarez Távora")
e.cidades.create(:nome => "Juazeirinho")
e.cidades.create(:nome => "Junco do Seridó")
e.cidades.create(:nome => "Juripiranga")
e.cidades.create(:nome => "Juru")
e.cidades.create(:nome => "Lagoa")
e.cidades.create(:nome => "Lagoa Seca")
e.cidades.create(:nome => "Lagoa de Dentro")
e.cidades.create(:nome => "Lastro")
e.cidades.create(:nome => "Livramento")
e.cidades.create(:nome => "Logradouro")
e.cidades.create(:nome => "Lucena")
e.cidades.create(:nome => "Malta")
e.cidades.create(:nome => "Mamanguape")
e.cidades.create(:nome => "Manaíra")
e.cidades.create(:nome => "Marcação")
e.cidades.create(:nome => "Mari")
e.cidades.create(:nome => "Marizópolis")
e.cidades.create(:nome => "Massaranduba")
e.cidades.create(:nome => "Mataraca")
e.cidades.create(:nome => "Matinhas")
e.cidades.create(:nome => "Mato Grosso")
e.cidades.create(:nome => "Maturéia")
e.cidades.create(:nome => "Mogeiro")
e.cidades.create(:nome => "Montadas")
e.cidades.create(:nome => "Monte Horebe")
e.cidades.create(:nome => "Monteiro")
e.cidades.create(:nome => "Mulungu")
e.cidades.create(:nome => "Mãe d'Água")
e.cidades.create(:nome => "Natuba")
e.cidades.create(:nome => "Nazarezinho")
e.cidades.create(:nome => "Nova Floresta")
e.cidades.create(:nome => "Nova Olinda")
e.cidades.create(:nome => "Nova Palmeira")
e.cidades.create(:nome => "Olho d'Água")
e.cidades.create(:nome => "Olivedos")
e.cidades.create(:nome => "Ouro Velho")
e.cidades.create(:nome => "Parari")
e.cidades.create(:nome => "Passagem")
e.cidades.create(:nome => "Patos")
e.cidades.create(:nome => "Paulista")
e.cidades.create(:nome => "Pedra Branca")
e.cidades.create(:nome => "Pedra Lavrada")
e.cidades.create(:nome => "Pedras de Fogo")
e.cidades.create(:nome => "Pedro Régis")
e.cidades.create(:nome => "Piancó")
e.cidades.create(:nome => "Picuí")
e.cidades.create(:nome => "Pilar")
e.cidades.create(:nome => "Pilões")
e.cidades.create(:nome => "Pilõezinhos")
e.cidades.create(:nome => "Pirpirituba")
e.cidades.create(:nome => "Pitimbu")
e.cidades.create(:nome => "Pocinhos")
e.cidades.create(:nome => "Pombal")
e.cidades.create(:nome => "Poço Dantas")
e.cidades.create(:nome => "Poço de José de Moura")
e.cidades.create(:nome => "Prata")
e.cidades.create(:nome => "Princesa Isabel")
e.cidades.create(:nome => "Puxinanã")
e.cidades.create(:nome => "Queimadas")
e.cidades.create(:nome => "Quixabá")
e.cidades.create(:nome => "Remígio")
e.cidades.create(:nome => "Riacho de Santo Antônio")
e.cidades.create(:nome => "Riacho dos Cavalos")
e.cidades.create(:nome => "Riachão")
e.cidades.create(:nome => "Riachão do Bacamarte")
e.cidades.create(:nome => "Riachão do Poço")
e.cidades.create(:nome => "Rio Tinto")
e.cidades.create(:nome => "Salgadinho")
e.cidades.create(:nome => "Salgado de São Félix")
e.cidades.create(:nome => "Santa Cecília")
e.cidades.create(:nome => "Santa Cruz")
e.cidades.create(:nome => "Santa Helena")
e.cidades.create(:nome => "Santa Inês")
e.cidades.create(:nome => "Santa Luzia")
e.cidades.create(:nome => "Santa Rita")
e.cidades.create(:nome => "Santa Teresinha")
e.cidades.create(:nome => "Santana de Mangueira")
e.cidades.create(:nome => "Santana dos Garrotes")
e.cidades.create(:nome => "Santarém")
e.cidades.create(:nome => "Santo André")
e.cidades.create(:nome => "Sapé")
e.cidades.create(:nome => "Seridó")
e.cidades.create(:nome => "Serra Branca")
e.cidades.create(:nome => "Serra Grande")
e.cidades.create(:nome => "Serra Redonda")
e.cidades.create(:nome => "Serra da Raiz")
e.cidades.create(:nome => "Serraria")
e.cidades.create(:nome => "Sertãozinho")
e.cidades.create(:nome => "Sobrado")
e.cidades.create(:nome => "Soledade")
e.cidades.create(:nome => "Solânea")
e.cidades.create(:nome => "Sossêgo")
e.cidades.create(:nome => "Sousa")
e.cidades.create(:nome => "Sumé")
e.cidades.create(:nome => "São Bentinho")
e.cidades.create(:nome => "São Bento")
e.cidades.create(:nome => "São Domingos de Pombal")
e.cidades.create(:nome => "São Domingos do Cariri")
e.cidades.create(:nome => "São Francisco")
e.cidades.create(:nome => "São José da Lagoa Tapada")
e.cidades.create(:nome => "São José de Caiana")
e.cidades.create(:nome => "São José de Espinharas")
e.cidades.create(:nome => "São José de Piranhas")
e.cidades.create(:nome => "São José de Princesa")
e.cidades.create(:nome => "São José do Bonfim")
e.cidades.create(:nome => "São José do Brejo do Cruz")
e.cidades.create(:nome => "São José do Sabugi")
e.cidades.create(:nome => "São José dos Cordeiros")
e.cidades.create(:nome => "São José dos Ramos")
e.cidades.create(:nome => "São João do Cariri")
e.cidades.create(:nome => "São João do Rio do Peixe")
e.cidades.create(:nome => "São João do Tigre")
e.cidades.create(:nome => "São Mamede")
e.cidades.create(:nome => "São Miguel de Taipu")
e.cidades.create(:nome => "São Sebastião de Lagoa de Roça")
e.cidades.create(:nome => "São Sebastião do Umbuzeiro")
e.cidades.create(:nome => "Taperoá")
e.cidades.create(:nome => "Tavares")
e.cidades.create(:nome => "Teixeira")
e.cidades.create(:nome => "Tenório")
e.cidades.create(:nome => "Triunfo")
e.cidades.create(:nome => "Uiraúna")
e.cidades.create(:nome => "Umbuzeiro")
e.cidades.create(:nome => "Vieirópolis")
e.cidades.create(:nome => "Vista Serrana")
e.cidades.create(:nome => "Várzea")
e.cidades.create(:nome => "Zabelê")


#find each is very efficient
Cidade.find_each do |c|
  c.bairros.create(nome: 'Centro')
end