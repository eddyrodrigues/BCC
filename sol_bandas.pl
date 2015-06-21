% Passeio no Zoologico 
% TRABALHO EM GRUPO
% MARLON HENRY E ELOY
%%% ADAPTACACAO PROF CLAUDIO - JUNHO 2015
%% READAPTACAO Eduardo Oliveira Rodrigues
%% SHOW DE BANDAS


go :-  %% Tempo inicial
    statistics(cputime,T1),
   
    amigas(  [M1, M2, M3, M4,M5]  ), 
    imprime_lista(  [M1, M2, M3, M4,M5]  ),

     %% Tempo final
    statistics(cputime ,T2), 
    Tempo_BUSCA is T2 - T1, 
    format('\n T1: ~f \t T2: ~f  msec', [T1, T2]),
    format('\n Tempo total: ~10f  msec', Tempo_BUSCA), !.


amigas([(CAMISA1, NOME1, ESTILO1, FORM1, SH1, UF1),
        (CAMISA2, NOME2, ESTILO2, FORM2, SH2, UF2),
        (CAMISA3, NOME3, ESTILO3, FORM3, SH3, UF3),
        (CAMISA4, NOME4, ESTILO4, FORM4, SH4, UF4),
        (CAMISA5, NOME5, ESTILO5, FORM5, SH5, UF5)]
       ):-
       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%camisa
	sh(CAMISA1), sh(CAMISA2), sh(CAMISA3), sh(CAMISA4), 
	sh(CAMISA5), 
	alldifferent([CAMISA1, CAMISA2, CAMISA3, CAMISA4, CAMISA5]),
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	% O vocalista de Vermelho é integrante da banda do Amazonas.
	
	(
	(CAMISA1==vermelha,UF1==am);
	(CAMISA2==vermelha,UF2==am);
	(CAMISA3==vermelha,UF3==am);
	(CAMISA4==vermelha,UF4==am);
	(CAMISA4==vermelha,UF5==am)
	)
	,

	
	% David está em algum lugar à direita do vocalista de Azul.
	
	(
	(CAMISA1==azul,(NOME2==david;NOME3==david;NOME4==david;NOME5==david));
	(CAMISA2==azul,(NOME3==david;NOME4==david;NOME5==david));
	(CAMISA3==azul,(NOME4==david;NOME5==david));
	(CAMISA4==azul,NOME5==david)
	)
	,

	% Fred está em algum lugar à direita do vocalista de Amarelo.

	(
	(CAMISA1==amarela,(NOME2==fred;NOME3==fred;NOME4==fred;NOME5==fred));
	(CAMISA2==amarela,(NOME3==fred;NOME4==fred;NOME5==fred));
	(CAMISA3==amarela,(NOME4==fred;NOME5==fred));
	(CAMISA4==amarela,NOME5==fred)
	)
	,

	
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%nomes     
	nome(NOME1), nome(NOME2), nome(NOME3), nome(NOME4), 
	nome(NOME5), 
	alldifferent([NOME1, NOME2, NOME3, NOME4, NOME5]),
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



	% a quenta posicao esta o vocalista da banda formada em 2007
        (
           (NOME1==andre,FORM2==2008);(NOME2==andre,FORM1==2008);
           (NOME2==andre,FORM3==2008);(NOME3==andre,FORM2==2008);
           (NOME3==andre,FORM4==2008);(NOME4==andre,FORM3==2008);
           (NOME5==andre,FORM4==2008)
        )
        ,  %CONTINUAR
	

	    % O vocalista da banda de Hardcore está exatamente à direita do vocalista que apresentará às 20 horas.

    	(
    	(SH1==8,ESTILO2==hardcore);
	(SH2==8,ESTILO3==hardcore);
	(SH3==8,ESTILO4==hardcore);
    	(SH4==8,ESTILO5==hardcore)
    	)
    	,			
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%estilos     
	sty(ESTILO1), sty(ESTILO2), sty(ESTILO3), sty(ESTILO4), 
	sty(ESTILO5), 

	alldifferent([ESTILO1, ESTILO2, ESTILO3, ESTILO4, ESTILO5]),
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	( % A banda gótica se apresentará às 20 horas.
	(ESTILO1==gotico, SH1==8);
	(ESTILO2==gotico, SH2==8);
	(ESTILO3==gotico, SH3==8);
	(ESTILO4==gotico, SH4==8);
	(ESTILO5==gotico, SH5==8)
	)
	,	


	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%formacao     
	form(FORM1), form(FORM2), form(FORM3), form(FORM4), 
	form(FORM5), 
	%Na quinta posição está o vocalista da banda formada em 2007.

		FORM5==2007,

	alldifferent([FORM1, FORM2, FORM3, FORM4, FORM5]),
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	 % O vocalista da banda formada em 2006 está exatamente à esquerda do vocalista da banda de São Paulo

    	(
    	(FORM1==2006,UF2==sp);
	(FORM2==2006,UF3==sp);
	(FORM3==2006,UF4==sp);
	(FORM4==2006,UF5==sp)    	
	)
    	,	

	(
	(FORM1==2009,SH2==9);
	(FORM2==2009,SH3==9);
	(FORM3==2009,SH4==9);
	(FORM4==2009,SH5==9)
	)
	,
	
	% os vocalistas das bandas formadas em 2006 e 2008 estao lado a lado

	(
	   (FORM1==2006,FORM2==2008);(FORM1==2008,FORM2==2006);
	   (FORM2==2006,FORM3==2008);(FORM2==2008,FORM3==2006);
	   (FORM3==2006,FORM4==2008);(FORM3==2008,FORM4==2006)
	)
	,
	
	


	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%shows 
	sho(SH1), sho(SH2), sho(SH3), shoo(SH4), 
	sho(SH5), 
	alldifferent([SH1, SH2, SH3, SH4, SH5]),
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   %o vocalista que fara a ultima apresentacao esta exatamente a esquerda do vocalista da banda formada em 2006

	(
	(SH1==11,FORM2==2006);
	(SH2==11,FORM3==2006);
	(SH3==11,FORM4==2006);
	(SH4==11,FORM5==2006)
	)
	,
	
  %quem vai se apresentar as 19 horas esta entre 22 horas e 20 horas nesta ordem
	
	(   
	(SH1==10,SH2==7,SH3==8);
	(SH2==10,SH3==7,SH4==8);
	(SH3==10,SH4==7,SH5==8)
	)
	,
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%estados     
	uf(UF1), uf(UF2), uf(UF3), uf(UF4), 
	uf(UF5), 
	
	UF5==am,

	alldifferent([UF1, UF2, UF3, UF4, UF5]),
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
		%o vocalista da banda do mato grosso esta exatamente a esquerda do vocalista da banda paulista.

	(
	(UF1==mt,UF2==sp);(UF2==mt,UF3==sp);
	(UF3==mt,UF4==sp);(UF4==mt,UF5==sp)
	)
	,
	
	%O vocalista da banda mineira está exatamente à direita de quem está de Azul.

	(
	(UF2==mg,CAMISA1==azul);
	(UF3==mg,CAMISA2==azul);
	(UF4==mg,CAMISA3==azul);
	(UF5==mg,CAMISA4==azul)
	)

	.
