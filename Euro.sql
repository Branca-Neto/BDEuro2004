-- Database: Euro2004

-- DROP DATABASE IF EXISTS "Euro2004";

CREATE DATABASE "Euro2004"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Portugal.1252'
    LC_CTYPE = 'Portuguese_Portugal.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE TABLE GRUPOS (
    idGrupo SERIAL PRIMARY KEY,
    nomeGrupo VARCHAR(200)
);

CREATE TABLE PAISES (
    idPais SERIAL PRIMARY KEY,
    nomePais VARCHAR(200)
);


CREATE TABLE SELECAO (
    idSelecao SERIAL PRIMARY KEY,
    nomeSelecao VARCHAR(200),
    idPais INT,
    FOREIGN KEY (idPais) REFERENCES PAISES (idPais)
);


CREATE TABLE JOGADORES (
    idJogador SERIAL PRIMARY KEY,
    nomeJogador VARCHAR(100),
    posicao VARCHAR(100),
    idSelecao INT,
    FOREIGN KEY (idSelecao) REFERENCES SELECAO (idSelecao)
);

CREATE TABLE PARTIDAS (
    idPartida SERIAL PRIMARY KEY,
    data DATE,
    hora TIME,
    local VARCHAR(100),
    idGrupo INT,
    FOREIGN KEY (idGrupo) REFERENCES GRUPOS (idGrupo)
);
CREATE TABLE CARTOES (
    idCartao SERIAL PRIMARY KEY,
    tipoCartao VARCHAR(100),
    minutoCartao INT,
    idJogador INT,
    idPartida INT,
    FOREIGN KEY (idJogador) REFERENCES JOGADORES (idJogador),
    FOREIGN KEY (idPartida) REFERENCES PARTIDAS (idPartida)
);

CREATE TABLE CIDADES (
    idCidade SERIAL PRIMARY KEY,
    nomeCidade VARCHAR(100),
    idPais INT,
    FOREIGN KEY (idPais) REFERENCES PAISES (idPais)
);

CREATE TABLE ESTADIOS (
    idEstadio SERIAL PRIMARY KEY,
    nomeEstadio VARCHAR(100),
    capacidade INT,
    idCidade INT,
    FOREIGN KEY (idCidade) REFERENCES CIDADES (idCidade)
);


CREATE TABLE GOLOS (
    idGolo SERIAL PRIMARY KEY,
    minutoGolo INT,
    idJogador INT,
    idPartida INT,
    FOREIGN KEY (idJogador) REFERENCES JOGADORES (idJogador),
    FOREIGN KEY (idPartida) REFERENCES PARTIDAS (idPartida)
);

CREATE TABLE SUBSTITUICAO (
    idSubstituicao SERIAL PRIMARY KEY,
    minutoSubstituicao INT,
    jogador_Saida INT,
    jogador_Entrada INT,
    idPartida INT,
    FOREIGN KEY (jogador_Saida) REFERENCES JOGADORES (idJogador),
    FOREIGN KEY (jogador_Entrada) REFERENCES JOGADORES (idJogador),
    FOREIGN KEY (idPartida) REFERENCES PARTIDAS (idPartida)
);

CREATE TABLE ESTATISTICAS_JOGADORES (
    idEstatistica_Jogador SERIAL PRIMARY KEY,
    passes INT,
    assistencias INT,
    remates INT,
    minutosJogados INT,
    idJogador INT,
    idPartida INT,
    FOREIGN KEY (idJogador) REFERENCES JOGADORES (idJogador),
    FOREIGN KEY (idPartida) REFERENCES PARTIDAS (idPartida)
);

CREATE TABLE ESTATISTICAS_EQUIPAS (
    idEstatistica_Equipas SERIAL PRIMARY KEY,
    passes INT,
    assistencias INT,
    remates INT,
    minutosJogados INT,
    idSelecao INT,
    idPartida INT,
    FOREIGN KEY (idSelecao) REFERENCES SELECAO (idSelecao),
    FOREIGN KEY (idPartida) REFERENCES PARTIDAS (idPartida)
);

CREATE TABLE SELECAO_GRUPO (
    idSelecaoGrupo SERIAL PRIMARY KEY,
    idSelecao INT,
    idGrupo INT,
    FOREIGN KEY (idSelecao) REFERENCES SELECAO (idSelecao),
    FOREIGN KEY (idGrupo) REFERENCES GRUPOS (idGrupo)
);




