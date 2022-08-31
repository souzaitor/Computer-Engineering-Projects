% Base de Dados %

investimento(categoria_1):-perfil(conservador), valor_investido(baixo). %1
investimento(categoria_1):-perfil(conservador), valor_investido(medio), periodo_aplicado(curto). %2
investimento(categoria_2):-perfil(conservador), valor_investido(medio), periodo_aplicado(longo). %3
investimento(categoria_2):-perfil(conservador), valor_investido(medio), situacao_financeira(adequada). %4
investimento(categoria_2):-perfil(conservador), situacao_financeira(inadequada). %5
investimento(categoria_2):-perfil(moderado), situacao_financeira(inadequada). %6
investimento(categoria_3):-perfil(moderado), valor_investido(medio), periodo_aplicado(mediano), situacao_financeira(adequada). %7
investimento(categoria_3):-perfil(moderado), valor_investido(alto), periodo_aplicado(mediano), situacao_financeira(adequada). %8
investimento(categoria_4):-perfil(moderado), valor_investido(medio), periodo_aplicado(longo), situacao_financeira(adequada). %9
investimento(categoria_4):-perfil(moderado), valor_investido(alto), periodo_aplicado(longo), situacao_financeira(adequada). %10
investimento(categoria_5):-perfil(agressivo), periodo_aplicado(longo), situacao_financeira(adequada), conhecimento_mercado(pouco). %11
investimento(categoria_6):-perfil(agressivo), valor_investido(alto), situacao_financeira(adequada), conhecimento_mercado(muito). %12
perfil(conservador):-objetivo(preservar), tolerancia_risco(baixa). %13
perfil(moderado):-objetivo(acumular), tolerancia_risco(media). %14
perfil(moderado):-objetivo(acumular), tolerancia_risco(alta). %15
perfil(moderado):-objetivo(especular), tolerancia_risco(media). %16
perfil(agressivo):-objetivo(especular), tolerancia_risco(alta). %17
valor_investido(baixo):-valor(X), entre(X, 0, 30.000). %18
valor_investido(medio):-valor(X), entre(X, 30.000, 100.000). %19
valor_investido(alto):-valor(X), maior(X, 100.000). %20
periodo_aplicado(curto):-periodo(X), menor_ou_igual(X, 12). %21
periodo_aplicado(mediano):-periodo(X), entre(X, 13, 36). %22
periodo_aplicado(longo):-periodo(X), maior(X, 36). %23
situacao_financeira(inadequada):-ganhos(X,instavel), menor_ou_igual(X, 36.000). %24
situacao_financeira(adequada):-ganhos(X,estavel), maior(X, 50.000). %25

% Predicados Auxiliares %

maior(X,Y):- X @> Y.
menor_ou_igual(X,Y) :- X @=< Y.
entre(X, Y, Z):- X @>= Y, X @=< Z.

% Situações iniciais específicas são definidas pelas sentenças a seguir %

% Situação 1
% objetivo(preservar).
% tolerancia_risco(baixa).
% valor(40.000).
% periodo(7).
% ganhos(13.000, instavel).
% conhecimento_mercado(pouco).

% Situação 2
% objetivo(acumular).
% tolerancia_risco(alta).
% valor(35.000).
% periodo(20).
% ganhos(55.000, estavel).
% conhecimento_mercado(pouco).

% Situação 3
% objetivo(especular).
% tolerancia_risco(alta).
% valor(200.000).
% periodo(5).
% ganhos(90.000, estavel).
% conhecimento_mercado(muito).

% Situação 4
% objetivo(especular).
% tolerancia_risco(alta).
% valor(20.000).
% periodo(50).
% ganhos(90.000, estavel).
% conhecimento_mercado(pouco).

% Situação 5
% objetivo(especular).
% tolerancia_risco(media).
% valor(50.000).
% periodo(80).
% ganhos(60.000, estavel).
% conhecimento_mercado(pouco).
