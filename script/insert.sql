
/* -----------------------------------------------
	esporte
----------------------------------------------- */
insert into esporte
  (nomeEsporte, unidade)
  values
  ('futebol', 'inteiro');
insert into esporte
  (nomeEsporte, unidade)
  values
  ('corrida', 'tempo');
insert into esporte
  (nomeEsporte, unidade)
  values
  ('natacao', 'tempo');
insert into esporte
  (nomeEsporte, unidade)
  values
  ('kendo', 'unidade');
/* -----------------------------------------------
	modalidade
----------------------------------------------- */

insert into modalidade
  (nomeModalidade, numeroMaximoAtletas, categoria, nomeEsporte)
  values
  ('campo', 11, 'masculino', 'futebol');
insert into modalidade
  (nomeModalidade, numeroMaximoAtletas, categoria, nomeEsporte)
  values
  ('200m', 10, 'masculino', 'corrida');
insert into modalidade
  (nomeModalidade, numeroMaximoAtletas, categoria, nomeEsporte)
  values
  ('100m', 8, 'feminino', 'natacao');
insert into modalidade
  (nomeModalidade, numeroMaximoAtletas, categoria, nomeEsporte)
  values
  ('200m', 10, 'misto', 'natacao');
  insert into modalidade
  (nomeModalidade, numeroMaximoAtletas, categoria, nomeEsporte)
  values
  ('avancado', 2, 'masculino', 'kendo');
/* -----------------------------------------------
	país
----------------------------------------------- */
insert into pais
  (nomePais, hino, continente, bandeira)
  values
  ('Brasil',
  'Ouviram do Ipiranga as margens plácidas
De um povo heroico o brado retumbante
E o sol da liberdade, em raios fúlgidos
Brilhou no céu da pátria nesse instante

Se o penhor dessa igualdade
Conseguimos conquistar com braço forte
Em teu seio, ó liberdade
Desafia o nosso peito a própria morte!

Ó pátria amada
Idolatrada
Salve! Salve!

Brasil, um sonho intenso, um raio vívido
De amor e de esperança à terra desce
Se em teu formoso céu, risonho e límpido
A imagem do cruzeiro resplandece

Gigante pela própria natureza
És belo, és forte, impávido colosso
E o teu futuro espelha essa grandeza

Terra adorada
Entre outras mil
És tu, Brasil
Ó pátria amada!
Dos filhos deste solo és mãe gentil
Pátria amada
Brasil!

II

Deitado eternamente em berço esplêndido
Ao som do mar e à luz do céu profundo
Fulguras, ó Brasil, florão da América
Iluminado ao sol do novo mundo!

Do que a terra mais garrida
Teus risonhos, lindos campos têm mais flores
Nossos bosques têm mais vida
Nossa vida" no teu seio "mais amores

Ó pátria amada
Idolatrada
Salve! Salve!

Brasil, de amor eterno seja símbolo
O lábaro que ostentas estrelado
E diga o verde-louro dessa flâmula
Paz no futuro e glória no passado

Mas, se ergues da justiça a clava forte
Verás que um filho teu não foge à luta
Nem teme, quem te adora, a própria morte

Terra adorada
Entre outras mil
És tu, Brasil
Ó pátria amada!

Dos filhos deste solo és mãe gentil
Pátria amada
Brasil',
'America do Sul',
null);

insert into pais
  (nomePais, hino, continente, bandeira)
  values
  ('Japao',
  'Kimigayo wa
Chiyo ni yachiyo ni
Sazare-ishi no
Iwao to narite
Koke no musu made',
'Asia',
null);
insert into pais
  (nomePais, hino, continente, bandeira)
  values
  ('Jamaica',
  'Eternal father bless our land
Guide us with thy mighty land
Keep us free from evil powers
Be our light through countless hours
To our leaders great defender
Grant true wisdom from above
Justice, truth be ours forever
Jamaica, land we love
Jamaica, Jamaica, Jamaica land we love
Teach us true respect for all
Stir response to duty call
Strenghten us the weak to cherish
Give us vision, least we perish
Knowledge send us heavenly father
Grant true wisdom from above
Justice, truth be ours forever
Jamaica, land we love
Jamaica, Jamaica, Jamaica land we love',
'America',null);

