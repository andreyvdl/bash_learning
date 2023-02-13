#! /bin/bash

NAME="Variavel com conteudo"
echo $NAME

echo

# echo

echo "literalmente um echo de \"'tudo'\" que vc escreve, 1, 2, 3, 3.14"

echo

# printf

printf "similar ao print do C %s_%s: %d %.2f\n" "Hello" "world!" 42 3.1415

echo

# read

echo "Digite algo:"
read
echo "${REPLY}"
echo Denovo:
read VAR
echo "${VAR}"

echo

# operador aritmeticos
# a ponteciação é a unica que não funciona com expr

echo `expr 2 + 2`
echo $((21 * 2))
echo `expr 100 \* 10`
echo `expr 4 % 2`
echo $((16 ** 2))

echo

# condições
# existem "> < >= <= == != =~(regex)"
# também "-gt(>) -lt(<) -ge(>=) -le(<=) -eq(==) -ne(!=)"
# e "-d(dir) -e(existe) -z(vazio) -f(cheio) -o(usuario é dono) -r(chmod read) -w(chmod write) -x(chmod exec)"
# as condições podem ser baseadas em if e elif ou while

if (( 1 > 0 ))
then
	echo "Um e maior que zero"
fi

if [ 1 -eq 1 ]
then
	echo "Um e igual a um"
fi

echo "Digite um numero:"
read NUM
if [[ $NUM =~ ^[0-9]+$ ]]
then
	echo "O numero digitado foi $NUM"
else
	echo "O numero digitado nao e um numero"
fi

echo

# switch

echo "Escreva um numero de 1 a 3 por extenso:"
read NUM
case $NUM in
	um|Um|UM) echo "1" ;;
	dois|Dois|DOIS) echo "2" ;;
	tres|Tres|TRES) echo "3" ;;
	*) echo "Nao e um numero de 1 a 3" ;;
esac

echo

# while

VALOR=0
echo "WHILE"
while [ $VALOR -lt 5 ]
do
	echo $VALOR
	VALOR=$((VALOR + 1))
done

echo

# for
# for pode utilizar a sintaxe de "for ... in ..." ou a sintaxe do C

VAR=0
echo "FOR"
for VAR in 0 1 2 3
do
	echo $VAR
done
for (( i = 0; i < 4; i++ ))
do
	echo $i
done

echo

# until
# until é similar ao while, porém ele repete enquanto a condição for falsa

VAR=0
echo "UNTIL"
until [ $VAR -eq 3 ]
do
	echo $VAR
	VAR=$((VAR + 1))
done

echo

# select
# select permite selecionar uma opcao de uma lista
# nao funciona muito bem, entao evite usar

#echo "SELECT"
#select DRINK in tea cofee water juice appe all none
#do
# 	case DRINK in
# 		*) break ;;
# 	esac
# done

# "break" sai do loop
# "continue" vai pra proxima execucao do loop

# existem algumas variaveis especiais
# "$0..$n" acesa os argumentos passados, sendo "$0" o nome do script
# "$IFS" é o separador de campos, se "IFS=123" e temos uma variavel "var=abc1def" entao o echo ira ignorar o numero 1 e tratar ele como uma quebra de linha/fim da string
# "$@" imprime os argumentos passados
# "$*" igual ao "$@", porem os espacos viram aspas duplas
# "$#" numero de argumentos passados
# "$!" retorna o PID do ultimo programa executado
# "$$" retorna o PID do script atual
# "$?" retorno o codigo de saida do ultimo programa executado

# funcoes
# funcoes sao similares as funcoes em C

times_two() {
	echo $(( $1 * 2 ))
}

until [ $VAR -eq 6 ]
do
	times_two $VAR
	VAR=$((VAR + 1))
done

echo

# arrays
# arrays usam parenteses ao inves de chaves
# "unset" permite remover um item do array
# "#" permite obter o tamanho do array
# "@" imprime todos os valores do array
# ":" permite fazer slice

ARR=('H', 'e', 'l', 'l', 'o')

echo ${ARR[2]}
echo ${ARR[@]}
echo ${#ARR[@]}
unset ARR[2]
echo ${ARR[@]}
echo ${#ARR[@]}
ARR[4]='Z'
echo ${ARR[@]}
echo ${#ARR[@]}
echo ${ARR[@]:2:4}

echo

# debug
# pra debugar utilizamos "set -x" e "set +x", sendo "-" ativo e "+" desativo
# "-f" desabilita gerar arquivos com nomes com "*, !, etc"
# "-v" imprime o input do shell