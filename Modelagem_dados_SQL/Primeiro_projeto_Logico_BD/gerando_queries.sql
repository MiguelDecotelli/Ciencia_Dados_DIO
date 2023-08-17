--@block
-- Total de clientes:
SELECT COUNT(*) AS TotalClientes
FROM cliente_pessoa_fisica;

--@block
-- Total de produtos por categoria:
SELECT categoria, COUNT(*) AS TotalProdutos
FROM produto
GROUP BY categoria;

--@block
-- Total de pedidos por cliente:
SELECT Nome, COUNT(idpedido) AS TotalPedidos
FROM cliente_pessoa_fisica
LEFT JOIN pedido ON idCliente = cliente_idCliente
GROUP BY Nome;


--@block
-- Produtos e seus fornecedores
SELECT descricao AS Produto, razao_social AS Fornecedor
FROM produto
JOIN disponibilizando_produto dp ON idProduto = Produto_idProduto
JOIN fornecedor ON Fornecedor_idFornecedor = idFornecedor;

--@block
-- Total de produtos em estoque por local 
SELECT local, COUNT(Produto_idProduto) AS TotalProdutos
FROM estoque
LEFT JOIN estoque_produto ep ON idEstoque = Estoque_idEstoque
GROUP BY local;

--@block
-- Top 3 clientes com mais pedidos
SELECT Nome, COUNT(idpedido) AS TotalPedidos
FROM cliente_pessoa_fisica
LEFT JOIN pedido ON idCliente = cliente_idCliente
GROUP BY Nome
ORDER BY TotalPedidos DESC
LIMIT 3;

--@block
-- Pedidos com produtos esgotados
SELECT p.idpedido, p.descricao, GROUP_CONCAT(pr.descricao) AS ProdutosEsgotados
FROM pedido p
JOIN status_produto_ou_pedido sp ON p.idpedido = sp.pedido_idpedido
JOIN produto pr ON sp.Produto_idProduto = pr.idProduto
WHERE sp.status = 'Indisponivel'
GROUP BY p.idpedido;

--@block
-- Fornecedores com produtos fora de estoque
SELECT f.razao_social, GROUP_CONCAT(pr.descricao) AS ProdutosForaDeEstoque
FROM fornecedor f
JOIN disponibilizando_produto dp ON f.idFornecedor = dp.Fornecedor_idFornecedor
JOIN produto pr ON dp.Produto_idProduto = pr.idProduto
JOIN status_produto_ou_pedido sp ON pr.idProduto = sp.Produto_idProduto
WHERE sp.status = 'Fora_de_estoque'
GROUP BY f.razao_social;

