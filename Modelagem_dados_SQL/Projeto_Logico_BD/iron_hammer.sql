CREATE SCHEMA IF NOT EXISTS `Iron_Hammer` ;
USE `Iron_Hammer` ;

-- -----------------------------------------------------
-- Table `Iron_Hammer`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Iron_Hammer`.`Clients` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(20) NOT NULL,
  `sobre_nome` VARCHAR(30) NOT NULL,
  `CPF` CHAR(11) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `telefone` CHAR(11) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC));


-- -----------------------------------------------------
-- Table `Iron_Hammer`.`vehicles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Iron_Hammer`.`vehicles` (
  `id_veiculo` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(20) NOT NULL,
  `modelo` VARCHAR(20) NOT NULL,
  `cor` VARCHAR(15) NOT NULL,
  `ano` DATE NULL,
  `placa` CHAR(7) NOT NULL,
  `renavan` CHAR(11) NOT NULL,
  `Clients_id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_veiculo`, `Clients_id_cliente`),
  UNIQUE INDEX `placa_UNIQUE` (`placa` ASC),
  UNIQUE INDEX `renavan_UNIQUE` (`renavan` ASC),
  INDEX `fk_vehicles_Clients_idx` (`Clients_id_cliente` ASC),
  INDEX `unique_vehicle_client` (`id_veiculo`, `Clients_id_cliente`),
  CONSTRAINT `fk_vehicles_Clients`
    FOREIGN KEY (`Clients_id_cliente`)
    REFERENCES `Iron_Hammer`.`Clients` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Iron_Hammer`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Iron_Hammer`.`employees` (
  `id_empregado` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(20) NOT NULL,
  `sobre_nome` VARCHAR(30) NOT NULL,
  `CPF` CHAR(11) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `carteira_trabalho` CHAR(11) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `telefone` CHAR(11) NOT NULL,
  PRIMARY KEY (`id_empregado`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC),
  UNIQUE INDEX `carteira_trabalho_UNIQUE` (`carteira_trabalho` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC));


-- -----------------------------------------------------
-- Table `Iron_Hammer`.`suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Iron_Hammer`.`suppliers` (
  `id_fornecedor` INT NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(45) NOT NULL,
  `nome_fantasia` VARCHAR(20) NULL,
  `CNPJ` CHAR(14) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `contato` VARCHAR(30) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `telefone` CHAR(11) NOT NULL,
  PRIMARY KEY (`id_fornecedor`),
  UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC));


-- -----------------------------------------------------
-- Table `Iron_Hammer`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Iron_Hammer`.`account` (
  `id_conta_oficina` INT NOT NULL AUTO_INCREMENT,
  `banco` VARCHAR(10) NOT NULL,
  `agencia` CHAR(5) NOT NULL,
  `conta_corrente` CHAR(8) NOT NULL,
  `responsavel` VARCHAR(45) NOT NULL,
  `PIX` CHAR(11) NOT NULL,
  `saldo` REAL NOT NULL,
  PRIMARY KEY (`id_conta_oficina`),
  UNIQUE INDEX `id_conta_oficina_UNIQUE` (`id_conta_oficina` ASC),
  UNIQUE INDEX `conta_corrente_UNIQUE` (`conta_corrente` ASC),
  UNIQUE INDEX `PIX_UNIQUE` (`PIX` ASC));


