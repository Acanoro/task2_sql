-- Создание таблицы Исполнители
CREATE TABLE Artists (
    id_artist SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE
);

-- Создание таблицы Жанры
CREATE TABLE Genres (
    id_genre SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE
);

-- Создание таблицы Альбомы
CREATE TABLE Albums (
    id_album SERIAL PRIMARY KEY,
    name VARCHAR(255),
    release_year INT CHECK (release_year >= 1900)
);

-- Создание таблицы Треки
CREATE TABLE Tracks (
    id_track SERIAL PRIMARY KEY,
    name VARCHAR(255),
    duration INT CHECK (duration > 0),
    id_album INT,
    FOREIGN KEY (id_album) REFERENCES Albums(id_album)
);

-- Создание таблицы Сборники
CREATE TABLE Compilations (
    id_compilation SERIAL PRIMARY KEY,
    name VARCHAR(255),
    release_year INT CHECK (release_year >= 1900)
);

-- Создание таблицы Связь Исполнителей и Жанров
CREATE TABLE ArtistGenres (
    id_artist_genre SERIAL PRIMARY KEY,
    id_artist INT,
    id_genre INT,
    FOREIGN KEY (id_artist) REFERENCES Artists(id_artist),
    FOREIGN KEY (id_genre) REFERENCES Genres(id_genre),
    UNIQUE (id_artist, id_genre)
);

-- Создание таблицы Связь Исполнителей и Альбомов
CREATE TABLE ArtistAlbums (
    id_artist_album SERIAL PRIMARY KEY,
    id_artist INT,
    id_album INT,
    FOREIGN KEY (id_artist) REFERENCES Artists(id_artist),
    FOREIGN KEY (id_album) REFERENCES Albums(id_album),
    UNIQUE (id_artist, id_album)
);

-- Создание таблицы Связь Сборников и Треков
CREATE TABLE CompilationTracks (
    id_compilation_track SERIAL PRIMARY KEY,
    id_compilation INT,
    id_track INT,
    FOREIGN KEY (id_compilation) REFERENCES Compilations(id_compilation),
    FOREIGN KEY (id_track) REFERENCES Tracks(id_track),
    UNIQUE (id_compilation, id_track)
);
