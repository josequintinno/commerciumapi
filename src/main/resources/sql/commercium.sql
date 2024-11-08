/**
    Projeto: COMMERCIUMAPI
    Objetivo: Responsável por gerenciar os Usuários do Sistema
    Autor: José Quintinno
    Data de Criação: 05/11/2024
*/

/*
============================================================================================
# Gerenciador de Pessoas
------------------------------------------------------------

Código					5d11e2b5-62b9-4dce-8ab0-45c0183b14e1
Tipo de Pessoa 			Pessoa Física
Nome					Fulano de Tal
Data Cadastro 			05/11/2024
Data de Alteração 		NULL
Identificador Usuário	NULL

# Gerenciador de Usuários
------------------------------------------------------------

Código					5d11e2b5-62b9-4dce-8ab0-45c0183b14e1
Acessos do Usuário 		[DESENVOLVEDOR, ADMINSTRADOR, VENDENDOR, DIRETOR_FINANCEIRO, GERENTE_VENDAS]
Identificador 			fulano.tal@gmail.com
Senha 					********************
Data Cadastro 			05/11/2024
Data de Alteração 		NULL
Identificador Usuário	NULL

# Gerenciador de Usuários-Acesso
------------------------------------------------------------

Código					5d11e2b5-62b9-4dce-8ab0-45c0183b14e1
Usuário					Fulano de Tal
Acessos 				[DESENVOLVEDOR]

Código					5d11e2b5-62b9-4dce-8ab0-45c0183b14e1
Usuário					Fulano de Tal
Acessos 				[ADMINSTRADOR]

============================================================================================
*/

drop table if exists tb_tipo_pessoa cascade;
create table if not exists tb_tipo_pessoa (
	codigo bigserial not null,
	descricao varchar (100) not null,
	constraint pk_tipo_pessoa_codigo primary key (codigo),
	constraint un_tipo_pessoa_descricao unique (descricao)
);
comment on table tb_tipo_pessoa IS 'Responsável por armazenar os dados referente ao Tipo de uma determinada Pessoa';
comment on column tb_tipo_pessoa.codigo IS 'Identificador único da tabela';
comment on column tb_tipo_pessoa.descricao IS 'Descrição única do tipo de pessoa. Podem ser: Pessoa Física ou Pessoa Jurídica';

drop table if exists tb_pessoa cascade;
create table if not exists tb_pessoa (
	codigo bigserial not null,
	id_tipo_pessoa serial not null,
	nome varchar (200) not null,
	data_cadastro date not null default now(),
	data_atualizacao date null,
	usuario_atualizacao varchar (50) null,
	constraint pk_pessoa_codigo primary key (codigo),
	constraint fk_pessoa_id_tipo_pessoa foreign key (id_tipo_pessoa) references tb_tipo_pessoa (codigo),
	constraint un_pessoa_nome unique (nome)
);
comment on table tb_pessoa IS 'Responsável por armazenar os dados referente a uma determinada Pessoa';
comment on column tb_pessoa.codigo IS 'Identificador único da tabela';
comment on column tb_pessoa.nome IS 'Nome único da pessoa';
comment on column tb_pessoa.data_cadastro IS 'Data de cadastro de uma determinada pessoa';
comment on column tb_pessoa.data_atualizacao IS 'Data de alteração de uma determinada pessoa';
comment on column tb_pessoa.usuario_atualizacao IS 'Identificador do usuário que realizou a alteração do cadastro de uma determinada pessoa';

drop table if exists tb_usuario cascade;
create table if not exists tb_usuario (
	codigo bigserial not null,
	id_pessoa serial not null,
	identificador varchar (100) not null,
	senha varchar (100) not null,
	data_cadastro date not null default now(),
	data_atualizacao date null,
	usuario_atualizacao varchar (50) null,
	constraint pk_usuario_codigo primary key (codigo),
	constraint fk_usuario_id_pessoa foreign key (id_pessoa) references tb_pessoa (codigo),
	constraint un_usuario_identificador unique (identificador)
);

