package Analizador;

import static Analizador.Tokens.*;

%%

%class Analizador
%type Tokens
j = java.
jx = javax.
espacio = [ ]
libreria = [util. lang. io. awt. math.]
todo = [*]
puntocoma = [;]
tipoDato = [int, float, boolean, char, void]
alcanze = [public, private, protected]
nombre = [a-z, A-Z]
operador = [-, +, *, /]
comparador = [==, <, >, <=, >=, !=]

%{
  public String nombreMetodo;
%}

%%
"import"+{espacio}+{j}+{libreria}+{todo}+{puntocoma} {return IMPORTAR_PAQUETE;}
"import"+{espacio}+{jx}+"swing."+{todo}+{puntocoma} {return IMPORTAR_COMPONENTE_SWING;}
{alcanze}+{espacio}+{tipoDato}+{espacio}+{nombre}+"(){}" {return DECLARACION_METODO;}
{alcanze}+{espacio}+"class"+{espacio}+{nombre}+"{}" {return DECLARACION_CLASE;}

"int" {return TIPO_DATO;}
"float" {return TIPO_DATO;}
"void" {return TIPO_DATO;}
"boolean" {return TIPO_DATO;}
"char" {return TIPO_DATO;}
"long" {return TIPO_DATO;}
"byte" {return TIPO_DATO;}
"double" {return TIPO_DATO;}

"String" {return CLASE_CADENA_CARACTERES;}

"static" {return PALABRA_RESERVADA;}
"abstract" {return PALABRA_RESERVADA;}
"new" {return PALABRA_RESERVADA;}
"assert" {return PALABRA_RESERVADA;}
"default" {return PALABRA_RESERVADA;}
"goto" {return PALABRA_RESERVADA;}
"package" {return PALABRA_RESERVADA;}
"synchronized" {return PALABRA_RESERVADA;}

"this" {return PALABRA_RESERVADA;}
"implements" {return PALABRA_RESERVADA;}

"throw" {return PALABRA_RESERVADA;}

"throws" {return PALABRA_RESERVADA;}
"case" {return PALABRA_RESERVADA;}
"enum" {return PALABRA_RESERVADA;}
"instanceof" {return PALABRA_RESERVADA;}
"transient" {return PALABRA_RESERVADA;}
"catch" {return PALABRA_RESERVADA;}
"extends" {return PALABRA_RESERVADA;}
"try" {return PALABRA_RESERVADA;}
"final" {return PALABRA_RESERVADA;}
"interface" {return PALABRA_RESERVADA;}
"static" {return PALABRA_RESERVADA;}
"class" {return PALABRA_RESERVADA;}
"finally" {return PALABRA_RESERVADA;}
"super" {return PALABRA_RESERVADA;}

"true" {return CONSTANTE_BOOLEANA;}
"false" {return CONSTANTE_BOOLEANA;}
"||" {return COMPARADOR_OR;}
"&&" {return COMPARADOR_AND;}

"if" {return ESTRUCTURA_CONTROL;}
"else" {return ESTRUCTURA_CONTROL;}
"while" {return ESTRUCTURA_CONTROL;}
"do" {return ESTRUCTURA_CONTROL;}
"for" {return ESTRUCTURA_CONTROL;}
"break" {return ESTRUCTURA_CONTROL;}
"continue" {return ESTRUCTURA_CONTROL;}
"switch" {return ESTRUCTURA_CONTROL;}
"return" {return ESTRUCTURA_CONTROL;}

{operador} {return OPERADOR;}
{comparador} {return COMPARADOR;}

"Object" {return SUPERCLASE;}

{nombre}+"();" {return LLAMADA_METODO;}
"Object."{nombre}+"();" {return LLAMADA_METODO;} 

"//" {return ESCAPE_COMENTARIO;}

"while("+{nombre}+{comparador}+{nombre}+")" {return ESTRUCTURA_WHILE;}
"for("+{nombre}+{espacio}+{nombre}+":"+{nombre}+"){}" {return FOR_MEJORADO;}