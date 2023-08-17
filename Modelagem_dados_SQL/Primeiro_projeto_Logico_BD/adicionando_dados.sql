--@block
INSERT INTO e_commerce.cliente_pessoa_fisica (
        Nome,
        SobreNome,
        CPF,
        data_nascimento,
        Telefone,
        Email,
        Endereço
    )
VALUES 
        (
        'Tony',
        'Stark',
        '11111111111',
        '1978-01-15',
        '1234567890',
        'ironman@avengers.com',
        '200, Park Avenue'
    ),
    (
        'Steve',
        'Rogers',
        '22222222222',
        '1941-07-04',
        '1234567891',
        'captainamerica@avengers.com',
        '200, Park Avenue'
    ),
    (
        'Bruce',
        'Banner',
        '33333333333',
        '1974-09-02',
        '1234567891',
        'hulk@avengers.com',
        '200, Park Avenue'
    ),
        (
        'Thor',
        'Odinson',
        '44444444444',
        '1510-05-10',
        '1234567891',
        'thor@avengers.com',
        '200, Park Avenue'
    ),
        (
        'Clint',
        'Barton',
        '55555555555',
        '1980-03-20',
        '1234567891',
        'hawkeye@avengers.com',
        '200, Park Avenue'
    ),
        (
        'Natasha',
        'Romanoff',
        '66666666666',
        '1982-10-22',
        '1234567891',
        'blackwidow@avengers.com',
        '200, Park Avenue'
    );
--@block
SELECT *
from cliente_pessoa_juridica;
--@block
INSERT INTO e_commerce.cliente_pessoa_juridica (
        razao_social,
        nome_fantasia,
        CNPJ,
        contato,
        Telefone,
        Email,
        Endereço
    )
VALUES (
        'Strategic Homeland Intervention, Enforcement and Logistics Division',
        'S.H.I.E.L.D',
        '12345678900012',
        'Maria Hill',
        '1234567891',
        'avengers@shield.com',
        '200, Park Avenue'
    );
--@block
INSERT INTO e_commerce.produto (
        nome,
        categoria,
        descricao,
        valor
    )
VALUES (
        'Vibranium',
        'Liga metálica',
        'Material extraído do solo de Wakanda, Vibranium é comumente utilzado na criação de armaduras e armas de combate.',
        500
    );
--@block
INSERT INTO e_commerce.estoque (local)
VALUES ('Wakanda'),
    ('Talocan');
--@block
INSERT INTO e_commerce.estoque_produto (Estoque_idEstoque, Produto_idProduto, quantidade)
VALUES (1, 1, 9000000),
    (2, 1, 350000);
--@block
INSERT INTO e_commerce.fornecedor (
        razao_social,
        nome_fantasia,
        CNPJ,
        endereco,
        contato,
        telefone
    )
VALUES (
        'Reino de Wakanda',
        'Wakanda Forever',
        23456789011123,
        '1, King T"Chala Avenue',
        'Okoye',
        '88888888888'
    ),
    (
        'Reino de Talocan',
        'Namoris',
        34567890122234,
        '100, Maya Culture Avenue',
        'Attuma',
        '99999999999'
    );
cliente_idCliente --@block
INSERT INTO e_commerce.pedido (
        descricao,
        forma_pagamento,
        status,
        frete,
        codigo_rastreamento,
        cliente_idCliente,
        cliente_pessoa_juridica_idCliente
    )
VALUES (
        'Nova armadura do Homem de Ferro',
        'Débito',
        'Aprovado',
        0,
        '1a3rt567d88w',
        1,
        1
    );
--@block
INSERT INTO e_commerce.status_produto_ou_pedido (
        Produto_idProduto,
        pedido_idpedido,
        quantidade,
        status
    )
VALUES (1, 2, 12500000, 'Disponivel');
--@block
INSERT INTO e_commerce.disponibilizando_produto (Fornecedor_idFornecedor, Produto_idProduto)
VALUES (1, 1);