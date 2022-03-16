CREATE DATABASE supermercado;


CREATE TABLE clientes (
  cpf char(14) NOT NULL UNIQUE primary key,
  nome varchar(150)
);

CREATE TABLE vendedores(
  cpf char(14) NOT NULL UNIQUE primary key,
  nome varchar(150)
);

CREATE TABLE pedidos(
  id serial NOT NULL primary key,
  valor int,
  cliente_cpf char(14) references clientes(cpf),
  vendedor_cpf char(14) references vendedores(cpf)
);

CREATE TABLE categorias(
  id serial NOT NULL primary key,
  nome varchar(50)
);

CREATE TABLE produtos(
  id serial NOT NULL primary key,
  nome varchar(100),
  descricao text,
  preco int,
  quantidade_em_estoque int,
  categoria_id int references categorias(id)
);

CREATE TABLE itens_do_pedido(
  id serial NOT NULL primary key,
  pedido_id int references pedidos(id),
  quantidade int,
  produto_id int references produtos(id)
);


INSERT INTO categorias
(nome)
VALUES
('frutas'),
('verduras'),
('massas'),
('bebidas'),
('utilidades');

INSERT INTO produtos
(nome, descricao, preco, quantidade_em_estoque, categoria_id)
VALUES
('Mamão', 'Rico em vitamina A, potássio e vitamina C', 300,	123, 1),
('Maça', 'Fonte de potássio e fibras.',	90, 34,	1),
('Cebola', 'Rico em quercetina, antocianinas, vitaminas do complexo B, C.', 50, 76, 2),
('Abacate',	'NÃO CONTÉM GLÚTEN.', 150, 64, 1),
('Tomate', 'Rico em vitaminas A, B e C.', 125, 88, 2),
('Acelga',	'NÃO CONTÉM GLÚTEN.', 235, 13, 2),
('Macarrão parafuso', 'Sêmola de trigo enriquecida com ferro e ácido fólico, ovos e corantes naturais',	690, 5, 3),
('Massa para lasanha', 'Uma reunião de família precisa ter comida boa e muita alegria.', 875, 19,	3),
('Refrigerante coca cola lata', 'Sabor original', 350, 189, 4),
('Refrigerante Pepsi 2l', 'NÃO CONTÉM GLÚTEN. NÃO ALCOÓLICO.',	700,	12,	4),
('Cerveja Heineken 600ml', 'Heineken é uma cerveja lager Puro Malte, refrescante e de cor amarelo-dourado',	1200, 500, 4),
('Agua mineral sem gás', 'Smartwater é água adicionado de sais mineirais (cálcio, potássio e magnésio) livre de sódio e com pH neutro.', 130, 478, 4),
('Vassoura', 'Pigmento, matéria sintética e metal.', 2350, 30, 5),
('Saco para lixo', 'Reforçado para garantir mais segurança', 1340, 90, 5),
('Escova dental', 'Faça uma limpeza profunda com a tecnologia inovadora', 1000,	44,	5),
('Balde para lixo 50l', 'Possui tampa e fabricado com material reciclado', 2290,	55,	5),
('Manga', 'Rico em Vitamina A, potássio e vitamina C', 198,	176,1),
('Uva', 'NÃO CONTÉM GLÚTEN.', 420,	90,	1);

INSERT INTO clientes
(cpf, nome)
VALUES
('803.713.500-42',	'José Augusto Silva'),
('676.428.690-61',	'Antonio Oliveira'),
('631.933.100-34',	'Ana Rodrigues'),
('756.705.050-18',	'Maria da Conceição');

INSERT INTO vendedores
(cpf, nome)
VALUES
('825.398.410-31', 'Rodrigo Sampaio'),
('232.625.460-03', 'Beatriz Souza Santos'),
('280.071.550-23', 'Carlos Eduardo');


-- a) José Algusto comprou os seguintes itens com o vendedor Carlos Eduardo:
--1 Mamão, 1 Pepsi de 2l, 6 Heinekens de 600ml, 1 Escova dental e 5 Maçãs.
INSERT INTO pedidos
(valor, cliente_cpf, vendedor_cpf)
VALUES
(9650, '803.713.500-42', '280.071.550-23');


INSERT INTO itens_do_pedido
(pedido_id, quantidade, produto_id)
VALUES
(2, 1, 1),
(2, 1, 10),
(2, 6, 11),
(2, 1, 15),
(2, 1, 2);

UPDATE produtos SET quantidade_em_estoque =122  WHERE id =1 ;
UPDATE produtos SET quantidade_em_estoque =11  WHERE id =10 ;
UPDATE produtos SET quantidade_em_estoque =494  WHERE id =11 ;
UPDATE produtos SET quantidade_em_estoque =43 WHERE id =15 ;
UPDATE produtos SET quantidade_em_estoque = 29 WHERE id =2 ;

--b) Ana Rodrigues comprou os seguintes itens com a vendedora Beatriz Souza Santos
--10 Mangas, 3 Uvas, 5 Mamões, 10 tomates e 2 Acelgas.
INSERT INTO pedidos
(valor, cliente_cpf, vendedor_cpf)
VALUES
(6460, '631.933.100-34', '232.625.460-03');