insert into pais
  (nomePais, hino, continente, bandeira)
  values
  ('Alemanha',
  'Deutschland, Deutschland über alles
Über alles in der Welt
Wenn es stets zu Schutz und Trutze
Brüderlich zusammenhält
Von der Maas bis an die Memel
Von der Etsch bis an den Belt

Deutschland, Deutschland über alles
Über alles in der Welt
Deutschland, Deutschland über alles
Über alles in der Welt

Deutsche Frauen, deutsche Treue
Deutscher Wein und deutscher Sang
Sollen in der Welt behalten
Ihren alten schönen Klang
Uns zu edler Tat begeistern
Unser ganzes Leben lang

Deutsche Frauen, deutsche Treue
Deutscher Wein und deutscher Sang
Deutsche Frauen, deutsche Treue
Deutscher Wein und deutscher Sang

Einigkeit und Recht und Freiheit
Für das deutsche Vaterland!
Danach laßt uns alle streben
Brüderlich mit Herz und Hand!
Einigkeit und Recht und Freiheit
Sind des Glückes Unterpfand

Blüh im Glanze dieses Glückes
Blühe, deutsches Vaterland
Blüh im Glanze dieses Glückes
Blühe deutsches Vaterland
',
'Europa',
null);

/* -----------------------------------------------
	Complexos Desportivos
----------------------------------------------- */
insert into ComplexosDesportivos
  (codigo, nomeComplexo, endereco, capacidade)
  values
  (1000000000, 'Parque Olímpico da Barra', 'Av. Embaixador Abelardo Bueno', 15000);
insert into ComplexosDesportivos
  (codigo, nomeComplexo, endereco, capacidade)
  values
  (2000000000, 'Estádio Palestra Itália', 'Francisco Matarazzoo', 27650);
  insert into ComplexosDesportivos
  (codigo, nomeComplexo, endereco, capacidade)
  values
  (3000000000, 'Morumbi', 'Praça Roberto Gomes Pedrosa', 72.039);
/* -----------------------------------------------
	ParticipanteTipo 
----------------------------------------------- */
insert into ParticipanteTipo
  (codigo, tipo)
  values
  (0000000001, 'atleta');
insert into ParticipanteTipo
  (codigo, tipo)
  values
  (0000000002, 'arbitro');
insert into ParticipanteTipo
  (codigo, tipo)
  values
  (0000000003, 'atleta');
insert into ParticipanteTipo(codigo, tipo) values(0000000004, 'Arbitro');
insert into ParticipanteTipo(codigo, tipo) values(0000000005, 'Arbitro');
insert into ParticipanteTipo(codigo, tipo) values(0000000006, 'Arbitro');
/* -----------------------------------------------
	Passaporte 
----------------------------------------------- */
insert into Passaporte
  (passaporte, nomePais)
  values
  ('PASS12345678', 'Brasil');
insert into Passaporte
  (passaporte, nomePais)
  values
  ('PASS12345679', 'Japao');
insert into Passaporte
  (passaporte, nomePais)
  values
  ('PASS12345680', 'Alemanha');
insert into Passaporte
  (passaporte, nomePais)
  values
  ('PASS12345610', 'Brasil');
insert into Passaporte
  (passaporte, nomePais)
  values
  ('PASS12345620', 'Japao');
insert into Passaporte
  (passaporte, nomePais)
  values
  ('PASS12345630', 'Alemanha');
insert into Passaporte
  (passaporte, nomePais)
  values
  ('PASS82345630', 'Jamaica');
/* -----------------------------------------------
	Nacionalidade  
----------------------------------------------- */
insert into Nacionalidade
  (codigo, nomePais)
  values
  (0000000001, 'Brasil');
insert into Nacionalidade
  (codigo, nomePais)
  values
  (0000000002, 'Japao');
insert into Nacionalidade
  (codigo, nomePais)
  values
  (0000000003, 'Alemanha');
