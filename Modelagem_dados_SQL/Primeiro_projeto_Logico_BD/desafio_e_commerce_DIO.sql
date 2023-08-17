
CREATE SCHEMA IF NOT EXISTS `e_commerce` ;
USE `e_commerce` ;

-- -----------------------------------------------------
-- Table `e_commerce`.`cliente_pessoa_fisica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce`.`cliente_pessoa_fisica` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `SobreNome` VARCHAR(45) NOT NULL,
  `CPF` CHAR(11) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `Telefone` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Endereço` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `EMail_UNIQUE` (`Email` ASC));


-- -----------------------------------------------------
-- Table `e_commerce`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce`.`produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `valor` FLOAT NOT NULL,
  `relacao_produto_pedido` VARCHAR(45) NULL,
  PRIMARY KEY (`idProduto`));


-- -----------------------------------------------------
-- Table `e_commerce`.`estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce`.`estoque` (
  `idEstoque` INT NOT NULL AUTO_INCREMENT,
  `local` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstoque`),
  UNIQUE INDEX `idEstoque_UNIQUE` (`idEstoque` ASC));


-- -----------------------------------------------------
-- Table `e_commerce`.`estoque_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce`.`estoque_produto` (
  `Estoque_idEstoque` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`Estoque_idEstoque`, `Produto_idProduto`),
  INDEX `fk_Estoque_produto_Produto1_idx` (`Produto_idProduto` ASC),
  CONSTRAINT `fk_Estoque_produto_Estoque1`
    FOREIGN KEY (`Estoque_idEstoque`)
    REFERENCES `e_commerce`.`estoque` (`idEstoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estoque_produto_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `e_commerce`.`produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `e_commerce`.`fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce`.`fornecedor` (
  `idFornecedor` INT NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(90) NOT NULL,
  `nome_fantasia` VARCHAR(45) NOT NULL,
  `CNPJ` CHAR(14) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `contato` VARCHAR(45) NOT NULL,
  `telefone` CHAR(11) NOT NULL,
  PRIMARY KEY (`idFornecedor`),
  UNIQUE INDEX `cnpj_UNIQUE` (`CNPJ` ASC),
  UNIQUE INDEX `razao_social_UNIQUE` (`razao_social` ASC),
  UNIQUE INDEX `idFornecedor_UNIQUE` (`idFornecedor` ASC));


-- -----------------------------------------------------
-- Table `e_commerce`.`vendedor_terceirizado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce`.`vendedor_terceirizado` (
  `idVendedor` INT NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(90) NOT NULL,
  `nome_fantasia` VARCHAR(45) NOT NULL,
  `CNPJ` CHAR(14) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `contato` VARCHAR(45) NOT NULL,
  `telefone` CHAR(11) NOT NULL,
  PRIMARY KEY (`idVendedor`),
  UNIQUE INDEX `idVendedor_UNIQUE` (`idVendedor` ASC),
  UNIQUE INDEX `cnpj_UNIQUE` (`CNPJ` ASC),
  UNIQUE INDEX `razao_social_UNIQUE` (`razao_social` ASC));


-- -----------------------------------------------------
-- Table `e_commerce`.`produtos_vendedor_terceirizado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce`.`produtos_vendedor_terceirizado` (
  `Vendedor_terceirizado_idVendedor` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`Vendedor_terceirizado_idVendedor`, `Produto_idProduto`),
  INDEX `fk_Produtos_vendedor_terceirizado_Produto1_idx` (`Produto_idProduto` ASC),
  CONSTRAINT `fk_Produtos_vendedor_terceirizado_Vendedor_terceirizado1`
    FOREIGN KEY (`Vendedor_terceirizado_idVendedor`)
    REFERENCES `e_commerce`.`vendedor_terceirizado` (`idVendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produtos_vendedor_terceirizado_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `e_commerce`.`produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `e_commerce`.`cliente_pessoa_juridica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce`.`cliente_pessoa_juridica` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(45) NOT NULL,
  `nome_fantasia` VARCHAR(45) NOT NULL,
  `CNPJ` CHAR(14) NOT NULL,
  `contato` VARCHAR(45) NOT NULL,
  `Telefone` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Endereço` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `EMail_UNIQUE` (`Email` ASC));


-- -----------------------------------------------------
-- Table `e_commerce`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce`.`pedido` (
  `idpedido` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `forma_pagamento` ENUM('Pix', 'Boleto', 'Débito', 'Crédito à vista', 'Crédito parcelado') NOT NULL,
  `status` ENUM('Processando', 'Aguardando', 'Aprovado', 'Reprovado', 'Cancelado', 'Em Rota', 'Atrasado', 'Entregue') NOT NULL DEFAULT 'Processando',
  `frete` FLOAT NOT NULL,
  `codigo_rastreamento` VARCHAR(45) NOT NULL,
  `cliente_idCliente` INT NOT NULL,
  `cliente_pessoa_juridica_idCliente` INT NOT NULL,
  PRIMARY KEY (`idpedido`, `cliente_idCliente`, `cliente_pessoa_juridica_idCliente`),
  UNIQUE INDEX `idpedido_UNIQUE` (`idpedido` ASC) VISIBLE,
  INDEX `fk_pedido_cliente1_idx` (`cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_pedido_cliente_pessoa_juridica1_idx` (`cliente_pessoa_juridica_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `e_commerce`.`cliente_pessoa_fisica` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_cliente_pessoa_juridica1`
    FOREIGN KEY (`cliente_pessoa_juridica_idCliente`)
    REFERENCES `e_commerce`.`cliente_pessoa_juridica` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `e_commerce`.`status_produto_ou_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce`.`status_produto_ou_pedido` (
  `Produto_idProduto` INT NOT NULL,
  `pedido_idpedido` INT NOT NULL,
  `quantidade` INT NULL DEFAULT 0,
  `status` ENUM('Disponivel', 'Indisponivel', 'Fora_de_estoque') NOT NULL,
  PRIMARY KEY (`Produto_idProduto`, `pedido_idpedido`),
  INDEX `fk_status_produto_ou_pedido_pedido1_idx` (`pedido_idpedido` ASC),
  CONSTRAINT `fk_Status_produto_ou_pedido_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `e_commerce`.`produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_status_produto_ou_pedido_pedido1`
    FOREIGN KEY (`pedido_idpedido`)
    REFERENCES `e_commerce`.`pedido` (`idpedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `e_commerce`.`disponibilizando_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce`.`disponibilizando_produto` (
  `Fornecedor_idFornecedor` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  PRIMARY KEY (`Fornecedor_idFornecedor`, `Produto_idProduto`),
  INDEX `fk_Disponibilizando_produto_Produto1_idx` (`Produto_idProduto` ASC),
  CONSTRAINT `fk_Disponibilizando_produto_Fornecedor1`
    FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `e_commerce`.`fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Disponibilizando_produto_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `e_commerce`.`produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
