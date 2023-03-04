DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE user (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(55) NOT NULL,
    idade INT NOT NULL
);

INSERT INTO user (id, nome, idade) VALUES
	('1', 'Barbara Liskov', '82'),
	('2', 'Robert Cecil Martin', '58'),
	('3', 'Ada Lovelace', '37'),
	('4', 'Martin Fowler', '46'),
	('5', 'Sandi Metz', '58'),
	('6', 'Paulo Freire', '19'),
	('7', 'Bell Hooks', '26'),
	('8', 'Christopher Alexander', '85'),
	('9', 'Judith Butler', '45'),
	('10', 'Jorge Amado', '58');

CREATE TABLE planos (
	plano VARCHAR(45) NOT NULL,
    data_assinatura DATE NOT NULL,
    valor_plano INT NOT NULL,
    pessoa_usuaria_id INT NOT NULL,
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES user(id)
);

INSERT INTO planos (plano, data_assinatura, valor_plano, pessoa_usuaria_id) VALUES
	('gratuito', '2019-10-20', '0', '1'),
	('gratuito', '2017-01-06', '0', '2'),
	('familiar', '2017-12-30', '7,99', '3'),
	('familiar', '2017-01-17', '7,99', '4'),
	('familiar', '2018-04-29', '7,99', '5'),
	('universitário', '2018-02-14', '5,99', '6'),
	('universitário', '2018-01-05', '5,99', '7'),
	('pessoal', '2019-06-05', '6,99', '8'),
	('pessoal', '2020-05-13', '6,99', '9'),
	('pessoal', '2017-02-17', '6,99', '10');

CREATE TABLE artista (
	nome VARCHAR(45) NOT NULL,
    artista_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
);

INSERT INTO artista (nome) VALUES
	('Beyoncé'),
	('Queen'),
	('Queen'),
	('Elis Regina'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');

CREATE TABLE seguindo_artistas (
	seguindo_artista VARCHAR(45) NOT NULL,
    artista_id INT NOT NULL,
    pessoa_usuaria_id INT NOT NULL,
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES user(id),
    FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
);

INSERT INTO seguindo_artistas (seguindo_artista) VALUES
	('Beyoncé; Queen; Elis Regina'),
	('Beyoncé; Elis Regina'),
	('Queen'),
	('Baco Exu do Blues'),
	('Blind Guardian; Nina Simone'),
	('Nina Simone; Beyoncé&#10;'),
	('Nina Simone'),
	(''),
	('Elis Regina'),
	('Queen&#10;');


CREATE TABLE albuns (
	album_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    album VARCHAR(255) NOT NULL,
    ano_lancamento INT NOT NULL
);

INSERT INTO albuns (album_id, album, ano_lancamento) VALUES
	('1', 'Renaissance', '2022'),
	('2', 'Jazz', '1978'),
	('3', 'Hot Space', '1982'),
	('4', 'Falso Brilhante', '1998'),
	('5', 'Vento de Maio', '2001'),
	('6', 'QVVJFA?', '2003'),
	('7', 'Somewhere Far Beyond', '2007'),
	('8', 'I Put A Spell On You', '2012');

CREATE TABLE cancoes (
	id_cancao INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cancao VARCHAR(255) NOT NULL,
    duracao_cancao INT NOT NULL,
    id_album INT NOT NULL,
    id_artista INT NOT NULL,
    FOREIGN KEY (id_album) REFERENCES albuns(album_id),
    FOREIGN KEY (id_artista) REFERENCES artista(artista_id)
);

INSERT INTO cancoes (cancao, duracao_cancao) VALUES
	('"BREAK MY SOUL"; "VIRGO\S GROOVE"; "ALIEN SUPERSTAR"', '279; 369; 116'),
	('"Don\t Stop Me Now"', '203'),
	('"Under Pressure"', '152'),
	('"Como Nossos Pais"', '105'),
	('"O Medo de Amar é o Medo de Ser Livre"', '207'),
	('"Samba em Paris"', '267'),
	('"The Bard\s Song"', '244'),
	('"Feeling Good"', '100');


CREATE TABLE historico (
	cancao_id INT NOT NULL,
	historico_reproducao VARCHAR(255) NOT NULL,
    data_reproducao DATE NOT NULL,
    FOREIGN KEY (cancao_id) REFERENCES cancoes(id_cancao)
);

INSERT INTO historico (historico_reproducao, data_reproducao) VALUES
	('"Samba em Paris"; "VIRGO&apos;S GROOVE"; "Feeling Good"', '"2022-02-28 10:45:55"; "2020-05-02 05:30:35"; "2020-03-06 11:22:33"'),
	('"Feeling Good"; "O Medo de Amar é o Medo de Ser Livre"', '"2022-08-05 08:05:17"; "2020-01-02 07:40:33"'),
	('"Feeling Good"; "VIRGO\S GROOVE"', '"2020-11-13 16:55:13"; "2020-12-05 18:38:30"'),
	('"Samba em Paris"', '"2021-08-15 17:10:10"; '),
	('"Samba em Paris"; "Under Pressure"', '"2022-01-09 01:44:33"; "2020-08-06 15:23:43"'),
	('"O Medo de Amar é o Medo de Ser Livre"; "BREAK MY SOUL"', '"2017-01-24 00:31:17"; "2017-10-12 12:35:20"'),
	('"Don\t Stop Me Now"', '"2011-12-15 22:30:49"'),
	('"Don\t Stop Me Now"', '"2012-03-17 14:56:41"'),
	('"The Bard\s Song"', '"2022-02-24 21:14:22"'),
	('"ALIEN SUPERSTAR"', '"2015-12-13 08:30:22"');