drop table if exists tb_acesso cascade;
create table if not exists tb_acesso (
	codigo bigserial not null,
	descricao varchar (100) not null,
	constraint pk_acesso_codigo primary key (codigo),
	constraint un_acesso_descricao unique (descricao)
);
comment on table tb_pessoa IS 'Responsável por armazenar os dados de acesso de uma determinado Usuário';
comment on column tb_pessoa.codigo IS 'Identificador único da tabela';
comment on column tb_pessoa.nome IS 'Descrição única do Acesso. Podem ser: DESENVOLVEDOR, GERENTE_FINANCEIRO, GERENTE_VENDAS, VENDEDOR';

drop table if exists tb_usuario_acesso cascade;
create table if not exists tb_usuario_acesso (
	codigo bigserial not null,
	id_usuario serial not null,
	id_acesso serial not null,
	constraint pk_usuario_acesso_codigo primary key (codigo),
	constraint fk_usuario_acesso_id_usuario foreign key (id_usuario) references tb_usuario (codigo),
	constraint fk_usuario_acesso_id_acesso foreign key (id_acesso) references tb_acesso (codigo),
	constraint un_usuario_acesso unique (id_usuario, id_acesso)
);

/**
    Projeto: COMMERCIUMAPI
    Objetivo: Responsável por gerenciar os Produtos do sistema
    Autor: José Quintinno
    Data de Criação: 05/11/2024
*/

/*
============================================================================================
# Gerenciador de Produtos
------------------------------

Código				5d11e2b5-62b9-4dce-8ab0-45c0183b14e1			
Detalhe				[Autor=Yuval Noah Harari; idioma=Português; categoria=best-seller]
Arquivo				[Imagem 1; Imagem 2; Imagem 3]
Tag					[Livraria; Yuval;]
Nome				Homo Deus
Descrição Breve		Capa comum – Edição padrão, 11 novembro 2016
Descrição Longa		Neste Homo Deus: uma breve história do...
Valor				R$ 58,50
Quantidade			10
============================================================================================
*/

drop table if exists tb_detalhe_produto cascade;
create table if not exists tb_detalhe_produto (
	codigo bigserial not null,
	nome varchar (100) not null,
	constraint pk_detalhe_produto primary key (codigo),
	constraint un_detalhe_produto unique (nome)
);
comment on table tb_detalhe_produto IS 'Responsável por armazenar os dados de Detalhes de um determinado produto';
comment on column tb_detalhe_produto.codigo IS 'Identificador único da tabela';
comment on column tb_detalhe_produto.nome IS 'Nome do detalhe de um determinado produto';

drop table if exists tb_arquivo cascade;
create table if not exists tb_arquivo (
	codigo bigserial not null,
	nome varchar (100) not null,
	tamanho varchar (5) not null,
	extencao varchar (4) null,
	url varchar (255) null,
	constraint pk_arquivo primary key (codigo),
	constraint un_arquivo unique (nome, url)
);
comment on table tb_arquivo IS 'Responsável por armazenar os arquivos de um determinado produto';
comment on column tb_arquivo.codigo IS 'Identificador único da tabela';
comment on column tb_arquivo.nome IS 'Nome do arquivo';
comment on column tb_arquivo.tamanho IS 'Tamanho de um determinado arquivo';
comment on column tb_arquivo.extencao IS 'Extenção de um determinado arquivo';

drop table if exists tb_categoria_produto cascade;
create table if not exists tb_categoria_produto (
	codigo bigserial not null,
	descricao varchar (255) not null,
	constraint pk_categoria_produto primary key (codigo),
	constraint un_categoria_produto unique (descricao)
);
comment on table tb_categoria_produto IS 'Responsável por armazenar as categorias de um determinado produto';
comment on column tb_categoria_produto.codigo IS 'Identificador único da tabela';
comment on column tb_categoria_produto.descricao IS 'Descrição da categoria';

