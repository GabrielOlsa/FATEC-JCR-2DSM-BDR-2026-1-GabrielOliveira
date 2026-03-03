CREATE DATABASE clima_alerta


CREATE TABLE evento (
idEvento SERIAL PRIMARY KEY,
titulo TEXT NOT NULL,
descricao TEXT NOT NULL,
dataHora TIMESTAMP,
status VARCHAR(20) CHECK (status IN ('Ativo', 'Em Monitoramento', 'Resolvido'))
);

CREATE TABLE tipo_evento ( 
idTipoEvento SERIAL PRIMARY KEY,
nome TEXT NOT NULL,
descricao TEXT NOT NULL
);


CREATE TABLE localizacao ( 
idLocalizacao SERIAL PRIMARY KEY,
latitude DECIMAL (9,6),
longitude DECIMAL (9,6),
cidade VARCHAR (100),
estado VARCHAR (2)
);


CREATE TABLE usuario (
idUsuario SERIAL PRIMARY KEY,
nome VARCHAR (100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
senhaHash VARCHAR (255) NOT NULL
);

CREATE TABLE relato (
idRelato SERIAL PRIMARY KEY,
texto TEXT,
dataHora TIMESTAMP,

idEvento INT NOT NULL,
 idUsuario INT NOT NULL,

CONSTRAINT fk_evento
	FOREIGN KEY (idEvento)
	REFERENCES evento(idEvento),
	
CONSTRAINT fk_usuario
	FOREIGN KEY (idUsuario)
	REFERENCES usuario(idUsuario)
);

CREATE TABLE ALERTA ( 
idalerta SERIAL PRIMARY KEY,
mensagem TEXT,
dataHora TIMESTAMP,
nivel VARCHAR(10) CHECK (nivel IN ('Baixo', 'Médio', 'Alto', 'Crítico')),
idEvento INTEGER,
    CONSTRAINT fk_evento
        FOREIGN KEY (idEvento)
        REFERENCES evento(idEvento)
);