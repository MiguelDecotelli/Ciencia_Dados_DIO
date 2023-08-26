--@block
USE `Iron_Hammer`;
--@block
INSERT INTO Clients (
        nome,
        sobre_nome,
        CPF,
        endereco,
        email,
        telefone
    )
VALUES (
        'Jerry',
        'Seinfeld',
        '51477028579',
        '129 West 81st Street, apartment 5A',
        'seinfeld@seinfeld.com',
        '12345678901'
    ),
    (
        'George',
        'Constanza',
        '34920061161',
        '1344 Queens Boulevard',
        'constanza@seinfeld.com',
        '23456789012'
    ),
    (
        'Cosmo',
        'Kramer',
        '22132591946',
        '129 West 81st Street, apartment 5B',
        'kramer@seinfeld.com',
        '34567890123'
    ),
    (
        'Elaine',
        'Benes',
        '61132873606',
        '16 West 75th Street, apartment 2G',
        'benes@seinfeld.com',
        '45678901234'
    ),
    (
        '',
        'Newman',
        '23857789395',
        '129 West 81st Street, apartment 5E',
        'newman@seinfeld.com',
        '56789012345'
    ),
    (
        'Susan',
        'Ross',
        '59061735360',
        '114 West 16th Street',
        'ross@seinfeld.com',
        '67890123456'
    ),
    (
        'Tim',
        'Wathley',
        '03689035910',
        '77th St. and CPW',
        'wathley@seinfeld.com',
        '78901234567'
    );
--@block
INSERT INTO account (
        id_conta_oficina,
        banco,
        agencia,
        conta_corrente,
        responsavel,
        PIX,
        saldo
    )
VALUES (
        1,
        'Safra',
        '001',
        '013579-0',
        'Miguel Stark',
        '88939280512',
        100000
    );
--@block    
INSERT INTO employees (
        nome,
        sobre_nome,
        CPF,
        data_nascimento,
        carteira_trabalho,
        endereco,
        email,
        telefone
    )
VALUES (
        'Ross',
        'Geller',
        '54663856039',
        '1982-03-19',
        '01234567-89',
        '17th Grove Street',
        'rossgeller@friends.com',
        '98765432100'
    ),
    (
        'Rachel',
        'Green',
        '70090442873',
        '1985-09-05',
        '12345678-90',
        '130 East 23rd Street, apartment 3',
        'rachelgreen@friends.com',
        '98765432101'
    ),
    (
        'Chandler',
        'Bing',
        '22334270687',
        '1982-07-25',
        '23456789-01',
        '130 East 23rd Street, apartment 4',
        'chandlerbing@friends.com',
        '98765432102'
    ),
    (
        'Monica',
        'Geller',
        '19176610020',
        '1985-10-15',
        '34567890-12',
        '130 East 23rd Street, apartment 3',
        'monicageller@friends.com',
        '98765432103'
    ),
    (
        'Joey',
        'Tribbiani',
        '11631539230',
        '1981-05-28',
        '45678901-23',
        '130 East 23rd Street, apartment 4',
        'joeytribbiani@friends.com',
        '98765432104'
    ),
    (
        'Phoebe',
        'Buffay',
        '45361451410',
        '1983-02-08',
        '56789012-34',
        '5, Morton Street, apartment 14',
        'phoebebuffay@friends.com',
        '98765432105'
    ),
    (
        'Miguel',
        'Stark',
        '70116407620',
        '1981-07-31',
        '67890123-45',
        '130 East 23rd Street, apartment 5',
        'miguelstark@friends.com',
        '98765432106'
    );
--@block    
INSERT INTO employee_role (
        cargo,
        detalhes,
        employees_id_empregado
    )
