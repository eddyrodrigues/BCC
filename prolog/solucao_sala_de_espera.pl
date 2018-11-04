
solucao:-
		statistics(cputime, T0),
		sala([PAC1,PAC2,PAC3,PAC4,PAC5]),
		nl,
		write(PAC1),nl,
		write(PAC2),nl,
		write(PAC3),nl,
		write(PAC4),nl,
		write(PAC5),
		statistics(cputime, T1),
		TEMPO_TOTAL is T1 - T0,
		format("\nO tempo de execução é: ~10f sec", TEMPO_TOTAL),
fail.

sala([
(C1,P1,R1,D1,H1,M1),
(C2,P2,R2,D2,H2,M2),
(C3,P3,R3,D3,H3,M3),
(C4,P4,R4,D4,H4,M4),
(C5,P5,R5,D5,H5,M5)
]):-

camisa(C1), camisa(C2), camisa(C3), camisa(C4), camisa(C5),
alldifferent([C1, C2, C3, C4, C5]),

 %   A pessoa de camisa Verde está em algum lugar entre a pessoa com camisa Vermelha e a pessoa de camisa Azul, nessa ordem.

(
	(C1==vermelho, C2==verde, C3==azul);
	(C1==vermelho, C2==verde, C4==azul);
	(C1==vermelho, C2==verde, C5==azul);
	(C1==vermelho, C3==verde, C4==azul);
	(C1==vermelho, C3==verde, C5==azul);
	(C1==vermelho, C4==verde, C5==azul);
	
	(C2==vermelho, C3==verde, C4==azul);
	(C2==vermelho, C3==verde, C5==azul);
	(C2==vermelho, C4==verde, C5==azul);
	
	(C3==vermelho, C4==verde, C5==azul)


	%(C1==vermelho, ( (C2==verde, C3==azul); (C3==verde, C4==rodrigo); (C4==verde, C5==azul)));
	%(C2==vermelho, ( (C3==verde, C4==azul); (C4==verde, C5==azul)));
	%(C3==vermelho, ( (C4==verde, C5==azul)))
	
 ),
 

paciente(P1), paciente(P2), paciente(P3), paciente(P4), paciente(P5),
alldifferent([P1,P2,P3,P4,P5]),

revista(R1), revista(R2), revista(R3), revista(R4), revista(R5),
alldifferent([R1,R2,R3,R4,R5]),

dentista(D1), dentista(D2), dentista(D3), dentista(D4), dentista(D5),
alldifferent([D1,D2,D3,D4,D5]),

 %   A Raquel irá atender o paciente do meio.

D3==raquel,

 %   O primeiro paciente será atendido pela Silvia.

D1==silvia,

%   O paciente da Dra Adriana está em algum lugar entre os pacientes das doutoras Raquel e Priscila, nessa ordem.
 (
	%(D1==raquel, D2==adriana, D3==priscila);
	%(D1==raquel, D2==adriana, D4==priscila);
	%(D1==raquel, D2==adriana, D5==priscila);
	
	%(D2==raquel, D3==adriana, D4==priscila);
	%(D2==raquel, D3==adriana, D5==priscila);
	
	(D3==raquel, D4==adriana, D5==priscila)
	
	%(D1==raquel, ( (D2==adriana, D3==priscila); (D3==adriana, D4==priscila); (D4==adriana, D5==priscila)));
	%(D2==raquel, ( (D3==adriana, D4==priscila); (D4==adriana, D5==priscila)));
	%(D3==raquel, ( (D4==adriana, D5==priscila)))
 
 ),
 
 %   O Álvaro é o paciente da Priscila.
 
 
 (
	(P1==alvaro, D1==priscila);
	(P2==alvaro, D2==priscila);
	(P3==alvaro, D3==priscila);
	(P4==alvaro, D4==priscila);
	(P5==alvaro, D5==priscila)
 
),
 
 %   O paciente da Dra. Raquel está lendo a revista Galileu.
 
 (
	(D1==raquel, R1==galileu);
	(D2==raquel, R2==galileu);
	(D3==raquel, R3==galileu);
	(D4==raquel, R4==galileu);
	(D5==raquel, R5==galileu)
 ),
 
 %   O paciente da Dra. Pricila está exatamente à direita de quem está com a revista Caras.
 (
	(R1==caras, D2==priscila);
	(R2==caras, D3==priscila);
	(R3==caras, D4==priscila);
	(R4==caras, D5==priscila)
 ),
 