drop table if exists tb_tag cascade;
create table if not exists tb_tag (
	codigo bigserial not null,
	descricao varchar (255) not null,
	constraint pk_tag primary key (codigo),
	constraint un_tag unique (descricao)
);
comment on table tb_tag IS 'Responsável por armazenar as TAGS de um determinado produto';
comment on column tb_tag.codigo IS 'Identificador único da tabela';
comment on column tb_tag.descricao IS 'Descrição da TAG';

drop table if exists tb_produto cascade;
create table if not exists tb_produto (
	codigo bigserial not null,
	codigo_publico uuid not null,
	id_categoria_produto serial not null,
	nome varchar (200) not null,
	descricao_breve varchar (100) not null,
	descricao_longa text null,
	valor numeric(10,2) not null,
	quantidade integer not null,
	constraint pk_produto primary key (codigo),
	constraint fk_produto_id_categoria_produto foreign key (id_categoria_produto) references tb_categoria_produto (codigo),
	constraint un_produto unique (nome, descricao_breve),
	constraint ck_produto check (valor > 0)
);
comment on table tb_produto IS 'Responsável por armazenar as categorias de um determinado produto';
comment on column tb_produto.codigo IS 'Identificador único da tabela';
comment on column tb_produto.codigo_publico IS 'Identificador único e público da tabela no formato UUID';
comment on column tb_produto.nome IS 'Nome do produto';
comment on column tb_produto.descricao_breve IS 'Descrição Breve do produto';
comment on column tb_produto.descricao_longa IS 'Descrição Longa do produto';
comment on column tb_produto.valor IS 'Valor do produto';
comment on column tb_produto.quantidade IS 'Quantidade em estoque do produto';

drop table if exists tb_produto_detalhe cascade;
create table if not exists tb_produto_detalhe (
	codigo bigserial not null,
	id_produto serial not null,
	id_detalhe serial not null,
	descricao varchar (200) not null,
	constraint pk_produto_detalh primary key (codigo),
	constraint fk_produto foreign key (id_produto) references tb_produto (codigo),
	constraint fk_id_detalhe foreign key (id_detalhe) references tb_detalhe_produto (codigo),
	constraint un_produto_detalhe unique (id_produto, id_detalhe)
);
comment on table tb_produto_detalhe IS 'Responsável por armazenar os Produtos e od Detalhes de um determinado produto';
comment on column tb_produto_detalhe.codigo IS 'Identificador único da tabela';
comment on column tb_produto_detalhe.id_produto IS 'Identificador único da tabela TB_PRODUTO';
comment on column tb_produto_detalhe.id_detalhe IS 'Identificador único da tabela tb_detalhe_produto';

drop table if exists tb_produto_tag cascade;
create table if not exists tb_produto_tag (
	codigo bigserial not null,
	id_produto serial not null,
	id_tag serial not null,
	constraint pk_produto_tag primary key (codigo),
	constraint fk_produto foreign key (id_produto) references tb_produto (codigo),
	constraint fk_tag foreign key (id_tag) references tb_tag (codigo),
	constraint un_produto_tag unique (id_produto, id_tag)
);
comment on table tb_produto_tag IS 'Responsável por armazenar os Produtos e od Detalhes de um determinado produto';
comment on column tb_produto_tag.codigo IS 'Identificador único da tabela';
comment on column tb_produto_tag.id_produto IS 'Identificador único da tabela TB_PRODUTO';
comment on column tb_produto_tag.id_tag IS 'Identificador único da tabela TB_TAG';

drop table if exists tb_produto_arquivo cascade;
create table if not exists tb_produto_arquivo (
	codigo bigserial not null,
	id_produto serial not null,
	id_arquivo serial not null,
	constraint pk_produto_arquivo primary key (codigo),
	constraint fk_produto foreign key (id_produto) references tb_produto (codigo),
	constraint fk_arquivo foreign key (id_arquivo) references tb_arquivo (codigo),
	constraint un_produto_arquivo unique (id_produto, id_arquivo)
);
comment on table tb_produto_arquivo IS 'Responsável por armazenar os Produtos e od Detalhes de um determinado produto';
comment on column tb_produto_arquivo.codigo IS 'Identificador único da tabela';
comment on column tb_produto_arquivo.id_produto IS 'Identificador único da tabela TB_PRODUTO';
comment on column tb_produto_arquivo.id_arquivo IS 'Identificador único da tabela TB_ARQUIVO';