VALUES (
        'Recepcionista',
        'Acompanhamento, direcionamento e agendamento dos clientes',
        27
    ),
    (
        'Limpeza',
        'Limpeza de todas as dependências da oficina',
        23
    ),
    (
        'Copa',
        'Responsável pela alimentação dos funcionários e clientes',
        23
    ),
    (
        'Financeiro',
        'Responsável pelos pagamentos e recebimento das receitas',
        28
    ),
    (
        'Comercial',
        'Responsável por negociar a compra de peças e materiais',
        25
    ),
    (
        'Almoxarifado',
        'Manutenção do estoque da oficina',
        25
    ),
    (
        'Pintura',
        'Serviço de pintura dos carros da oficina',
        26
    ),
    (
        'Polimento',
        'Serviço de polimentos dos carros da oficina',
        26
    ),
    (
        'Funilaria',
        'Reparar a carroceria dos veículos',
        22
    ),
    (
        'Alinhamento',
        'Responsável por alinhar o carro',
        24
    ),
    (
        'Balanceamento',
        'Responsável por ajustar o equilíbrio do carro',
        24
    );
--@block
INSERT INTO materials (
        nome,
        categoria,
        detalhes,
        preco_unitario
    )
VALUES (
        'Tinta spray azul',
        'Pintura',
        'Usada para corrigir a tonalidade da lataria. Unidade',
        25
    ),
    (
        'Tinta spray preta',
        'Pintura',
        'Usada para corrigir a tonalidade da lataria. Unidade',
        25
    ),
    (
        'Tinta spray vermelha',
        'Pintura',
        'Usada para corrigir a tonalidade da lataria. Unidade',
        25
    ),
    (
        'Tinta spray prata',
        'Pintura',
        'Usada para corrigir a tonalidade da lataria. Unidade',
        25
    ),
    (
        'Polia',
        'Polimento',
        'Usada para dar o acabamento. Unidade',
        10
    ),
    (
        'Cera',
        'Polimento',
        'Usada para dar o acabamento. Unidade',
        30
    );
--@block
INSERT INTO parts (
        nome,
        categoria,
        detalhes,
        preco_unitario
    )
VALUES (
        'Farol',
        'Lanternagem',
        'Conjunto de faróis Chevrolet Ônix. Par',
        150
    ),
    (
        'Retrovisor',
        'Lanternagem',
        'Retrovisor esquerdo Chevrolet Ônix. Unidade',
        120
    ),
    (
        'Para-choque dianteiro',
        'Lanternagem',
        'Para-choque Chevrolet Ônix. Unidade',
        300
    ),
    (
        'Para-choque traseiro',
        'Lanternagem',
        'Para-choque Chevrolet Ônix. Unidade',
        250
    ),
    (
        'Pneu',
        'Acessórios',
        'Pneu aro 20',
        90
    );
--@block
INSERT INTO suppliers (
        razao_social,
        nome_fantasia,
        CNPJ,
        endereco,
        contato,
        email,
        telefone
    )
VALUES (
        'Ford montadora',
        'Ford',
        '12345678900012',
        'Av. Ayrton Senna, 2541 - Barra da Tijuca',
        'Steve Harris',
        'steve@ironmaiden.com',
        '12345678920'
    ),
    (
        'General Motors',
        'Chevrolet',
        '12345678900013',
        'Av. das Américas, 17050 - Recreio',
        'Bruce Dickinson',
        'bruck@ironmaiden.com',
        '12345678921'
    ),
    (
        'Fiat montadora',
        'FIAT',
        '12345678900014',
        'Av. das Américas, 10605 - Barra da Tijuca',
        'Dave Murray',
        'dave@ironmaiden.com',
        '12345678922'
    ),
    (
        'VolksWagen montadora',
        'Volkswagen',
        '12345678900015',
        'Av. das Américas, 17050 - Recreio',
        'Nicko McBrain',
        'nicko@ironmaiden.com',
        '12345678923'
    ),
    (
        'Super-Pro Comércio de Equipamentos e Ferramentas Ltda',
        'Ferramentas Kennedy',
        '08858579001535',
        'Rod. BR 470 Ingo Hering, 1277',
        'Adrian Smith',
        'adrian@ironmaiden.com',
        '12345678923'
    ),
    (
        'Suvinil tintas',
        'Suvinil',
        '12345678900017',
        'Av. das Américas, 14645 - Recreio dos Bandeirantes',
        'Janick Gers',
        'janick@ironmaiden.com',
        '12345678925'
    );
--@block
INSERT INTO vehicles(marca, modelo, cor, ano, placa, renavam, Clients_id_cliente)
VALUES('Ford', 'Saab', 'preta', '1985-07-10', 'JER1991', '12345678910', 9);