-- -----------------------------------------------------
-- Table `Iron_Hammer`.`payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Iron_Hammer`.`payments` (
  `id_pagamento` INT NOT NULL AUTO_INCREMENT,
  `tipo_pagamento` ENUM('Receita', 'Despesa') NOT NULL,
  `data_pagamento` DATETIME NOT NULL,
  `metodo_pagamento` ENUM('Dinheiro', 'Boleto', 'PIX', 'Débito', 'Crédito') NOT NULL,
  `valor` REAL NOT NULL,
  `status_pagamento` ENUM('Processando', 'Concluido', 'Cancelado') NOT NULL,
  `detalhes` VARCHAR(60) NOT NULL,
  `account_id_conta_oficina` INT NOT NULL,
  PRIMARY KEY (`id_pagamento`, `account_id_conta_oficina`),
  INDEX `fk_payments_account1_idx` (`account_id_conta_oficina` ASC),
  CONSTRAINT `fk_payments_account1`
    FOREIGN KEY (`account_id_conta_oficina`)
    REFERENCES `Iron_Hammer`.`account` (`id_conta_oficina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Iron_Hammer`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Iron_Hammer`.`orders` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `tipo_item` ENUM('Peça', 'Material') NOT NULL,
  `item` VARCHAR(60) NOT NULL,
  `quantidade` REAL NOT NULL,
  `data_pedido` DATE NOT NULL,
  `valor_pedido` REAL NOT NULL,
  `prazo_entrega` DATE NOT NULL,
  `status_pedido` ENUM('Processando', 'Concluído', 'Cancelado') NOT NULL,
  `payments_id_pagamento` INT NOT NULL,
  `payments_account_id_conta_oficina` INT NOT NULL,
  `suppliers_id_fornecedor` INT NOT NULL,
  PRIMARY KEY (`id_pedido`, `payments_id_pagamento`, `payments_account_id_conta_oficina`, `suppliers_id_fornecedor`),
  INDEX `fk_orders_payments1_idx` (`payments_id_pagamento` ASC, `payments_account_id_conta_oficina` ASC),
  INDEX `fk_orders_suppliers1_idx` (`suppliers_id_fornecedor` ASC),
  CONSTRAINT `fk_orders_payments1`
    FOREIGN KEY (`payments_id_pagamento` , `payments_account_id_conta_oficina`)
    REFERENCES `Iron_Hammer`.`payments` (`id_pagamento` , `account_id_conta_oficina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_suppliers1`
    FOREIGN KEY (`suppliers_id_fornecedor`)
    REFERENCES `Iron_Hammer`.`suppliers` (`id_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Iron_Hammer`.`service_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Iron_Hammer`.`service_history` (
  `id_historico` INT NOT NULL AUTO_INCREMENT,
  `data_servico` DATETIME NOT NULL,
  `duracao` INT(3) NOT NULL,
  `vehicles_id_veiculo` INT NOT NULL,
  `vehicles_Clients_id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_historico`, `vehicles_id_veiculo`, `vehicles_Clients_id_cliente`),
  INDEX `fk_service_history_vehicles1_idx` (`vehicles_id_veiculo` ASC, `vehicles_Clients_id_cliente` ASC),
  CONSTRAINT `fk_service_history_vehicles1`
    FOREIGN KEY (`vehicles_id_veiculo` , `vehicles_Clients_id_cliente`)
    REFERENCES `Iron_Hammer`.`vehicles` (`id_veiculo` , `Clients_id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Iron_Hammer`.`services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Iron_Hammer`.`services` (
  `id_servico` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `detalhes` VARCHAR(60) NOT NULL,
  `tempo_estimado` VARCHAR(10) NOT NULL,
  `preco` REAL NOT NULL,
  `service_history_id_historico` INT NOT NULL,
  `payments_id_pagamento` INT NOT NULL,
  `payments_account_id_conta_oficina` INT NOT NULL,
  PRIMARY KEY (`id_servico`, `service_history_id_historico`, `payments_id_pagamento`, `payments_account_id_conta_oficina`),
  INDEX `fk_services_service_history1_idx` (`service_history_id_historico` ASC),
  INDEX `fk_services_payments1_idx` (`payments_id_pagamento` ASC, `payments_account_id_conta_oficina` ASC),
  CONSTRAINT `fk_services_service_history1`
    FOREIGN KEY (`service_history_id_historico`)
    REFERENCES `Iron_Hammer`.`service_history` (`id_historico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_services_payments1`
    FOREIGN KEY (`payments_id_pagamento` , `payments_account_id_conta_oficina`)
    REFERENCES `Iron_Hammer`.`payments` (`id_pagamento` , `account_id_conta_oficina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Iron_Hammer`.`parts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Iron_Hammer`.`parts` (
  `id_peca` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `categoria` VARCHAR(20) NOT NULL,
  `detalhes` VARCHAR(60) NOT NULL,
  `preco_unitario` REAL NOT NULL,
  PRIMARY KEY (`id_peca`));


-- -----------------------------------------------------
-- Table `Iron_Hammer`.`service_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Iron_Hammer`.`service_categories` (
  `id_categorias_servico` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `detalhes` VARCHAR(60) NULL,
  `services_id_servico` INT NOT NULL,
  `services_service_history_id_historico` INT NOT NULL,
  PRIMARY KEY (`id_categorias_servico`, `services_id_servico`, `services_service_history_id_historico`),
  INDEX `fk_service_categories_services1_idx` (`services_id_servico` ASC, `services_service_history_id_historico` ASC),
  CONSTRAINT `fk_service_categories_services1`
    FOREIGN KEY (`services_id_servico` , `services_service_history_id_historico`)
    REFERENCES `Iron_Hammer`.`services` (`id_servico` , `service_history_id_historico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Iron_Hammer`.`materials`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Iron_Hammer`.`materials` (
  `id_material` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(40) NULL,
  `categoria` VARCHAR(20) NULL,
  `detalhes` VARCHAR(60) NULL,
  `preco_unitario` REAL NULL,
  PRIMARY KEY (`id_material`));


-- -----------------------------------------------------
-- Table `Iron_Hammer`.`employee_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Iron_Hammer`.`employee_role` (
  `id_cargo_funcionario` INT NOT NULL AUTO_INCREMENT,
  `cargo` VARCHAR(15) NOT NULL,
  `detalhes` VARCHAR(90) NOT NULL,
  `employees_id_empregado` INT NOT NULL,
  PRIMARY KEY (`id_cargo_funcionario`, `employees_id_empregado`),
  INDEX `fk_employee_role_employees1_idx` (`employees_id_empregado` ASC),
  CONSTRAINT `fk_employee_role_employees1`
    FOREIGN KEY (`employees_id_empregado`)
    REFERENCES `Iron_Hammer`.`employees` (`id_empregado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Iron_Hammer`.`part_supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Iron_Hammer`.`part_supplier` (
  `parts_id_peca` INT NOT NULL,
  `suppliers_id_fornecedor` INT NOT NULL,
  PRIMARY KEY (`parts_id_peca`, `suppliers_id_fornecedor`),
  INDEX `fk_parts_has_suppliers_suppliers1_idx` (`suppliers_id_fornecedor` ASC),
  INDEX `fk_parts_has_suppliers_parts1_idx` (`parts_id_peca` ASC),
  CONSTRAINT `fk_parts_has_suppliers_parts1`
    FOREIGN KEY (`parts_id_peca`)
    REFERENCES `Iron_Hammer`.`parts` (`id_peca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_parts_has_suppliers_suppliers1`
    FOREIGN KEY (`suppliers_id_fornecedor`)
    REFERENCES `Iron_Hammer`.`suppliers` (`id_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Iron_Hammer`.`material_supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Iron_Hammer`.`material_supplier` (
  `suppliers_id_fornecedor` INT NOT NULL,
  `materials_id_material` INT NOT NULL,
  PRIMARY KEY (`suppliers_id_fornecedor`, `materials_id_material`),
  INDEX `fk_suppliers_has_materials_materials1_idx` (`materials_id_material` ASC),
  INDEX `fk_suppliers_has_materials_suppliers1_idx` (`suppliers_id_fornecedor` ASC),
  CONSTRAINT `fk_suppliers_has_materials_suppliers1`
    FOREIGN KEY (`suppliers_id_fornecedor`)
    REFERENCES `Iron_Hammer`.`suppliers` (`id_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_suppliers_has_materials_materials1`
    FOREIGN KEY (`materials_id_material`)
    REFERENCES `Iron_Hammer`.`materials` (`id_material`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Iron_Hammer`.`employees_assignments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Iron_Hammer`.`employees_assignments` (
  `employees_id_empregado` INT NOT NULL,
  `services_id_servico` INT NOT NULL,
  `services_service_history_id_historico` INT NOT NULL,
  `services_payments_id_pagamento` INT NOT NULL,
  `services_payments_account_id_conta_oficina` INT NOT NULL,
  PRIMARY KEY (`employees_id_empregado`, `services_id_servico`, `services_service_history_id_historico`, `services_payments_id_pagamento`, `services_payments_account_id_conta_oficina`),
  INDEX `fk_employees_assignments_services1_idx` (`services_id_servico` ASC, `services_service_history_id_historico` ASC, `services_payments_id_pagamento` ASC, `services_payments_account_id_conta_oficina` ASC),
  INDEX `fk_employees_assignments_employees1_idx` (`employees_id_empregado` ASC),
  CONSTRAINT `fk_employees_assignments_employees1`
    FOREIGN KEY (`employees_id_empregado`)
    REFERENCES `Iron_Hammer`.`employees` (`id_empregado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employees_assignments_services1`
    FOREIGN KEY (`services_id_servico` , `services_service_history_id_historico` , `services_payments_id_pagamento` , `services_payments_account_id_conta_oficina`)
    REFERENCES `Iron_Hammer`.`services` (`id_servico` , `service_history_id_historico` , `payments_id_pagamento` , `payments_account_id_conta_oficina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Iron_Hammer`.`parts_inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Iron_Hammer`.`parts_inventory` (
  `id_inventorio_pecas` INT NOT NULL AUTO_INCREMENT,
  `quantidade` REAL NOT NULL,
  `data_recebimento` DATE NULL,
  `parts_id_peca` INT NOT NULL,
  `suppliers_id_fornecedor` INT NOT NULL,
  PRIMARY KEY (`id_inventorio_pecas`, `parts_id_peca`, `suppliers_id_fornecedor`),
  INDEX `fk_parts_inventory_parts1_idx` (`parts_id_peca` ASC) VISIBLE,
  INDEX `fk_parts_inventory_suppliers1_idx` (`suppliers_id_fornecedor` ASC) VISIBLE,
  CONSTRAINT `fk_parts_inventory_parts1`
    FOREIGN KEY (`parts_id_peca`)
    REFERENCES `Iron_Hammer`.`parts` (`id_peca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_parts_inventory_suppliers1`
    FOREIGN KEY (`suppliers_id_fornecedor`)
    REFERENCES `Iron_Hammer`.`suppliers` (`id_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Iron_Hammer`.`materials_inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Iron_Hammer`.`materials_inventory` (
  `id_inventorio_materiais` INT NOT NULL AUTO_INCREMENT,
  `quantidade` REAL NOT NULL,
  `data_recebimento` DATE NULL,
  `materials_id_material` INT NOT NULL,
  `suppliers_id_fornecedor` INT NOT NULL,
  PRIMARY KEY (`id_inventorio_materiais`, `materials_id_material`, `suppliers_id_fornecedor`),
  INDEX `fk_materials_inventory_materials1_idx` (`materials_id_material` ASC) VISIBLE,
  INDEX `fk_materials_inventory_suppliers1_idx` (`suppliers_id_fornecedor` ASC) VISIBLE,
  CONSTRAINT `fk_materials_inventory_materials1`
    FOREIGN KEY (`materials_id_material`)
    REFERENCES `Iron_Hammer`.`materials` (`id_material`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_materials_inventory_suppliers1`
    FOREIGN KEY (`suppliers_id_fornecedor`)
    REFERENCES `Iron_Hammer`.`suppliers` (`id_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



