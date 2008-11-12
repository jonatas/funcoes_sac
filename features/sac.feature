Funcionalidade: Encontrar o valor da amortização e dos juros
  em um empréstimo usando sistema de amortização constante

  Cenário: Encontrar o valor da Amortização
		Dado um empréstimo de 24000 com 2% de juros ao mês em 8 parcelas
		Quando eu calcular o valor da parcela amortizada
		Então será de 3000
    Quando eu calcular o saldo devedor
    Então será de 24000
    Quando olhar a parcela 1 
    Quando eu calcular o saldo devedor
    Então será de 21000
    Quando eu calcular o juro da parcela
    Então será de 480 
    Quando olhar a parcela 4
    Quando eu calcular o juro da parcela
    Então será de 300
    Quando olhar a parcela 5
    Quando eu calcular o juro da parcela
    Então será de 240
    Quando eu calcular o saldo devedor
    Então será de 9000 

