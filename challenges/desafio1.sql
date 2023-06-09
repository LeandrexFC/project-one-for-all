DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE SpotifyClone.planos (
	plano_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	plano VARCHAR(45) NOT NULL,
    valor_plano DECIMAL(10,2) NOT NULL
);

INSERT INTO planos (plano, valor_plano) VALUES
    ('gratuito', 0),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

CREATE TABLE SpotifyClone.user (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(55) NOT NULL,
    idade INT NOT NULL,
    data_assinatura DATE NOT NULL,
    plano_assinado INT NOT NULL,
	FOREIGN KEY (plano_assinado) REFERENCES SpotifyClone.planos(plano_id)
);

INSERT INTO user (nome, idade, data_assinatura, plano_assinado) VALUES
	( 'Barbara Liskov', '82','2019-10-20', '1'),
	( 'Robert Cecil Martin', '58', '2017-01-06', '1'),
	('Ada Lovelace', '37', '2017-12-30', '2'),
	( 'Martin Fowler', '46', '2017-01-17', '2'),
	( 'Sandi Metz', '58', '2018-04-29', '2'),
	( 'Paulo Freire', '19', '2018-02-14', '3'),
	('Bell Hooks', '26', '2018-01-05', '3'),
	( 'Christopher Alexander', '85', '2019-06-05', '4'),
	('Judith Butler', '45', '2020-05-13', '4'),
	('Jorge Amado', '58', '2017-02-17', '4');

CREATE TABLE SpotifyClone.artista (
	artista_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45) NOT NULL
);

INSERT INTO artista (nome) VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');

CREATE TABLE SpotifyClone.seguindo_artistas (
    pessoas_usuarias_id INT NOT NULL,
    artista_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(pessoas_usuarias_id, artista_id ),
    FOREIGN KEY (pessoas_usuarias_id) REFERENCES SpotifyClone.user (id),
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista (artista_id)
);

INSERT INTO seguindo_artistas (pessoas_usuarias_id, artista_id) VALUES
	( 1, 1),
    ( 1, 2),
    ( 1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5,  6),
	(6, 6),
    (6, 1),
	(7, 6),
    (9, 3),
    (10, 2);

CREATE TABLE SpotifyClone.albuns (
	album_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    album VARCHAR(255) NOT NULL,
    ano_lancamento INT NOT NULL,
    artist_id INT NOT NULL,
	FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artista (artista_id)
);

INSERT INTO albuns (artist_id, album, ano_lancamento) VALUES
	(1, 'Renaissance', 2022),
	(2, 'Jazz', 1978),
	(2, 'Hot Space', 1982),
	(3, 'Falso Brilhante', 1998),
	(3, 'Vento de Maio', 2001),
	(4, 'QVVJFA?', 2003),
	(5, 'Somewhere Far Beyond', 2007),
	(6, 'I Put A Spell On You', 2012);

CREATE TABLE SpotifyClone.cancoes (
	id_cancao INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cancao VARCHAR(255) NOT NULL,
    duracao_cancao INT NOT NULL,
    id_album INT NOT NULL,
    FOREIGN KEY (id_album) REFERENCES SpotifyClone.albuns(album_id)
);

INSERT INTO cancoes (id_album, cancao, duracao_cancao) VALUES
  (1, "BREAK MY SOUL", 279),
  (1, "VIRGO'S GROOVE", 369),
  (1, "ALIEN SUPERSTAR", 116),
  (2, "Don't Stop Me Now", 203),
  (3, "Under Pressure", 152),
  (4, "Como Nossos Pais", 105),
  (5, "O Medo de Amar é o Medo de Ser Livre", 207),
  (6, "Samba em Paris", 267),
  (7, "The Bard's Song", 244),
  (8, "Feeling Good", 100);

CREATE TABLE SpotifyClone.historico (
	pessoas_usuarias_id INT NOT NULL,
	cancao_id INT NOT NULL,
    data_reproducao DATETIME NOT NULL,
    CONSTRAINT PRIMARY KEY(pessoas_usuarias_id, cancao_id ),
    FOREIGN KEY (pessoas_usuarias_id) REFERENCES SpotifyClone.user (id),
    FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancoes(id_cancao)
);

INSERT INTO historico (pessoas_usuarias_id, cancao_id, data_reproducao) VALUES
  (1, 8, '2022-02-28 10:45:55'),
  (1, 2, '2020-05-02 05:30:35'),
  (1, 10, '2020-03-06 11:22:33'),
  (2, 10, '2022-08-05 08:05:17'),
  (2, 7, '2020-01-02 07:40:33'),
  (3, 10, '2020-11-13 16:55:13'),
  (3, 2, '2020-12-05 18:38:30'),
  (4, 8, '2021-08-15 17:10:10'),
  (5, 8, '2022-01-09 01:44:33'),
  (5, 5, '2020-08-06 15:23:43'),
  (6, 7, '2017-01-24 00:31:17'),
  (6, 1, '2017-10-12 12:35:20'),
  (7, 4, '2011-12-15 22:30:49'),
  (8, 4, '2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22'),
  (10, 3, '2015-12-13 08:30:22');