%%ponto final
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		% BASE DE DADOS
sh(amarela).
sh(azul).
sh(branca).
sh(verde).
sh(vermelha).

%%%%%%%%%%%%%%%%%%
sty(gotico).
sty(grunge).
sty(poprock).
sty(punk).
sty(hardcore).
%%%%%%%%%%%%%%%%%%
nome(andre).
nome(chris).
nome(david).
nome(fred).
nome(marcelo).
%%%%%%%%%%%%%%%%%%
form(2005).
form(2006).
form(2007).
form(2008).
form(2009).
%%%%%%%%%%
sho(7).
sho(8).
sho(9).
sho(10).
sho(111).
%%%%%%%%%%%%%%
uf(am).
uf(ce).
uf(mg).
uf(mt).
uf(sp).	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
 

% DEFINICAO DE ALLDIFERENT  
	alldifferent([]).
	alldifferent([H|T]):- not(member(H,T)),
	                      alldifferent(T).
	
	imprime_lista([]):- write('\n FIM \n').
	imprime_lista([H|T]):- write('\n......................................\n'),
	                       write(H), write(' : '),
	                       imprime_lista(T).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/*

QUASE ORIGINAL
	?- go.

.............
verde,japa,matematica,abacaxi,banana,elefante
.............
vermelho,aretuza,historia,laranja,chocolate,arara
.............
amarelo,pati,geografia,limao,salgado,leao
.............
azul,renata,biologia,maracuja,maca,girafa
.............
branco,anny,portugues,morango,sanduiche,macaco
 FIM 

 T1: 11.142291 	 T2: 36.219399  msec
 Tempo total: 25.0771080730  msec
true.

APOS MUDANCAS

......................................
verde,japa,matematica,abacaxi,banana,elefante : 
......................................
vermelho,aretuza,historia,laranja,chocolate,arara : 
......................................
amarelo,pati,geografia,limao,salgado,leao : 
......................................
azul,renata,biologia,maracuja,maca,girafa : 
......................................
branco,anny,portugues,morango,sanduiche,macaco : 
 FIM 

 T1: 45.681035 	 T2: 49.336146  msec
 Tempo total: 3.6551109330  msec
true.

*/