/* -----------------------------------------------
	Joga   
----------------------------------------------- */
insert into Joga
   (nomePais, nomeEsporte, nomeModalidade)
   values
   ('Brasil', 'futebol', 'campo');
insert into Joga
   (nomePais, nomeEsporte, nomeModalidade)
   values
   ('Japao', 'kendo', 'avancado');
insert into Joga
   (nomePais, nomeEsporte, nomeModalidade)
   values
   ('Alemanha', 'futebol', 'campo');
insert into Joga
   (nomePais, nomeEsporte, nomeModalidade)
   values
   ('Jamaica', 'futebol', 'campo');

/* -----------------------------------------------
	Atleta   
----------------------------------------------- */  
insert into Atleta
   (codigo, nomeParticipante, passaporte, sexo, dataNascimento, altura, peso)
   values
   (0000000001, 'Carlos Eduardo', 'PASS12345678', 'masculino', timestamp '2008-10-29 15:12:33.232'  , 1.80, 75);
insert into Atleta
   (codigo, nomeParticipante, passaporte, sexo, dataNascimento, altura, peso)
   values
   (0000000002, 'Takeshi Kitano', 'PASS12345679', 'masculino', timestamp '2007-04-12 11:12:33.232'  , 1.70, 65);
insert into Atleta
   (codigo, nomeParticipante, passaporte, sexo, dataNascimento, altura, peso)
   values
   (0000000003, 'Evelyn Hagendaz', 'PASS12345680', 'feminino', timestamp '2006-04-12 11:12:33.232'  , 1.75, 68);
insert into Atleta
   (codigo, nomeParticipante, passaporte, sexo, dataNascimento, altura, peso)
   values
   (0000000004, 'Droggba', 'PASS82345630', 'masculino', timestamp '2006-04-12 11:12:33.232', 1.9, 90);
/* -----------------------------------------------
	Equipe   
----------------------------------------------- */ 
insert into Equipe
  (numero, nomePais, nomeEsporte, nomeModalidade)
  values
  (1, 'Brasil', 'futebol', 'campo');
insert into Equipe
  (numero, nomePais, nomeEsporte, nomeModalidade)
  values
  (2, 'Japao', 'kendo', 'avancado');  
insert into Equipe
  (numero, nomePais, nomeEsporte, nomeModalidade)
  values
  (1, 'Alemanha', 'futebol', 'campo');
insert into Equipe
  (numero, nomePais, nomeEsporte, nomeModalidade)
  values
  (2, 'Alemanha', 'futebol', 'campo');
insert into Equipe
  (numero, nomePais, nomeEsporte, nomeModalidade)
  values
  (3, 'Alemanha', 'futebol', 'campo');
insert into Equipe
  (numero, nomePais, nomeEsporte, nomeModalidade)
  values
  (1, 'Jamaica', 'futebol', 'campo');
insert into Equipe
  (numero, nomePais, nomeEsporte, nomeModalidade)
  values
  (2, 'Jamaica', 'futebol', 'campo');
insert into Equipe
  (numero, nomePais, nomeEsporte, nomeModalidade)
  values
  (3, 'Jamaica', 'futebol', 'campo');
insert into Equipe
  (numero, nomePais, nomeEsporte, nomeModalidade)
  values
  (4, 'Jamaica', 'futebol', 'campo');

/* -----------------------------------------------
	Participa   
----------------------------------------------- */
insert into Participa
  (numero, nomePais, nomeEsporte, nomeModalidade, codigo)
  values
  (1, 'Brasil', 'futebol', 'campo', 0000000001);
insert into Participa
  (numero, nomePais, nomeEsporte, nomeModalidade, codigo)
  values
  (2, 'Japao', 'kendo', 'avancado', 0000000002);
insert into Participa
  (numero, nomePais, nomeEsporte, nomeModalidade, codigo)
  values
  (1, 'Alemanha', 'futebol', 'campo', 0000000003);
insert into Participa
  (numero, nomePais, nomeEsporte, nomeModalidade, codigo)
  values
  (2, 'Alemanha', 'futebol', 'campo', 0000000003);
insert into Participa
  (numero, nomePais, nomeEsporte, nomeModalidade, codigo)
  values
  (3, 'Alemanha', 'futebol', 'campo', 0000000003);
