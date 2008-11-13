require 'spec'

class EmprestimoSac
  attr_accessor :valor, :percentual_juro,
    :numero_parcelas, :parcela_corrente
  def initialize
    self.parcela_corrente = 0 
  end
  # percentual já usa com 
  def percentual_juro=(percentual)
    @percentual_juro = percentual / 100.0
  end
  def valor_da_parcela_amortizada
    valor / numero_parcelas
  end
  def saldo_devedor
    valor_da_parcela_amortizada * (numero_parcelas - parcela_corrente)
  end
  def juro_da_parcela
    valor_da_parcela_amortizada * percentual_juro * 
      (numero_parcelas - parcela_corrente + 1)
  end
end

Before do
  @emprestimo = EmprestimoSac.new
end

After do
end

Given /um empréstimo de (\d+) com (\d)% de juros ao mês em (\d) parcelas/ do |valor, percentual_juro, numero_parcelas|
  @emprestimo.valor = valor.to_f
  @emprestimo.percentual_juro = percentual_juro.to_f
  @emprestimo.numero_parcelas = numero_parcelas.to_i
end

When /eu calcular o (.*)/ do |qual_valor|
  @resultado = @emprestimo.send("#{qual_valor.tr(' ', '_')}")
end
When /^olhar a parcela (\d)$/ do |qual_parcela|
  @emprestimo.parcela_corrente = qual_parcela.to_i
end

Then /será de (\d*)/ do |amortizacao|
  @resultado.should be == amortizacao.to_f
end