-- select * from tb_detalhe_produto;

insert into tb_detalhe_produto (nome) values ('Autor');
insert into tb_detalhe_produto (nome) values ('Idioma');
insert into tb_detalhe_produto (nome) values ('Categoria');

-- select * from tb_arquivo;

insert into tb_arquivo (nome, tamanho, extencao, url) values ('Frente', '12KB', 'JPG', 'https://ciclovivo.com.br/wp-content/uploads/2018/10/front.jpg');
insert into tb_arquivo (nome, tamanho, extencao, url) values ('Lado', '12KB', 'JPG', 'https://ciclovivo.com.br/wp-content/uploads/2018/10/side.jpg');
insert into tb_arquivo (nome, tamanho, extencao, url) values ('Tras', '12KB', 'JPG', 'https://ciclovivo.com.br/wp-content/uploads/2018/10/back.jpg');

-- select * from tb_categoria_produto;

insert into tb_categoria_produto (descricao) values ('Literatura');

-- select * from tb_tag;

insert into tb_tag (descricao) values ('Best-Sellers');
insert into tb_tag (descricao) values ('Literatura');
insert into tb_tag (descricao) values ('Youval');
insert into tb_tag (descricao) values ('Filosofia');
insert into tb_tag (descricao) values ('Israelenses');

-- select * from tb_produto;

insert into tb_produto (codigo_publico, id_categoria_produto, nome, descricao_breve, descricao_longa, valor, quantidade) values (
	'a3d3dbfc-91c1-420e-9753-a68389b84480',
	(select codigo from tb_categoria_produto where descricao = 'Literatura'),
	'Homo Deus',
	'Capa comum – Edição padrão, 11 novembro 2016',
	'Neste Homo Deus: uma breve história do amanhã, Yuval Noah Harari, autor do estrondoso best-seller Sapiens: uma breve história da humanidade, volta a combinar ciência, história e filosofia, desta vez para entender quem somos e descobrir para onde vamos. Sempre com um olhar no passado e nas nossas origens, Harari investiga o futuro da humanidade em busca de uma resposta tão difícil quanto essencial: depois de séculos de guerras, fome e pobreza, qual será nosso destino na Terra? A partir de uma visão absolutamente original de nossa história, ele combina pesquisas de ponta e os mais recentes avanços científicos à sua conhecida capacidade de observar o passado de uma maneira inteiramente nova. Assim, descobrir os próximos passos da evolução humana será também redescobrir quem fomos e quais caminhos tomamos para chegar até aqui.',
	58.50,
	10
);

-- select * from tb_produto_detalhe;

insert into tb_produto_detalhe (id_produto, id_detalhe, descricao) values (
	(select codigo from tb_produto where nome = 'Homo Deus'),
	(select codigo from tb_detalhe_produto where nome = 'Autor'),
	'Yuval Noah Harari'
);

insert into tb_produto_detalhe (id_produto, id_detalhe, descricao) values (
	(select codigo from tb_produto where nome = 'Homo Deus'),
	(select codigo from tb_detalhe_produto where nome = 'Idioma'),
	'Português Brasil'
);

insert into tb_produto_detalhe (id_produto, id_detalhe, descricao) values (
	(select codigo from tb_produto where nome = 'Homo Deus'),
	(select codigo from tb_detalhe_produto where nome = 'Categoria'),
	'Filosofia'
);

-- select * from tb_produto_tag;

insert into tb_produto_tag (id_produto, id_tag) values (
	(select codigo from tb_produto where nome = 'Homo Deus'),
	(select codigo from tb_tag where descricao = 'Best-Sellers')
);

