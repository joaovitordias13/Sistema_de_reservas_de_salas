
-- Tabela departamento
CREATE TABLE departamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);


-- Tabela sala
CREATE TABLE sala (
    id INT AUTO_INCREMENT PRIMARY KEY,
    capacidade INT NOT NULL,
    localizacao VARCHAR(100) NOT NULL UNIQUE
);


-- Tabela usuario
CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    departamento_id INT NOT NULL,
    FOREIGN KEY (departamento_id) REFERENCES Departamentos(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- Tabela reserva
CREATE TABLE reserva (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sala_id INT NOT NULL,
    usuario_id INT NOT NULL,
    data_reserva DATE NOT NULL,
    UNIQUE (sala_id, data_reserva),
    FOREIGN KEY (sala_id) REFERENCES Salas(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);



-- Tabela booking
CREATE TABLE booking (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reserva_id INT NOT NULL,
    usuario_id INT NOT NULL,
    UNIQUE (reserva_id, usuario_id),
    FOREIGN KEY (reserva_id) REFERENCES Reservas(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);


CREATE TABLE historico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reserva_id INT NOT NULL,
    usuario_id_alteracao INT NOT NULL,
    tipo_alteracao VARCHAR(50) NOT NULL,
    data_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (reserva_id) REFERENCES Reservas(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (usuario_id_alteracao) REFERENCES Usuarios(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);