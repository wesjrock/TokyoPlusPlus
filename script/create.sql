CREATE TABLE ParticipanteTipo(
  codigo  NUMBER(10)     NOT NULL,
  tipo    VARCHAR2(10)   NOT NULL,
  CONSTRAINT pk_ParticipanteTipo PRIMARY KEY (codigo),
  constraint ck_participanteTipo check(upper(tipo) in ('ATLETA','ARBITRO'))

);

Create TABLE Pais(
  
  nomePais VARCHAR2(25) not null,
  hino  VARCHAR(2000) not null,
  continente VARCHAR(50) not null,
  bandeira BLOB,   
  CONSTRAINT pk_Pais PRIMARY KEY (nomePais)

);
CREATE TABLE Passaporte(

  passaporte  VARCHAR(12)   NOT NULL,
  nomePais    VARCHAR2(25)    NOT NULL,

   CONSTRAINT pk_Passaporte PRIMARY KEY (Passaporte),
   CONSTRAINT fk_Passaporte FOREIGN KEY (nomePais) REFERENCES Pais (nomePais) ON DELETE CASCADE
);

CREATE TABLE Arbitro(
  codigo             NUMBER(10) NOT NULL,
  nomeParticipante   VARCHAR2(60)   NOT NULL,
  passaporte         VARCHAR2(12)   NOT NULL,
  sexo               VARCHAR2(10)   NOT NULL,
  dataNascimento     TIMESTAMP      NOT NULL,

  CONSTRAINT pk_Arbitro PRIMARY KEY (codigo),
  CONSTRAINT fk_Arbitro FOREIGN KEY  (codigo) REFERENCES ParticipanteTipo (codigo),
  CONSTRAINT fk_Arbitro2 FOREIGN KEY  (passaporte) REFERENCES Passaporte (passaporte) ON DELETE CASCADE,
  constraint ck_arbitro check (upper(sexo) in ('MASCULINO', 'FEMININO'))

);

CREATE TABLE Atleta(
  codigo             NUMBER(10) NOT NULL,
  nomeParticipante   VARCHAR2(60)    NOT NULL,
  passaporte         VARCHAR2(12)    NOT NULL,
  sexo               VARCHAR2(10)    NOT NULL,
  dataNascimento     TIMESTAMP       NOT NULL,
  altura             NUMBER(3)       NOT NULL,
  peso               NUMBER(3)       NOT NULL,

  CONSTRAINT pk_Atleta PRIMARY KEY (codigo),
  CONSTRAINT fk_Atleta FOREIGN KEY  (codigo) REFERENCES ParticipanteTipo (codigo),
  CONSTRAINT fk_Atleta2 FOREIGN KEY  (passaporte) REFERENCES Passaporte (passaporte)  ON DELETE CASCADE,
  constraint ck_atleta check (upper(sexo) in ('MASCULINO', 'FEMININO')),
  constraint ck_atletaaltura check (altura between 0.5 and 3),
  constraint ck_atletapeso check (peso between 30 and 200)

);

CREATE TABLE Nacionalidade (
  
    codigo NUMBER(10) not null,
    nomePais  VARCHAR2(25) not null,
    
      CONSTRAINT pk_Nacionalidade PRIMARY KEY (codigo,nomePais),
      CONSTRAINT fk_nacParticipante FOREIGN KEY (codigo) references ParticipanteTipo (codigo),
      CONSTRAINT fk_nacPais FOREIGN KEY (nomePais) REFERENCES  Pais (nomePais)

);



create table esporte(
  nomeEsporte varchar2(50) not null,
  unidade varchar2(10) not null,
  
  constraint esporte_pk primary key (nomeEsporte)
);

/* -----------------------------------------------
	modalidade
----------------------------------------------- */

create table Modalidade(

  nomeModalidade varchar2(50) not null,
  numeroMaximoAtletas number(3) not null,  /* 1 to 100 */
  categoria varchar2(10) ,
  nomeEsporte varchar2(50) not null,
  
  constraint modalidade_pk
    primary key (nomeModalidade,nomeEsporte),
  
  constraint categoria_check
    check(upper(categoria) in ('MASCULINO','FEMININO' ,'MISTO')),
    
  constraint nomeEsporte_fk
    foreign key (nomeEsporte)
    references esporte (nomeEsporte)
);

