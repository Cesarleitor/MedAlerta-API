USE medalerta;

CREATE TABLE IF NOT EXISTS `Usuario` (
    `idUsuario` INT PRIMARY KEY AUTO_INCREMENT,
    `nome` VARCHAR(100) NOT NULL,
    `telefone` VARCHAR(20) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `enderecoRua` VARCHAR(100),
    `enderecoNumero` INT,
    `enderecoComplemento` VARCHAR(50),
    `enderecoBairro` VARCHAR(50),
    `enderecoCEP` VARCHAR(10),
    `enderecoCidade` VARCHAR(50),
    `enderecoEstado` VARCHAR(2)
);

CREATE TABLE IF NOT EXISTS `Medicamento` (
    `idMedicamento` INT PRIMARY KEY AUTO_INCREMENT,
    `nomeComercial` VARCHAR(100) NOT NULL,
    `nomeGenerico` VARCHAR(100),
    `quantidade` VARCHAR(20),
    `formaUso` VARCHAR(100),
    `observacao` VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS `UsuarioMedicamento` (
    `idUsuario` INT NOT NULL,
    `idMedicamento` INT NOT NULL,
    `horarioUso` TIME NOT NULL,
    `frequenciaUso` VARCHAR(50),
    `dosagem` VARCHAR(50) NOT NULL,
    `dataHorarioAlerta` DATETIME NOT NULL,
    `statusAlerta` VARCHAR(20) NOT NULL,
    `dataHorarioConsumo` DATETIME,
    `confirmacaoConsumo` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`idUsuario`, `idMedicamento`),
    CONSTRAINT `fk_usuario_medicamento_usuario`
        FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`idUsuario`),
    CONSTRAINT `fk_usuario_medicamento_medicamento`
        FOREIGN KEY (`idMedicamento`) REFERENCES `Medicamento` (`idMedicamento`)
);
