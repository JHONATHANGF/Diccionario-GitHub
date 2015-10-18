create database DCCNR

use DCCNR

CREATE TABLE Usuario
(
	Id			int  PRIMARY KEY NOT NULL IDENTITY(1,1), 
	Nombre	 nvarchar (50)	 NOT NULL, 
	Contraseña nvarchar (50) NOT NULL,
);

CREATE TABLE Palabra
(
IdUsuario int NOT NULL,
IdPalabra int PRIMARY KEY NOT NULL IDENTITY (1,1),
Palabra nvarchar (50) NOT NULL,
PrimeraLetra nvarchar(1) ,
UltimaLetra nvarchar (1) ,
Tamaño  int NULL,
Cant_Vocales int NULL,
Cant_Consonates int NULL,
Significado nvarchar (150) NULL,

CONSTRAINT FK_Usuario FOREIGN KEY (IdUsuario) REFERENCES Usuario (Id) on update cascade

);
CREATE TABLE Sinonimo(

IdPalabra int NOT NULL,
IdSinonimo int Primary Key NOT NULL,
Sinonimo nvarchar(50) NOT NULL

CONSTRAINT FK_Sinonimo FOREIGN KEY (IdPalabra) REFERENCES Palabra (IdPalabra) on update cascade


);
CREATE TABLE Antonimo(

IdPalabra int NOT NULL,
IdAntonimo int Primary Key NOT NULL,
Antonimo nvarchar(50) NOT NULL


CONSTRAINT FK_Antonimo FOREIGN KEY (IdPalabra) REFERENCES Palabra (IdPalabra) on update cascade

);