CREATE TABLE Joga (

  nomePais varchar2(25) not null,
  nomeEsporte varchar2(50) not null,
  nomeModalidade varchar2(50) not null,

  constraint pk_joga primary key (nomePais,nomeEsporte,nomeModalidade),
  constraint fk_joga foreign key (nomePais) references Pais (nomePais) on delete cascade,
  constraint fk_jogaMod foreign key (nomeModalidade, nomeEsporte) references Modalidade (nomeModalidade, nomeEsporte) on delete cascade

);

CREATE TABLE Equipe(

  numero number(2) not null,
  nomePais varchar2(25) not null,
  nomeEsporte varchar2(50) not null,
  nomeModalidade varchar2(50) not null,
  constraint ck_equipe check (numero between 1 and 10),
  constraint pk_equipe primary key (numero,nomePais,nomeEsporte,nomeModalidade),
  constraint fk_equipe foreign key (nomePais,nomeEsporte,nomeModalidade) references Joga (nomePais, nomeEsporte,nomeModalidade) on delete cascade

  
  
);

CREATE TABLE Participa(

  numero number(2) not null,
  nomePais varchar2(25) not null,
  nomeEsporte varchar2(50) not null,
  nomeModalidade varchar2(50) not null,
  codigo number(10) not null,

  constraint pk_participa primary key (numero,nomePais,nomeEsporte, nomeModalidade, codigo),
  constraint fk_participa foreign key (numero,nomePais, nomeEsporte, nomeModalidade) references
  Equipe (numero, nomePais, nomeEsporte, nomeModalidade) on delete cascade,
  constraint fk_participaAtlet foreign key (codigo) references Atleta (codigo) on delete cascade

);


CREATE TABLE ArbitraEsporte(

  codigo number(10) not null,
  nomeEsporte varchar2(50) not null,


  constraint pk_ArbitraEsporte primary key (codigo, nomeEsporte),
  constraint fk_ArbitraEsporteArbi foreign key (codigo) references Arbitro (codigo) on delete cascade,
  constraint fk_ArbitraEsporteEspor foreign key (nomeEsporte) references esporte (nomeEsporte) on delete cascade

);

Create Table ComplexosDesportivos (

  codigo number(10) not null,
  nomeComplexo varchar2(40) not null,
  endereco varchar2(40) not null,
  capacidade number(10) not null,

  constraint pk_complexosDesportivos primary key (codigo)


  );

CREATE TABLE Competicao (

  codigo number(10) not null,
  dataCompeticao TIMESTAMP not null,
  fase  varchar2(100) not null,
  observacoes varchar2(1000) ,
  codigoComplexo number(10) not null,
  codigoClassifica number(10),
  tipoClassifica number(1) ,


  constraint pk_competicao primary key (codigo),
  constraint ck_competicao check(tipoClassifica in (1,2,3)),
  constraint fk_competicao foreign key (codigoComplexo) references ComplexosDesportivos (codigo) on delete cascade,
  constraint fk_competicaoClass foreign key (codigoClassifica) references  Competicao (codigo) on delete cascade

);


Create Table ArbitraCompeticao (

  codigoArbitro number(10) not null,  
  codigoCompeticao number (10) not null,
  papel varchar2(100) not null,

  constraint pk_arbitraCompeticao primary key (codigoArbitro, codigoCompeticao),
  constraint fk_arbitraCompeticaoArb foreign key (codigoArbitro) references Arbitro (codigo) on delete cascade,
  constraint fk_arbitraCompeticaoComp foreign key (codigoCompeticao) references Competicao (codigo) on delete cascade


  );

CREATE TABLE Compete (

  numero number (2) not null,
  nomePais varchar2(25) not null,
  nomeEsporte varchar2 (50) not null,
  nomeModalidade varchar2(50) not null,
  codigo number(10) not null,

  constraint pk_compete primary key (numero,nomeEsporte,nomePais,nomeModalidade,codigo),
  constraint fk_compete foreign key (numero,nomePais,nomeEsporte,nomeModalidade) references Equipe (numero,nomePais,nomeEsporte,nomeModalidade) on delete cascade,
  constraint fk_competeCompeticao foreign key (codigo) references Competicao (codigo) on delete cascade

  );


Create Table Resultado(

  numero number(2) not null,
  nomeEsporte varchar2(50) not null,
  nomeModalidade varchar2(50) not null,
  nomePais varchar2(25) not null,
  codigo number(10) not null,
  resultado varchar2(1000) not null,

  constraint pk_resultado primary key (numero, nomeEsporte,nomeModalidade,codigo),
  constraint fk_resultado foreign key (numero, nomeEsporte,nomePais,nomeModalidade,codigo) references Compete (numero,nomeEsporte,nomePais,nomeModalidade, codigo) on delete cascade
  
  );


commit;

