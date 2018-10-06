
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% https://rachacuca.com.br/logica/problemas/amigas-na-escola/
%%Código por Eduardo Oliveira Rodrigues &&
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


main :-
	amigas([FR1, FR1, FR1, FR1, FR1]),
	format("\n Menina 1= ~w", FR1),
	format("\n Menina 2= ~w", FR2),
	format("\n Menina 3= ~w", FR3),
	format("\n Menina 4= ~w", FR4),
	format("\n Menina 5= ~w", FR5), fail.
  
  
amigas([(N1, M1, MA1, A1, L1, S1),
		(N2, M2, MA2, A2, L2, S2),
		(N3, M3, MA3, A3, L3, S3),
		(N4, M4, MA4, A4, L4, S4),
		(N5, M5, MA5, A5, L5, S5)]
) :-

nome(N1),nome(N2),nome(N3),nome(N4),nome(N5),
alldifferent([N1, N2, N3, N4, N5]),


%Pati é a primeira da esquerda.

N1==pati,

%%Jéssica está a esquerda da Renata.

(
	%(N2==jessica, N3==renata);%retiramos jessica do N3 pq ana é N3
	(N3==jessica, N4==renata);
	(N4==jessica, N5==renata)
	
),

suco(S1),suco(S2),suco(S3),suco(S4),suco(S5),
alldifferent([S1, S2, S3, S4, S5]),
%%A pessoa que gosta de suco de Limão está no meio.


S3 == limao,

%Quem gosta de suco de Laranja senta ao lado de quem gosta de suco de Maracujá.

(
	(S1==laranja, S2==maracuja);
	(S1==maracuja, S1==laranja);
	(S4==laranja, S5==maracuja);
	(S4==maracuja,S5==laranja)

),

%%O suco favorito de Ana é de Limão
%% isso implica que Ana é o nome 3
N3==ana,
%(
%	(N1==ana, S1==limao);
%	(N2==ana, S2==limao);
%	(N3==ana, S3==limao);
%	(N4==ana, S4==limao);
%	(N5==ana, S5==limao)
%),

%%Joana gosta de suco de Abacaxi.
%%retiramos o nome da joana do N3 pois ana é N3
(
	(N1==joana, S1==abacaxi);
	(N2==joana, S2==abacaxi);
	%(N3==joana, S3==abacaxi);
	(N4==joana, S4==abacaxi);
	(N5==joana, S5==abacaxi)
),



mochila(M1),mochila(M2),mochila(M3),mochila(M4),mochila(M5),
alldifferent([M1, M2, M3, M4, M5]),


%A primeira da esquerda usa uma mochila Amarela.
M1==amarela,

%%A mochila da Jéssica é Verde.

(
	(M2==verde, N2==jessica);
	%(M3==verde, N3==jessica); retiramos jessica do N3 pq ana é N3
	(M4==verde, N4==jessica);
	(M5==verde, N5==jessica)
),

materia(MA1),materia(MA2),materia(MA3),materia(MA4),materia(MA5),
alldifferent([MA1, MA2, MA3, MA4, MA5]),


%%A menina da direita gosta de estudar Artes.

MA5==artes,

(
	(MA1==historia, MA2==matematica);
	(MA2==historia, MA3==matematica);
	(MA3==historia, MA4==matematica)
	%(MA4==matematica, MA5==historia) M5 definido

),

%(
%	(MA1==biologia, MA2==portugues);
%	(MA2==biologia, (MA1==portugues;MA3==portugues));
%	(MA3==biologia, (MA2==portugues;MA4==portugues));
%	(MA5==biologia, MA4==portugues)
%
%),


(

	(MA1==biologia, MA2==portugues);
	(MA2==biologia, (MA1==portugues;MA3==portugues));
	(MA3==biologia, (MA2==portugues;MA4==portugues));
	(MA4==biologia, MA3==portugues)

),





animal(A1),animal(A2),animal(A3),animal(A4),animal(A5),
alldifferent([A1, A2, A3, A4, A5]),
%a menina que gosta de artes gosta de hamsters, mas a 
%a menina de artes está ja definido em MA5
A5==hamsters,