insert into tb_produto_tag (id_produto, id_tag) values (
	(select codigo from tb_produto where nome = 'Homo Deus'),
	(select codigo from tb_tag where descricao = 'Youval')
);

insert into tb_produto_tag (id_produto, id_tag) values (
	(select codigo from tb_produto where nome = 'Homo Deus'),
	(select codigo from tb_tag where descricao = 'Israelenses')
);

insert into tb_produto_tag (id_produto, id_tag) values (
	(select codigo from tb_produto where nome = 'Homo Deus'),
	(select codigo from tb_tag where descricao = 'Filosofia')
);

-- select * from tb_produto_arquivo;

insert into tb_produto_arquivo (id_produto, id_arquivo) values (
	(select codigo from tb_produto where nome = 'Homo Deus'),
	(select codigo from tb_arquivo where nome = 'Frente')
);

insert into tb_produto_arquivo (id_produto, id_arquivo) values (
	(select codigo from tb_produto where nome = 'Homo Deus'),
	(select codigo from tb_arquivo where nome = 'Lado')
);

insert into tb_produto_arquivo (id_produto, id_arquivo) values (
	(select codigo from tb_produto where nome = 'Homo Deus'),
	(select codigo from tb_arquivo where nome = 'Tras')
);

/*
============================================================================================
# Gerenciador de Nota Fical (TB_NOTA_FISCAL)
------------------------------------------------------------

Código					5d11e2b5-62b9-4dce-8ab0-45c0183b14e1
Número de Serie 		585494684665468664546
Valor Total 			R$ 200,00	
Valor Desconto			R$ 00,00
Valor ICMS 				R$ 00,00
Valor do Frete 			R$ 00,00

# Gerenciador de Nota Fical Produto (TB_VENDA_PRODUTO)
------------------------------------------------------------

Código					5d11e2b5-62b9-4dce-8ab0-45c0183b14e1
Venda 					VENDA_01
Produtos 				[PRODUTO_01, PRODUTO_02, PRODUTO_03]
Valor Produto			R$ 100,00
Quantidade				2
Número de Serie 		585494684665468664546
Valor Total 			R$ 200,00

============================================================================================
*/



/*
============================================================================================
# Gerenciador de Endereço
------------------------------------------------------------

Código					5d11e2b5-62b9-4dce-8ab0-45c0183b14e1
Pessoa 					Fulano de Tal
Tipo de Endereço 		Entrega
CEP 					72.401.501
Descrição				Quandra 207 Conjunto A Lote 13
Bairro 					Santa Maria Sul
Cidade 					Santa Maria
Estado 					Brasília
Número 					13
Complemeto				NULL

Código					5d11e2b5-62b9-4dce-8ab0-45c0183b14e1
Pessoa 					Fulano de Tal
Tipo de Endereço 		Cobrança
CEP						74356-010
Descrição				Rua RI 24
Número 					587
Bairro 					Residencial Itaipu
Cidade 					Goiânia
Estado 					Goiás
Complemeto				NULL

============================================================================================
*/

drop table if exists tb_tipo_endereco cascade;
create table if not exists tb_tipo_endereco (
	codigo bigserial not null,
	descricao varchar (100) not null,
	constraint pk_tipo_endereco_codigo primary key (codigo)
);

drop table if exists tb_estado cascade;
create table if not exists tb_estado (
	codigo bigserial not null,
	nome varchar (100) not null,
	constraint pk_estado_codigo primary key (codigo)
);

drop table if exists tb_cidade cascade;
create table if not exists tb_cidade (
	codigo bigserial not null,
	id_estado serial not null,
	nome varchar (100) not null,
	constraint pk_cidade_codigo primary key (codigo),
	constraint fk_cidade_estado foreign key (id_estado) references tb_estado (codigo)
);

