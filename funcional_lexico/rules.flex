package Classes;

import static Classes.Tokens.*;

%%  //define class
%public
%class Scanlex 
%type Tokens //define tokens to analyze
//define REGEX for match input strings
numero = 0 | [1-9][0-9]*
caracter = [a-z]
cadena = [a-z]+

%{
  //user code
%}

%% //define what to return
/* FORMAS */
{numero} {return NUMERO;}
"true" {return BOOLEANO;}
"false" {return BOOLEANO;}
"\\"+{caracter} {return CARACTER;}
":"+{cadena} {return CADENA;}
"nil" {return NULO;}


/* SIMBOLOS */
"+" {return SIMBOLO;}
"-" {return SIMBOLO;}
"*" {return SIMBOLO;}
"/" {return SIMBOLO;}
"#" {return SIMBOLO;}
"'" {return SIMBOLO;}
"(" {return SIMBOLO;}
")" {return SIMBOLO;}
"[" {return SIMBOLO;}
"]" {return SIMBOLO;}
"{" {return SIMBOLO;}
"}" {return SIMBOLO;}
":" {return SIMBOLO;}
"\\" {return SIMBOLO;}
"<" {return SIMBOLO;}
">" {return SIMBOLO;}
"<=" {return SIMBOLO;}
">=" {return SIMBOLO;}
"==" {return SIMBOLO;}

/* EXPRESIONES */
"if" {return EXPRESION;}
"let" {return EXPRESION;}