(
	(A1==hamsters, MA2==biologia);
	(A5==hamsters, MA4==biologia);
	(A2==hamsters, (MA1==biologia;MA3==biologia));
	(A3==hamsters, (MA2==biologia, MA4==biologia))
),



(
	%(M1==azul, A1==cachorros);%M1 é amarela
	(M2==azul, A2==cachorros);
	(M3==azul, A3==cachorros);
	(M4==azul, A4==cachorros);
	(M5==azul, A5==cachorros)
),

(
	(S1==morango, A1==passaros);
	(S2==morango, A2==passaros);
	(S3==morango, A3==passaros);
	(S4==morango, A4==passaros);
	(S5==morango, A5==passaros)
),

%%Quem toma suco de Laranja gosta de Cavalos

(
	(S1==laranja, A1==cavalos);
	(S2==laranja, A2==cavalos);
	(S3==laranja, A3==cavalos);
	(S4==laranja, A4==cavalos);
	(S5==laranja, A5==cavalos)
),







lugar(L1),lugar(L2),lugar(L3),lugar(L4),lugar(L5),
alldifferent([L1, L2, L3, L4, L5]),



%%Quem quer viajar pra Recife tem a mochila Amarela.
%%Anteriormente já foi dito que a primeira menina da direita
%% teria a mochila amarela então basta colocar L1==recife

L1==recife,

%A menina à esquerda da do meio viajará Florianópolis.

L2==floripa,

(%M1 é amarela
	%(M2==preta, L2==rio);L2 definido
	(M3==preta, L3==rio);
	(M4==preta, L4==rio);
	(M5==preta, L5==rio)
),


%%Apartir de agora fingirei que não lembro de nada
%%simplesmete vou fazendo para todas as possibilidades

%A menina que gosta do suco de Abacaxi senta ao lado da que viajará para Fernando de Noronha.

(
	%(S1==abacaxi, L2==fernando); L2 definido
	(S5==abacaxi, L4==fernando);
	%(S2==abacaxi, (L1==fernando;L3==fernando)); %L1
	(S2==abacaxi, L3==fernando); 	
	(S3==abacaxi, L4==fernando)
	
),




%%A dona da mochila Vermelha vai viajar para Fernando de Noronha.
%%como a primeira ja tem mochila eu não coloca aqui.
(
	
	%(N1==jessica, L1==salvador); L1 definido
	%(N2==jessica, L2==salvador); L2 definido
	%(N3==jessica, L3==salvador);%retiramos jessica do N3 pois ana é N3
	(N4==jessica, L4==salvador);
	(N5==jessica, L5==salvador)
),



%%Quem gosta de Biologia senta ao lado da menina que tem Hamsters.


%%A garota que senta à direita de quem gosta de História prefere Matemática.




%%Quem gosta de suco de Laranja senta ao lado de quem gosta de suco de Maracujá.

%A dona da mochila Vermelha vai viajar para Fernando de Noronha.
(
	(M2==vermelha, L2==fernando);
	(M3==vermelha, L3==fernando);
	(M4==vermelha, L4==fernando);
	(M5==vermelha, L5==fernando)
),

%%A garota que gosta de suco de Morango tem Pássaros como animal de estimação.


%%A menina que gosta de Biologia senta ao lado da que gosta de Português.



%%Jéssica viajará para Salvador nas férias.

nl
.




nome(ana).
nome(jessica).
nome(joana).
nome(pati).
nome(renata).

mochila(amarela).
mochila(verde).
mochila(azul).
mochila(preta).
mochila(vermelha).

materia(artes).
materia(biologia).
materia(historia).
materia(matematica).
materia(portugues).

animal(cachorros).
animal(cavalos).
animal(gatos).
animal(hamsters).
animal(passaros).

lugar(fernando).
lugar(floripa).
lugar(recife).
lugar(rio).
lugar(salvador).

suco(abacaxi).
suco(limao).
suco(laranja).
suco(maracuja).
suco(morango).

alldifferent([]).
alldifferent([H|T]) :-
	not(member(H,T)),
alldifferent(T).