horario(H1), horario(H2), horario(H3), horario(H4), horario(H5),
alldifferent([H1,H2,H3,H4,H5]),

 %   O quarto paciente será atendido as 10h.

H4==1000,

 %   Quem tem consulta às 10:15 está sentado em uma das pontas.
 (
	(H1==1015);
	(H5==1015)
 ),
 


motivo(M1), motivo(M2), motivo(M3), motivo(M4), motivo(M5),
alldifferent([M1,M2,M3,M4,M5]),
 %   O paciente que veio fazer uma Restauração está em algum lugar entre quem veio tratar o Canal e quem veio fazer uma Obturação, nessa ordem.

(
	(M1==canal, M2==restauracao, M3==obturacao);
	(M1==canal, M2==restauracao, M4==obturacao);
	(M1==canal, M2==restauracao, M5==obturacao);
    (M1==canal, M3==restauracao, M4==obturacao);
    (M1==canal, M3==restauracao, M5==obturacao);
	(M1==canal, M4==restauracao, M5==obturacao);
    
	(M2==canal, M3==restauracao, M4==obturacao);
	(M2==canal, M3==restauracao, M5==obturacao);
    (M2==canal, M4==restauracao, M5==obturacao);
	
	(M3==canal, M4==restauracao, M5==obturacao)
	
	
	%(M1==canal, ( (M2==restauracao, M3==obturacao); (M3==restauracao, M4==obturacao); (M4==restauracao, M5==obturacao)));
	%(M2==canal, ( (M3==restauracao, M4==obturacao); (M4==restauracao, M5==obturacao)));
	%(M3==canal, ( (M4==restauracao, M5==obturacao)))

 ),

 %   A pessoa que veio fazer uma obturação está lendo a revista Caras.
 
 (
	(M1==obturacao, R1==caras);
	(M2==obturacao, R2==caras);
	(M3==obturacao, R3==caras);
	(M4==obturacao, R4==caras);
	(M5==obturacao, R5==caras)
 ),
 
 %   Quem está lendo a Veja está em algum lugar entre o Eduardo e quem está com a revista Galileu, nessa ordem.
 
 (
	(P1==eduardo, R2==veja, R3==galileu);
	(P1==eduardo, R2==veja, R4==galileu);
	(P1==eduardo, R2==veja, R5==galileu);
	(P1==eduardo, R3==veja, R4==galileu);
	(P1==eduardo, R3==veja, R5==galileu);
	(P1==eduardo, R4==veja, R5==galileu);
	
	
	
	(P2==eduardo, R3==veja, R4==galileu);
	(P2==eduardo, R3==veja, R5==galileu);
	(P2==eduardo, R4==veja, R5==galileu);
	
	(P3==eduardo, R4==veja, R5==galileu)
	
	%(%P1==eduardo, ( (R2==veja, R3==galileu); (R3==veja,R4==galileu); (R4==veja, R5==galileu)));
	%(P2==eduardo, ( (R3==veja, R4==galileu); (R4==veja, R5==galileu)));
	%(%P3==eduardo, ( (R4==veja, R5==galileu)))

 ),
  
  
 