insert into Participa
  (numero, nomePais, nomeEsporte, nomeModalidade, codigo)
  values
  (1, 'Jamaica', 'futebol', 'campo', 0000000004);
insert into Participa
  (numero, nomePais, nomeEsporte, nomeModalidade, codigo)
  values
  (2, 'Jamaica', 'futebol', 'campo', 0000000004);
insert into Participa
  (numero, nomePais, nomeEsporte, nomeModalidade, codigo)
  values
  (3, 'Jamaica', 'futebol', 'campo', 0000000004);
insert into Participa
  (numero, nomePais, nomeEsporte, nomeModalidade, codigo)
  values
  (4, 'Jamaica', 'futebol', 'campo', 0000000004);


/* -----------------------------------------------
	Competicao   
----------------------------------------------- */
insert into Competicao
  (codigo, dataCompeticao, fase, observacoes, codigoComplexo, codigoClassifica, tipoClassifica)
  values
  (001, timestamp '2016-04-12 11:12:33.232', 'semi-final', null, 1000000000, null, 1);
insert into Competicao
  (codigo, dataCompeticao, fase, observacoes, codigoComplexo, codigoClassifica, tipoClassifica)
  values
  (002, timestamp '2016-04-15 11:12:33.232', 'final', null, 2000000000, null, 2);
insert into Competicao
  (codigo, dataCompeticao, fase, observacoes, codigoComplexo, codigoClassifica, tipoClassifica)
  values
  (003, timestamp '2016-04-15 11:12:33.232', 'final', null, 3000000000, null, 3);
insert into Competicao
  (codigo, dataCompeticao, fase, observacoes, codigoComplexo, codigoClassifica, tipoClassifica)
  values
  (004, timestamp '2016-04-15 11:12:33.232', 'final', null, 3000000000, null, 3);
insert into Competicao
  (codigo, dataCompeticao, fase, observacoes, codigoComplexo, codigoClassifica, tipoClassifica)
  values
  (005, timestamp '2016-04-15 11:12:33.232', 'final', null, 3000000000, null, 3);
insert into Competicao
  (codigo, dataCompeticao, fase, observacoes, codigoComplexo, codigoClassifica, tipoClassifica)
  values
  (006, timestamp '2016-04-15 11:12:33.232', 'final', null, 3000000000, null, 3);
insert into Competicao
  (codigo, dataCompeticao, fase, observacoes, codigoComplexo, codigoClassifica, tipoClassifica)
  values
  (007, timestamp '2016-03-15 11:12:33.232', 'final', null, 3000000000, null, 3);
insert into Competicao
  (codigo, dataCompeticao, fase, observacoes, codigoComplexo, codigoClassifica, tipoClassifica)
  values
  (008, timestamp '2016-01-15 11:12:33.232', 'final', null, 3000000000, null, 3);
insert into Competicao
  (codigo, dataCompeticao, fase, observacoes, codigoComplexo, codigoClassifica, tipoClassifica)
  values
  (009, timestamp '2016-08-15 11:12:33.232', 'final', null, 3000000000, null, 3);
/* -----------------------------------------------
	Arbitro   
----------------------------------------------- */
insert into Arbitro(codigo,nomeParticipante, passaporte, sexo, dataNascimento)
  values
  (0000000004,'Roberto','PASS12345630','masculino',timestamp'1981-06-01 00:00:00.000');
insert into Arbitro(codigo,nomeParticipante, passaporte, sexo, dataNascimento)
  values
  (0000000005,'Roberta','PASS12345620','feminino',timestamp'1989-06-01 00:00:00.000');
insert into Arbitro(codigo,nomeParticipante, passaporte, sexo, dataNascimento)
  values
  (0000000006,'Luan','PASS12345610','masculino',timestamp'1970-06-01 00:00:00.000');
/* -----------------------------------------------
	ArbitraCompeticao  
----------------------------------------------- */
insert into ArbitraCompeticao
  (codigoArbitro, codigoCompeticao, papel)
  values
  (0000000004,001,'banderinha');
