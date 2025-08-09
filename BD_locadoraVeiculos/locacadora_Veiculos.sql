CREATE DATABASE locadoraVeiculos;
USE locadoraVeiculos;

CREATE TABLE IF NOT EXISTS Pagamento (
	idPagamento int NOT NULL UNIQUE,
	forma enum ('Pix', 'Cartão' ,'Dinheiro') NOT NULL,
	dataPagamento date NOT NULL,
	valorTotal decimal(7,2) NOT NULL,
	estado enum ('Pago', 'Pendente') NOT NULL,
	PRIMARY KEY (idPagamento)
);

CREATE TABLE IF NOT EXISTS Cliente (
	idCliente int NOT NULL UNIQUE,
	CPF varchar(20) NOT NULL UNIQUE,
	nome varchar(50) NOT NULL,
	telefone varchar(20) NOT NULL,
    email varchar(50) NOT NULL,
	endereco varchar(100) NOT NULL,
	PRIMARY KEY (idCliente)
);

CREATE TABLE IF NOT EXISTS Locacao (
	idLocacao int AUTO_INCREMENT NOT NULL UNIQUE,
	idCliente int NOT NULL,
	idPagamento int NOT NULL,
	dataInicio date NOT NULL,
	dataFim date NOT NULL,
	PRIMARY KEY (idLocacao),
    CONSTRAINT fkPagamento FOREIGN KEY (idPagamento) REFERENCES Pagamento(idPagamento),
	CONSTRAINT fkCliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE IF NOT EXISTS LocacaoVeiculo (
	idLocacao int NOT NULL,
	idVeiculo int NOT NULL,
	PRIMARY KEY (idLocacao, idVeiculo),
	CONSTRAINT fkLocacao FOREIGN KEY (idLocacao) REFERENCES Locacao(idLocacao),
	CONSTRAINT fkVeiculo FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo)
);


CREATE TABLE IF NOT EXISTS Veiculo (
	idVeiculo int AUTO_INCREMENT NOT NULL UNIQUE,
	modelo varchar(50) NOT NULL,
	marca varchar(50) NOT NULL,
	ano int NOT NULL,
	placa varchar(10) NOT NULL,
	valorDiaria decimal(7,2) NOT NULL,
	estado enum ('Alugado', 'Disponível', 'Manutenção') NOT NULL,
	PRIMARY KEY (idVeiculo)
);

CREATE TABLE IF NOT EXISTS Manutencao (
	idManutencao int AUTO_INCREMENT NOT NULL UNIQUE,
	idVeiculo int NOT NULL,
	descricao varchar(100) NOT NULL,
	dataManutencao date NOT NULL,
	custo decimal(7,2) NOT NULL,
	PRIMARY KEY (idManutencao),
	CONSTRAINT fkVeiculoManutencao FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo)
);