%     Quem veio ajustar o Aparelho está em algum lugar entre quem está lendo Isto É e quem veio fazer a restauração, nessa ordem.
  
  (
	
	(R1==isto, M2==aparelho, M3==restauracao);
	(R1==isto, M2==aparelho, M4==restauracao);
	(R1==isto, M2==aparelho, M5==restauracao);
	
	(R1==isto, M3==aparelho, M4==restauracao);
	(R1==isto, M3==aparelho, M5==restauracao);
	
	(R1==isto, M4==aparelho, M5==restauracao);
	
	(R2==isto, M3==aparelho, M4==restauracao);
	(R2==isto, M3==aparelho, M5==restauracao);
	(R2==isto, M4==aparelho, M5==restauracao);
	(R3==isto, M4==aparelho, M5==restauracao)
	
	
	%(R1==isto, ( (M2==aparelho, M3==restauracao); (M3==aparelho,M4==restauracao); (M4==aparelho, M5==restauracao)));
	%(R2==isto, ( (M3==aparelho, M4==restauracao); (M4==aparelho, M5==restauracao)));
	%(R3==isto, ( (M4==aparelho, M5==restauracao)))

 ),
 
 
 

 
 %   O Marcos está em algum lugar entre o paciente de camisa Amarela e o Rodrigo, nessa ordem.
 
 (
	(C1==amarelo, P2==marcos, P3==rodrigo);
	(C1==amarelo, P2==marcos, P4==rodrigo);
	(C1==amarelo, P2==marcos, P5==rodrigo);
	(C1==amarelo, P3==marcos, P4==rodrigo);
	(C1==amarelo, P3==marcos, P5==rodrigo);
	(C1==amarelo, P4==marcos, P5==rodrigo);
	
	
	(C2==amarelo, P3==marcos, P4==rodrigo);
	(C2==amarelo, P3==marcos, P5==rodrigo);
	
	(C2==amarelo, P4==marcos, P5==rodrigo);
	
	(C3==amarelo, P4==marcos, P5==rodrigo)	
	
%	(C1==amarelo, ( (P2==marcos, P3==rodrigo); (P3==marcos, P4==rodrigo); (P4==marcos, P5==rodrigo)));
%	(C2==amarelo, ( (P3==marcos, P4==rodrigo); (P4==marcos, P5==rodrigo)));
%	(C3==amarelo, ( (P4==marcos, P5==rodrigo)))

 ),
 
 
 

 
 %   A pessoa de Amarelo está em algum lugar à esquerda do paciente agendado às 10:30.

(

	(H2==1030, C1==amarelo);
	
	(H3==1030, (C1==amarelo;C2==amarelo));
	(H4==1030, (C3==amarelo;C2==amarelo;C1==amarelo));
	(H5==1030, (C4==amarelo;C3==amarelo;C2==amarelo;C1==amrelo))
	

	%(H5==1030, ( (C1==amarelo); (C2==amarelo); (C3==amarelo); (C4==amarelo) ));
	%(H4==1030, ( (C1==amarelo); (C2==amarelo); (C3==amarelo)));
	%(H3==1030, ( (C1==amarelo); (C2==amarelo)));
	%(H2==1030, ( (C1==amarelo)))
)
,





 %   O homem de camisa Azul está em algum lugar à esquerda de quem tem consulta as 11h.
 
(
	(H5==1100, ( (C1==azul); (C2==azul); (C3==azul); (C4==azul) ));
	(H4==1100, ( (C1==azul); (C2==azul); (C3==azul)));
	(H3==1100, ( (C1==azul); (C2==azul)));
	(H2==1100, ( (C1==azul)))
)



 
 ,
 
 
 
 %   O homem de camisa Amarela está em algum lugar entre quem está lendo Isto É e quem veio de camisa Branca, nessa ordem.