drop table if exists tb_endereco cascade;
create table if not exists tb_endereco (
	codigo bigserial not null,
	id_tipo_endereco serial not null,
	id_pessoa serial not null,
	id_cidade serial not null,
	descricao varchar (200) not null,
	numero varchar (10) not null,
	bairro varchar (100) null,
	cep varchar (10) not null,
	complemento varchar (200) null,
	constraint pk_endereco_codigo primary key (codigo),
	constraint fk_endereco_tipo_endereco foreign key (id_tipo_endereco) references tb_tipo_endereco (codigo),
	constraint fk_endereco_pessoa foreign key (id_pessoa) references tb_pessoa (codigo),
	constraint fk_endereco_cidade foreign key (id_cidade) references tb_cidade (codigo)
);

/*
============================================================================================
# Gerenciador de Venda (TB_VENDA)
------------------------------------------------------------

Código					5d11e2b5-62b9-4dce-8ab0-45c0183b14e1
Usuário 				USUÁRIO: Fulano de Tal
Data/Hora 				11/08/2024 às 13:55				
Endereço (Entrega) 		Endereço 1


============================================================================================
*/

drop table if exists tb_situacao_financeira cascade;
create table if not exists tb_situacao_financeira (
	codigo bigserial not null,
	descricao varchar (100) not null, -- AGUARDANDO_PAGAMENTO; PAGO; ESTORNADO
	constraint pk_situacao_financeira_codigo primary key (codigo)
);

drop table if exists tb_forma_pagamento cascade;
create table if not exists tb_forma_pagamento (
	codigo bigserial not null,
	descricao varchar (100) not null, -- CARTAO_CREDITO, CARTAO_DEBITO, PIX, BOLETO_BANCARIO
	constraint pk_forma_pagamento_codigo primary key (codigo)
);

drop table if exists tb_venda cascade;
create table if not exists tb_venda (
	codigo bigserial not null,
	id_usuario serial not null,
	id_situacao_financeira serial not null,
	id_forma_pagamento serial not null,
	data_hora timestamp not null default now(),
	constraint pk_venda_codigo primary key (codigo),
	constraint fk_venda_id_usuario foreign key (id_usuario) references tb_usuario (codigo),
	constraint fk_venda_id_situacao_financeira foreign key (id_situacao_financeira) references tb_situacao_financeira (codigo),
	constraint fk_venda_id_forma_pagamento foreign key (id_forma_pagamento) references tb_forma_pagamento (codigo)
);

drop table if exists tb_venda_produto cascade;
create table if not exists tb_venda_produto (
	codigo bigserial not null,
	id_venda serial not null,
	id_produto serial not null,
	valor_produto numeric(10,2) not null,
	quantidade integer not null,
	codigo_promocional varchar (100) null,
	valor_desconto numeric(10,2) null,
	valor_total numeric (10,2) not null,
	constraint pk_venda_produto_codigo primary key (codigo),
	constraint fk_venda_produto_id_venda foreign key (id_venda) references tb_venda (codigo),
	constraint fk_venda_produto_id_produto foreign key (id_produto) references tb_produto (codigo)
);

drop table if exists tb_situacao_nota_fiscal cascade;
create table if not exists tb_situacao_nota_fiscal (
	codigo bigserial not null,
	descricao varchar (100) not null, -- EMITIDA, AGURDANDO
	constraint pk_situacao_nota_fiscal_codigo primary key (codigo)
);

drop table if exists tb_nota_fiscal cascade;
create table if not exists tb_nota_fiscal (
	codigo bigserial not null,
	id_situacao_nota_fiscal serial not null,
	id_venda_produto serial not null,
	numero integer not null,
	data_emissao date not null,
	constraint pk_nota_fiscal_codigo primary key (codigo),
	constraint fk_nota_fiscal_id_situacao_nota_fiscal foreign key (id_situacao_nota_fiscal) references tb_situacao_nota_fiscal (codigo),
	constraint fk_nota_fiscal_id_venda_produto foreign key (id_venda_produto) references tb_venda_produto (codigo)
);
