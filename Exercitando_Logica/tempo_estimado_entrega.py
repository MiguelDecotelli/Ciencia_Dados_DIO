"""
DESAFIO
Imagine que você está criando um aplicativo de entrega de comida e precisa informar ao usuário o tempo estimado de entrega
de um restaurante. A mensagem deve conter o nome do restaurante e o tempo estimado de entrega em minutos.

ENTRADA:
A entrada deverá receber os valores abaixo:

nomeRestaurante (string): o nome do restaurante desejado.
tempoEstimadoEntrega (number): o tempo estimado de entrega em minutos.

SAÍDA:
Deverá retornar uma mensagem (string) informando ao usuário o tempo estimado de entrega do restaurante. 
Por exemplo, para o restaurante Bar do Zinho com o tempo estimado de entrega sendo 20, imprima:

O restaurante Bar do Zinho entrega em 20 minutos.

DESAFIO BÔNUS:
Utilize interpolação de strings para formatar sua saída ao invés da concatenação de strings tradicional.
"""

nomeRestaurante = input()
tempoEstimadoEntrega = int(input())

print(f"O restaurante {nomeRestaurante} entrega em {tempoEstimadoEntrega} minutos.")