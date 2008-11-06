require 'spec'

class EmprestimoSac
  attr_accessor :valor, :percentual_juro, :numero_parcelas
  def valor_amortizacao
    valor / numero_parcelas
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

When 'eu calcular o valor da parcela amortizada' do
  @valor_amortizacao = @emprestimo.valor_amortizacao
end

Then /será de (\d*)/ do |amortizacao|
  @emprestimo.valor_amortizacao == amortizacao.to_f
end
