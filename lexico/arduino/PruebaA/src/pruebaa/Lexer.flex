package pruebaa;
import static pruebaa.Token.*;
%%
%class Lexer
%type Token
L=[a-z]
D=[0-9]
X=[A-Z_]
e=[HIGH, LOW, INPUT, OUTPUT]
es=[ ]
WHITE=[ \t\r\n]
%{
public String lexeme;
public int x;
%}
%%
{WHITE} {/* ignore */}
"//".* {/* ignore */}
"void setup()"|"void loop()" { return ESTRUCTURA_INICIO_EJECUCION;} 
"#define"|"#include" { return LIBRERIA;}
"+"|"-"|"*"|"/"|"%" {return OPERADOR_ARITMETICO;}
"=" { return OPERADOR_ASIGNACION;}
"=="|"!="|"<"|">"|">="|"<=" { return OPERADOR_COMPARACION;}
"&&"|"||"|"!" { return OPERADOR_BOOLEANO;}
"++" { return OPERADOR_INCREMENTO;}
"--" { return OPERADOR_DECREMENTO;}
"+="|"-="|"*="|"/="|"&="|"|=" { return OPERADOR_COMPUESTO;}
"&"|"^"|"<<"|">>"|"|"|"~" { return OPERADOR_BIT;}
"if"|"else"|"switch"|"case"|"for"|"while"|"do"|"break"|"continue"|"return"|"goto" { return ESTRUCTURAS_DE_CONTROL;}
"HIGH"|"LOW"|"INPUT"|"OUTPUT" { return CONSTANTE;}
"false"|"true" { return BOOLEANO;}
"void"|"boolean"|"char"|"unsigned char"|"byte"|"int"|"unsigned int"|"word"|"long"|"unsigned long"|"float"|"double"|"string"|"array" { return TIPO_DE_DATO;}
"static"|"volatile"|"const"|"PROGMEM" { return CALIFICADOR;}
":"|";"|"."|"," { return DELIMITADOR;}
"{" { return PRINCIPIO_FUNCION;}
"}" { return FINAL_FUNCION;}
"unsigned long millis()"|"unsigned long micros()"|"delay"\({D}+\) { return FUNCION_TIEMPO;}
"delayMicroseconds"\({D}+\) {return FUNCION_TIEMPO;}
{L}+({X}|{L})*\(\)  {lexeme=yytext();return METODO;}
{L}*|{L}+{X}({L}|{D})* {lexeme=yytext(); return IDENTIFICADOR;}
{D}+ {lexeme=yytext();return INT;}
"pinMode("+{L}+({X}|{L}|{D})*+","{es}*{e}+")" { return FUNCION_ES_DIGITAL;}
"pinMode("+{D}+({X}|{L}|{D})*+","{es}*{e}+")" {return FUNCION_ES_DIGITAL;}
"digitalWrite("+{L}+({X}|{L}|{D})*+","{es}*{e}+")" { return FUNCION_ES_DIGITAL;}
"digitalWrite("+{D}+({X}|{L}|{D})*+","{es}*{e}+")" { return FUNCION_ES_DIGITAL;}
"digitalread("+{L}+({X}|{L}|{D})*+")" { return FUNCION_ES_DIGITAL;}
"analogRead("+{L}+({X}|{L}|{D})*+")" { return FUNCION_ES_ANALOGICA;}
"analogWrite("+{L}+({X}|{L}|{D})*","{es}*{e}+")" { return FUNCION_ES_ANALOGICA;}
{es}*+"("|")"+{es}* {return PARENTESIS;}
. {lexeme=yytext(); return ERROR_LEXICO;}



