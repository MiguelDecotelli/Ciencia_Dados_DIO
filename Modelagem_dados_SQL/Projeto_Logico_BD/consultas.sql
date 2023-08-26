-- 1. Listar todos os clientes cadastrados:
--@block
SELECT * FROM Clients;

-- 2.Listar todos os fornecedores:
--@block
SELECT * FROM suppliers;

-- 3.Listar todos os veículos com suas informações de proprietário:
--@block
SELECT vehicles.*, Clients.nome, Clients.sobre_nome
FROM vehicles
JOIN Clients ON Clients_id_cliente = id_cliente;

-- 4. Listar todas as peças e materiais disponíveis no estoque:
--@block
SELECT * FROM parts UNION SELECT * FROM materials ORDER BY preco_unitario;

-- 5.Listar todos os serviços agendados:
--@block
SELECT service_history.data_servico, vehicles.marca, vehicles.modelo, services.nome
FROM service_history
JOIN vehicles ON service_history.vehicles_id_veiculo = vehicles.id_veiculo
JOIN services ON service_history.id_historico = services.service_history_id_historico;

-- 6.Listar os pedidos de peças/materiais realizados por um fornecedor específico:
--@block
SELECT orders.*, suppliers.razao_social
FROM orders
JOIN suppliers ON orders.suppliers_id_fornecedor = suppliers.id_fornecedor
WHERE orders.tipo_item = 'Peça' OR orders.tipo_item = 'Material'
ORDER BY orders.data_pedido DESC
LIMIT 10;

-- 7.Calcular o total de pagamentos recebidos por meio de cada método de pagamento:
--@block
SELECT metodo_pagamento, SUM(valor) AS total_pagamentos
FROM payments
WHERE tipo_pagamento = 'Receita'
GROUP BY metodo_pagamento;

-- 8.Listar todos os serviços com suas respectivas categorias:
--@block
SELECT services.*, service_categories.nome AS categoria
FROM services
JOIN service_categories ON services.id_servico = services_categories.services_id_servico;

-- 9.Encontrar as peças/materiais em estoque com quantidade inferior a um valor específico:
--@block
SELECT parts.nome, parts_inventory.quantidade
FROM parts
JOIN parts_inventory ON parts.id_peca = parts_inventory.parts_id_peca
WHERE parts_inventory.quantidade < 10;

-- 10.Listar os empregados que têm mais de 5 anos de experiência na oficina:
--@block
SELECT employees.*, TIMESTAMPDIFF(YEAR, employees.data_nascimento, NOW()) AS experiencia_anos
FROM employees
WHERE TIMESTAMPDIFF(YEAR, employees.data_nascimento, NOW()) >= 5;


-- 11.Encontrar a receita total obtida em um determinado período:
--@block
SELECT SUM(valor) AS receita_total
FROM payments
WHERE tipo_pagamento = 'Receita' AND data_pagamento BETWEEN '2023-01-01' AND '2023-06-30';

-- 12.Listar os veículos que não realizaram serviços nos últimos 6 meses:
--@block
SELECT vehicles.*, service_history.data_servico
FROM vehicles
LEFT JOIN service_history ON vehicles.id_veiculo = service_history.vehicles_id_veiculo
WHERE service_history.data_servico IS NULL OR service_history.data_servico < DATE_SUB(NOW(), INTERVAL 6 MONTH);

-- 13.Encontrar os empregados que realizaram mais de 10 serviços:
--@block
SELECT employees.*, COUNT(services.id_servico) AS total_servicos
FROM employees
JOIN employees_assignments ON employees.id_empregado = employees_assignments.employees_id_empregado
JOIN services ON employees_assignments.services_id_servico = services.id_servico
GROUP BY employees.id_empregado
HAVING total_servicos > 10;


-- 14.Listar os fornecedores que têm peças e materiais em estoque:
--@block
SELECT suppliers.*
FROM suppliers
WHERE EXISTS (
    SELECT 1
    FROM parts_inventory
    WHERE parts_inventory.suppliers_id_fornecedor = suppliers.id_fornecedor
) OR EXISTS (
    SELECT 1
    FROM materials_inventory
    WHERE materials_inventory.suppliers_id_fornecedor = suppliers.id_fornecedor
);

-- 15.Encontrar os empregados que participaram de um serviço com pagamento superior a 500 reais:
--@block
SELECT employees.*, services.nome AS servico, payments.valor AS pagamento
FROM employees
JOIN employees_assignments ON employees.id_empregado = employees_assignments.employees_id_empregado
JOIN services ON employees_assignments.services_id_servico = services.id_servico
JOIN payments ON services.payments_id_pagamento = payments.id_pagamento
WHERE payments.valor > 500;

