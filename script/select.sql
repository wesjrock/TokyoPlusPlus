select A.codigo, A.nomeParticipante, count(B.codigo)as QuantidadesJogo from Atleta A join Participa P
on A.codigo = P.codigo
join Equipe E
on E.numero = P.numero 
and E.nomePais = P.nomePais 
and E.nomeEsporte = P.nomeEsporte
and E.nomeModalidade = P.nomeModalidade
join Compete B 
on E.numero = B.numero
and E.nomePais = B.nomePais 
and E.nomeEsporte = B.nomeEsporte
and E.nomeModalidade = B.nomeModalidade
group by A.codigo,A.nomeParticipante
having count(B.codigo) >= 3 ;


commit;
