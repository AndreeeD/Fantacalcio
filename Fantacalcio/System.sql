

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS File;
DROP TABLE IF EXISTS Giocatore;
DROP TABLE IF EXISTS Giornata;
DROP TABLE IF EXISTS Classifica;
DROP TABLE IF EXISTS Fantallenatore;
DROP TABLE IF EXISTS Partita;
DROP TABLE IF EXISTS VotiGiornata;
DROP TABLE IF EXISTS Squadra;




CREATE TABLE IF NOT EXISTS Giocatore (
        ID varchar(10) NOT NULL PRIMARY KEY,
        Nome_Squadra varchar(20) NOT NULL REFERENCES Squadra (Nome)
                    ON DELETE CASCADE,
        Foto blob NOT NULL,
        Nome varchar(20) NOT NULL,
        Cognome varchar(20) NOT NULL,
        Eta int(4) NOT NULL,
        Ruolo varchar(20) NOT NULL,
        Npartite_Giocate int,
        Assist int,
        Ammonizioni int,
        Espulsioni int,
        Rigori_Parati int,
        Rigori_Sbagliati int,
        Gol_Subiti int,
        Gol int,
        Media_Voto double,
        Fantamedia double
) ENGINE=InnoDB;





CREATE TABLE IF NOT EXISTS Giornata (
Data date NOT NULL,
Numero_Giornata int NOT NULL,
PRIMARY KEY(Data,Numero_Giornata)
)ENGINE=InnoDB;



CREATE TABLE IF NOT EXISTS Classifica (
        NGiornata int NOT NULL REFERENCES Giornata (Numero_Giornata)
                       ON DELETE CASCADE,
        Nome_Squadra varchar(20) NOT NULL REFERENCES Squadra (Nome)
 	ON DELETE CASCADE,
        Punteggio_Totale double,
        Punti int,
        PRIMARY KEY(NGiornata, Nome_Squadra)
)ENGINE=InnoDB;





CREATE TABLE IF NOT EXISTS Fantallenatore(
        Nome_Utente varchar(20) NOT NULL PRIMARY KEY,
        Password varchar(10) NOT NULL,
        Budget_Rimanente int NOT NULL
)ENGINE=InnoDB;





CREATE TABLE IF NOT EXISTS Partita(
NGiornata int REFERENCES Giornata (Numero_Giornata) ON DELETE CASCADE,
NPartita int,
Squadra_Casa varchar(20) REFERENCES Squadra (Nome) ON DELETE CASCADE,
Squadra_Ospite varchar(20)REFERENCES Squadra (Nome) ON DELETE CASCADE,
Gol_Casa int,
Punteggio_Casa double,
Gol_Ospite int,
Punteggio_Ospite double,
Punti_ClassificaC int,
Punti_ClassificaO int,
PRIMARY KEY(Squadra_Casa,Squadra_Ospite,NGiornata)
)ENGINE=InnoDB;




CREATE TABLE IF NOT EXISTS Voti_Giornata(
ID_Giocatore varchar(10) REFERENCES Giocatore (ID) ON DELETE CASCADE,
Presenza varchar(20) NOT NULL,
Gol int,
Gol_Subiti int,
Rigori_Parati int,
Rigori_Sbagliati int,
Ammonizioni int,
Espulsioni int,
Assist int,
Fantavoto double,
Voto double,
PRIMARY KEY(ID_Giocatore)
)ENGINE=InnoDB;




CREATE TABLE IF NOT EXISTS Squadra(
Nome varchar(20) NOT NULL,
Fantallenatore varchar(20) NOT NULL,
Descrizione varchar(60),
Valore_Squadra int NOT NULL,
Colore varchar(10) NOT NULL,
PRIMARY KEY(Nome,Fantallenatore),
FOREIGN KEY (Fantallenatore) REFERENCES Fantallenatore (Nome_Utente)
)ENGINE=InnoDB;

LOAD DATA LOCAL INFILE 'Giornata.txt' INTO TABLE Giornata;
LOAD DATA LOCAL INFILE 'VotiGiornata.txt' INTO TABLE Voti_Giornata;
LOAD DATA LOCAL INFILE 'Squadra.txt' INTO TABLE Squadra;
LOAD DATA LOCAL INFILE 'Fantallenatori.txt' INTO TABLE Fantallenatore;
LOAD DATA LOCAL INFILE 'Classifica.txt' INTO TABLE Classifica;
LOAD DATA LOCAL INFILE 'Giocatori.txt' INTO TABLE Giocatore;

SET FOREIGN_KEY_CHECKS=1;





CREATE TABLE IF NOT EXISTS Fantallenatore(
        Nome_Utente varchar(20) NOT NULL PRIMARY KEY,
        Password varchar(10) NOT NULL,
        Budget_Rimanente int NOT NULL
)ENGINE=InnoDB;





CREATE TABLE IF NOT EXISTS Partita(
NGiornata int REFERENCES Giornata (Numero_Giornata) ON DELETE CASCADE,
NPartita int,
Squadra_Casa varchar(20) REFERENCES Squadra (Nome) ON DELETE CASCADE,
Squadra_Ospite varchar(20)REFERENCES Squadra (Nome) ON DELETE CASCADE,
Gol_Casa int,
Punteggio_Casa double,
Gol_Ospite int,
Punteggio_Ospite double,
Punti_ClassificaC int,
Punti_ClassificaO int,
PRIMARY KEY(Squadra_Casa,Squadra_Ospite,NGiornata)
)ENGINE=InnoDB;




CREATE TABLE IF NOT EXISTS Voti_Giornata(
ID_Giocatore varchar(10) REFERENCES Giocatore (ID) ON DELETE CASCADE,
Voto double,
Gol int,
Gol_Subiti int,
Rigori_Parati int,
Rigori_Sbagliati int,
Ammonizioni int,
Espulsioni int,
Assist int,
Fantavoto double,
Presenza varchar(20) NOT NULL,
PRIMARY KEY(ID_Giocatore)
)ENGINE=InnoDB;




CREATE TABLE IF NOT EXISTS Squadra(
Nome varchar(20) NOT NULL,
Fantallenatore varchar(20) NOT NULL,
Descrizione varchar(60),
Valore_Squadra int NOT NULL,
Colore varchar(10) NOT NULL,
PRIMARY KEY(Nome,Fantallenatore),
FOREIGN KEY (Fantallenatore) REFERENCES Fantallenatore (Nome_Utente)
)ENGINE=InnoDB;

LOAD DATA LOCAL INFILE 'Giornata.txt' INTO TABLE Giornata;
LOAD DATA LOCAL INFILE 'VotiGiornata.txt' INTO TABLE Voti_Giornata;
LOAD DATA LOCAL INFILE 'Squadra.txt' INTO TABLE Squadra;
LOAD DATA LOCAL INFILE 'Fantallenatori.txt' INTO TABLE Fantallenatore;
LOAD DATA LOCAL INFILE 'Classifica.txt' INTO TABLE Classifica;
LOAD DATA LOCAL INFILE 'Giocatori.txt' INTO TABLE Giocatore;



SET FOREIGN_KEY_CHECKS=1;