insert into ArbitraCompeticao (codigoArbitro, codigoCompeticao, papel)
  values
  (0000000005,002,'juiz');
insert into ArbitraCompeticao (codigoArbitro, codigoCompeticao, papel)
  values
  (0000000006,003,'juiz reserva');
/* -----------------------------------------------
	ArbitraEsporte  
----------------------------------------------- */
insert into ArbitraEsporte
  (codigo, nomeEsporte)
  values
  (0000000004,'futebol');  
insert into ArbitraEsporte
  (codigo, nomeEsporte)
  values
  (0000000005,'natacao');   
insert into ArbitraEsporte
  (codigo, nomeEsporte)
  values
  (0000000006,'corrida');
/* -----------------------------------------------
	Compete   
----------------------------------------------- */
insert into Compete
  (numero, nomePais, nomeEsporte, nomeModalidade, codigo)
  values
  (1, 'Brasil', 'futebol', 'campo', 001);
insert into Compete
  (numero, nomePais, nomeEsporte, nomeModalidade, codigo)
  values
  (2, 'Japao', 'kendo', 'avancado', 002); 
insert into Compete
  (numero, nomePais, nomeEsporte, nomeModalidade, codigo)
  values
  (1, 'Alemanha', 'futebol', 'campo', 003); 
insert into Compete
  (numero, nomePais, nomeEsporte, nomeModalidade, codigo)
  values
  (2, 'Alemanha', 'futebol', 'campo', 004); 
insert into Compete
  (numero, nomePais, nomeEsporte, nomeModalidade, codigo)
  values
  (3, 'Alemanha', 'futebol', 'campo', 005); 
insert into Compete
  (numero, nomePais, nomeEsporte, nomeModalidade, codigo)
  values
  (1, 'Jamaica', 'futebol', 'campo', 006); 
insert into Compete
  (numero, nomePais, nomeEsporte, nomeModalidade, codigo)
  values
  (2, 'Jamaica', 'futebol', 'campo', 007); 
insert into Compete
  (numero, nomePais, nomeEsporte, nomeModalidade, codigo)
  values
  (3, 'Jamaica', 'futebol', 'campo', 008); 
insert into Compete
  (numero, nomePais, nomeEsporte, nomeModalidade, codigo)
  values
  (4, 'Jamaica', 'futebol', 'campo', 009); 
/* -----------------------------------------------
	Resultado    
----------------------------------------------- */
insert into Resultado
  (numero, nomeEsporte, nomeModalidade, nomePais, codigo, resultado)
  values
  (1, 'futebol', 'campo', 'Brasil', 001, 3.0);
  insert into Resultado
  (numero, nomeEsporte, nomeModalidade, nomePais, codigo, resultado)
  values
  (2, 'kendo', 'avancado', 'Japao', 002, 2.0);
insert into Resultado
  (numero, nomeEsporte, nomeModalidade, nomePais, codigo, resultado)
  values
  (1, 'futebol', 'campo', 'Alemanha', 003, 4.0);
insert into Resultado
  (numero, nomeEsporte, nomeModalidade, nomePais, codigo, resultado)
  values
  (2,'futebol', 'campo', 'Alemanha', 004,4.0);
insert into Resultado
  (numero, nomeEsporte, nomeModalidade, nomePais, codigo, resultado)
  values
  (3,'futebol', 'campo', 'Alemanha', 005,7.0);
insert into Resultado
  (numero, nomeEsporte, nomeModalidade, nomePais, codigo, resultado)
  values
  (1,'futebol', 'campo', 'Jamaica', 006,1.0);
insert into Resultado
  (numero, nomeEsporte, nomeModalidade, nomePais, codigo, resultado)
  values
  (2,'futebol', 'campo', 'Jamaica', 007,3.0);
insert into Resultado
  (numero, nomeEsporte, nomeModalidade, nomePais, codigo, resultado)
  values
  (3,'futebol', 'campo', 'Jamaica', 008,0.0);
insert into Resultado
  (numero, nomeEsporte, nomeModalidade, nomePais, codigo, resultado)
  values
  (4,'futebol', 'campo', 'Jamaica', 009,8.0);
  
commit;