(

	(R1==isto, C2==amarelo, C3==branco);
	(R1==isto, C2==amarelo, C4==branco);
	(R1==isto, C2==amarelo, C5==branco);
	
	(R1==isto, C3==amarelo, C4==branco);
	(R1==isto, C3==amarelo, C5==branco);
	
	(R1==isto, C4==amarelo, C5==branco);
	
	
	(R2==isto, C3==amarelo, C4==branco);
	(R2==isto, C3==amarelo, C5==branco);
	
	%(R3==isto, C4==amarelo, C5==branco);	
	
	(R3==isto, C4==amarelo, C5==branco)
	
 )
,
 nl.
 



horario(1000).
horario(1015).
horario(1030).
horario(1045).
horario(1100).

paciente(alvaro).
paciente(celso).
paciente(eduardo).
paciente(marcos).
paciente(rodrigo).


dentista(adriana).
dentista(daniele).
dentista(priscila).
dentista(silvia).
dentista(raquel).

revista(isto).
revista(veja).
revista(galileu).
revista(caras).
revista(epoca).


motivo(aparelho).
motivo(obturacao).
motivo(restauracao).
motivo(clareamento).
motivo(canal).


camisa(azul).
camisa(amarelo).
camisa(branco).
camisa(verde).
camisa(vermelho).

% DEFINICAO DE ALLDIFERENT
	alldifferent([]).
	alldifferent([H|T]):- not(member(H,T)),
							alldifferent(T).
							
							
							
	
	
	
	%solucoes iniciais
	
% vermelho,eduardo,isto,silvia,1015,aparelho
% amarelo,celso,veja,daniele,1045,canal
% verde,marcos,galileu,raquel,1030,restauracao
% azul,rodrigo,caras,adriana,1000,obturacao
% branco,alvaro,epoca,priscila,1100,clareamento
%
% vermelho,eduardo,isto,silvia,1015,clareamento
% amarelo,celso,veja,daniele,1045,canal
% verde,marcos,galileu,raquel,1030,restauracao
% azul,rodrigo,caras,adriana,1000,obturacao
% branco,alvaro,epoca,priscila,1100,aparelho
%
% vermelho,eduardo,isto,silvia,1015,canal
% amarelo,celso,veja,daniele,1045,aparelho
% verde,marcos,galileu,raquel,1030,restauracao
% azul,rodrigo,caras,adriana,1000,obturacao
% branco,alvaro,epoca,priscila,1100,clareamento
%
% vermelho,eduardo,isto,silvia,1015,canal
% amarelo,celso,veja,daniele,1045,restauracao
% verde,marcos,galileu,raquel,1030,aparelho
% azul,rodrigo,caras,adriana,1000,obturacao
% branco,alvaro,epoca,priscila,1100,clareamento
%
% vermelho,eduardo,isto,silvia,1015,canal
% amarelo,celso,veja,daniele,1045,restauracao
% verde,marcos,galileu,raquel,1030,clareamento
% azul,rodrigo,caras,adriana,1000,obturacao
% branco,alvaro,epoca,priscila,1100,aparelho
%
% vermelho,eduardo,isto,silvia,1015,canal
% amarelo,celso,veja,daniele,1045,clareamento
% verde,marcos,galileu,raquel,1030,restauracao
% azul,rodrigo,caras,adriana,1000,obturacao
% branco,alvaro,epoca,priscila,1100,aparelho
% false.

%%segunda tentativa e ultima

% [dd@archlinux prolog]$ swipl solucao_sala_de_espera.pl 
% Welcome to SWI-Prolog (threaded, 64 bits, version 7.6.4)
% SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software.
% Please run ?- license. for legal details.
%
% For online help and background, visit http://www.swi-prolog.org
% For built-in help, use ?- help(Topic). or ?- apropos(Word).
%
% ?- solucao.
%
%
% vermelho,eduardo,isto,silvia,1015,canal
% amarelo,celso,veja,daniele,1045,aparelho
% verde,marcos,galileu,raquel,1030,restauracao
% azul,rodrigo,caras,adriana,1000,obturacao
% branco,alvaro,epoca,priscila,1100,clareamento
% false.
%
% ?- 


