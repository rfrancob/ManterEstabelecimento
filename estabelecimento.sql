CREATE TABLE estabelecimento (
id int primary key,
estabelecimento_codigo char(50),
estabelecimento_situacao char(100),
estabelecimento_descricao char(100),
estabelecimento_cep char(8),
estabelecimento_rua char(100),
estabelecimento_bairro char(50),
estabelecimento_cidade char(50),
estabelecimento_uf char(10),
estabelecimento_ibge char(100)
);

DROP TABLE estabelecimento