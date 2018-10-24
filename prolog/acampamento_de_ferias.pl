

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
editing yet
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


main:-


        barracas(B1, B2, B3, B4, B5),
        write("Eduardo Oliveira Rodrigues"), fail.
        
        
        
main:-Write("não funcionou").



barracas([  (C1, N1, I1, S1, E1, ESP1),
            (C2, N2, I2, S2, E2, ESP2),
            (C3, N3, I3, S3, E3, ESP3),
            (C4, N4, I4, S4, E4, ESP4),
            (C5, N5, I5, S5, E5, ESP5)]):-
            
            
            
 

 %%   A barraca Vermelha está em algum lugar entre o garoto mais velho e quem gosta de Basquete, nessa ordem.
 
 
  %%  O menino que gosta de sanduíche de Salame está ao lado de quem está na barraca Verde.
  
 
 (
    (S1==salame, B1==verde);
    (S2==salame, (B1==verde;B3==verde));
    (S3==salame, (B2==verde;B4==verde));
    (S5==salame, B4==verde)
 ),
 
 
  
  %%  O garoto que joga Tênis está exatamente à esquerda de quem está na barraca Verde.
  
  (
    (ESP1==tenis, B2==verde);
    (ESP2==tenis, B3==verde);
    (ESP3==tenis, B4==verde);
    (ESP4==tenis, B5==verde)
  ),
  
  
  
  %%  Breno está em algum lugar à direita da barraca Vermelha.
  
  (
    (N2==breno, B1==vermelha);
    
  
  
  ),
  
  %%  Na primeira barraca está o garoto que gosta de Natação.
  
  
  %%  O menino de 9 anos está em algum lugar à direita da barraca Verde.
  
  
  %%  A barraca Vermelha está em algum lugar à esquerda de quem gosta de Basquete.
  %%  O garoto da barraca Verde gosta de sanduíche de Atum.
  %%  Gabriel está ao lado do menino que gosta de sanduíche de Frango.
  %%  O menino de 10 anos está em algum lugar à direita da barraca Vermelha.
  %%  O garoto da equipe Rocket está exatamente à esquerda de Rui.%

%%    Quem gosta de Corrida está em algum lugar à direita da barraca Verde.
%%    O garoto da equipe Tupis está em uma das pontas.
%%    A barraca Amarela está em algum lugar à esquerda de Marco.
%%    O menino da equipe Dragão está ao lado de quem gosta de jogar Tênis.
 %%   O menino da equipe Dragão está em algum lugar entre a barraca Branca e o garoto que gosta de sanduíche de Salame, nessa ordem.
 %%   Quem gosta de sanduíche de Frango está em algum lugar à direita da barraca Verde.
 %%   A barraca Amarela está em algum lugar à esquerda do garoto de 12 anos.
 %%   O menino que gosta de Futebol está ao lado do menino da equipe Ciclanos.
 %%   A barraca Vermelha está em algum lugar entre quem gosta de sanduíche de Presunto e quem tem 12 anos.
 %%   O garoto da equipe Rocket está exatamente à esquerda de quem gosta de Futebol.

