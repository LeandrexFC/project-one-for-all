DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE SpotifyClone.user (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(55) NOT NULL,
    idade INT NOT NULL
);

CREATE TABLE SpotifyClone.planos (
	plano VARCHAR(45) NOT NULL,
    data_assinatura DATE NOT NULL,
    valor_plano INT NOT NULL,
    pessoa_usuaria_id INT NOT NULL,
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES SpotifyClone.user(id)
);

CREATE TABLE SpotifyClone.artista (
	nome VARCHAR(45) NOT NULL,
    artista_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE SpotifyClone.seguindo_artistas (
	seguindo_artista VARCHAR(45) NOT NULL,
    artista_id INT NOT NULL,
    pessoa_usuaria_id INT NOT NULL,
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES SpotifyClone.user(id),
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista(artista_id)
);


CREATE TABLE SpotifyClone.albuns (
	album_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    album VARCHAR(255) NOT NULL,
    ano_lancamento INT NOT NULL
);

CREATE TABLE SpotifyClone.cancoes (
	id_cancao INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cancao VARCHAR(255) NOT NULL,
    duracao_cancao INT NOT NULL,
    id_album INT NOT NULL,
    id_artista INT NOT NULL,
    FOREIGN KEY (id_album) REFERENCES SpotifyClone.albuns(album_id),
    FOREIGN KEY (id_artista) REFERENCES SpotifyClone.artista(artista_id)
);


CREATE TABLE SpotifyClone.historico (
	cancao_id INT NOT NULL,
	historico_reproducao VARCHAR(255) NOT NULL,
    data_reproducao DATE NOT NULL,
    FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancoes(id_cancao)
);
