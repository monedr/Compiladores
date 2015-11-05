LETRA	[a-zA-Z]
DIGITO	[0-9]
WHITESPACE [" "\r\t\n]
LineTerminator [\n\r]
LETRAOUDIGITO {LETRA}|{DIGITO}
DIGITOS ([+|-])?{DIGITO}+
FRACAO "."{DIGITOS}
EXPOENTE [eE]([+|-])?{DIGITOS}
SUBLINHADO "_"{LETRAOUDIGITO}+


INVALIDO {DIGITOS}{LETRA}+|({DIGITOS}"_"{LETRA}+)|("_"{LETRAOUDIGITO}+)|{DIGITOS}"_"{DIGITOS}

PALAVRARESERVADA	(for)|(System.out.println)|(int)|(float)|(double)|(extends)|(implements)|(boolean)|(while)|(true)|(false)|(this)|(new)|(do)|(lenght)|(new)|(class)|(public)|(static)|(String)|(void)|(if)|(else)|(elseif)|(return)|(private)|(protected)
OPERADORESBINARIOS	"&&"|"<"|"+"|"-"|"*"
ID {LETRA}{LETRAOUDIGITO}*{SUBLINHADO}*
NUM {DIGITOS}{FRACAO}?{EXPOENTE}?
SIMBOLOSIMPLES "/"|"="|">"|"["|"]"|"."|","|"("|")"|":"|"^"|"@"|"{"|"}"|"$"|"#"|"&"|"%"|";"
SIMBOLOCOMPOSTO "<<"|">>"|"**"|"<>"|"><"|"<="|">="|":="|"+="|"-="|"*="|"/="|"(*"|"*)"|"(."|".)"|".." 
COMENTARIO ({LETRAOUDIGITO}|{SIMBOLOCOMPOSTO}|{SIMBOLOSIMPLES}|{LineTerminator}|{WHITESPACE})*

%%
{WHITESPACE}
"/*"{COMENTARIO}"*/"	printf("Comentário Tipo 1-> %s\n", yytext);
"//"[^\n]*	printf("Comentario Tipo 2-> %s\n", yytext);
{PALAVRARESERVADA} printf("Palavra Reservada-> %s\n", yytext);
{ID} printf("Identificador-> %s\n", yytext);
{NUM} printf("Número-> %s\n", yytext);
{OPERADORESBINARIOS} printf("Operador-> %s\n", yytext);
{SIMBOLOCOMPOSTO} printf("Símbolo Composto-> %s\n", yytext);
{SIMBOLOSIMPLES}	printf("Símbolo simples-> %s\n", yytext);
{INVALIDO}	printf("Símbolo n reconhecido-> %s\n", yytext);


%%
int yywrap();

main(){
  yylex();
}

int yywrap(){
 return 1;
}