INSERT INTO itens_do_pedido
(pedido_id, quantidade, produto_id)
VALUES
(3,10, 17 ),
(3,3,18 ),
(3,5,1 ),
(3,10,5 ),
(3,2,6 );

UPDATE produtos SET quantidade_em_estoque = 166 WHERE id = 17;
UPDATE produtos SET quantidade_em_estoque = 87 WHERE id =18 ;
UPDATE produtos SET quantidade_em_estoque = 117 WHERE id =1 ;
UPDATE produtos SET quantidade_em_estoque = 78 WHERE id = 5;
UPDATE produtos SET quantidade_em_estoque = 11 WHERE id = 6;

--c) Maria da Conceição comprou os seguintes itens com a vendedora Beatriz Souza Santos
--1 Vassoura, 6 Águas sem gás e 5 Mangas.
INSERT INTO pedidos
(valor, cliente_cpf, vendedor_cpf)
VALUES
(4120, '756.705.050-18', '232.625.460-03' );

INSERT INTO itens_do_pedido
(pedido_id, quantidade, produto_id)
VALUES
(4,1, 13),
(4,6, 12),
(4,5, 17);

UPDATE produtos SET quantidade_em_estoque = 29 WHERE id = 13 ;
UPDATE produtos SET quantidade_em_estoque = 472  WHERE id =12 ;
UPDATE produtos SET quantidade_em_estoque = 161 WHERE id = 17;

--d) Maria da Conceição comprou os seguintes itens com o vendedor Rodrigo Sampaio
--1 Balde para lixo, 6 Uvas, 1 Macarrão parafuso, 3 Mamões, 20 tomates e 2 Acelgas.
INSERT INTO pedidos
(valor, cliente_cpf, vendedor_cpf)
VALUES
(9370, '756.705.050-18', '825.398.410-31');

INSERT INTO itens_do_pedido
(pedido_id, quantidade, produto_id)
VALUES
(5,1,16),
(5,6,18),
(5,1,7),
(5,3, 1),
(5,20, 5),
(5,2, 6);

UPDATE produtos SET quantidade_em_estoque =54  WHERE id =16 ;
UPDATE produtos SET quantidade_em_estoque = 81 WHERE id =18 ;
UPDATE produtos SET quantidade_em_estoque = 4 WHERE id = 7;
UPDATE produtos SET quantidade_em_estoque = 114 WHERE id = 1;
UPDATE produtos SET quantidade_em_estoque = 58 WHERE id = 5;
UPDATE produtos SET quantidade_em_estoque = 9 WHERE id = 6 ;

--e) Antonio Oliveira comprou os seguintes itens com o vendedor Rodrigo Sampaio
--8 Uvas, 1 Massa para lasanha, 3 Mangas, 8 tomates e 2 Heinekens 600ml.
INSERT INTO pedidos
(valor, cliente_cpf, vendedor_cpf)
VALUES
(8229, '676.428.690-61','825.398.410-31');

INSERT INTO itens_do_pedido
(pedido_id, quantidade, produto_id)
VALUES
(6,8,18),
(6,1,8),
(6,3,17),
(6,8,5),
(6,2, 11);

UPDATE produtos SET quantidade_em_estoque = 73 WHERE id = 18;
UPDATE produtos SET quantidade_em_estoque = 18 WHERE id = 8;
UPDATE produtos SET quantidade_em_estoque = 158 WHERE id = 17;
UPDATE produtos SET quantidade_em_estoque =50  WHERE id =5 ;
UPDATE produtos SET quantidade_em_estoque =492  WHERE id = 11;


--a) Faça uma listagem de todos os produtos cadastrados com o nome da sua respectiva categoria.
SELECT produtos.nome AS produto, categorias.nome AS categoria
FROM produtos
JOIN categorias ON categorias.id = produtos.categoria_id;

--b) Faça uma listagem de todos os pedidos com o nome do vendedor e o nome do cliente relacionado a venda.
SELECT pedidos.id AS pedido, vendedores.nome as vendedor, clientes.nome as cliente
FROM pedidos
JOIN vendedores ON vendedores.cpf = pedidos.vendedor_cpf 
JOIN clientes ON clientes.cpf = pedidos.cliente_cpf;

--c) Faça uma listagem de todas as categorias e a soma do estoque disponível de todos os produtos de cada categoria.
SELECT categorias.nome AS categoria, sum(produtos.quantidade_em_estoque) AS quantidade_estoque
FROM categorias
JOIN produtos ON produtos.categoria_id = categorias.id
GROUP BY categorias.nome;

--d) Faça uma listagem de todos os produtos e a quantidade vendida de cada produto.
SELECT produtos.nome AS produto, sum(itens_do_pedido.quantidade) AS quantidade_vendida
FROM produtos
JOIN itens_do_pedido ON itens_do_pedido.produto_id = produtos.id
GROUP BY produtos.nome;
