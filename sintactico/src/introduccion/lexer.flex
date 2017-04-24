/* --------------------------Usercode Section------------------------ */
   
import java_cup.runtime.*;
      
%%
   
/* -----------------Options and Declarations Section----------------- */

%class Lexer

/*
  The current line number can be accessed with the variable yyline
  and the current column number with the variable yycolumn.
*/
%line
%column
    
/* 
   Will switch to a CUP compatibility mode to interface with a CUP
   generated parser.
*/
%cup
%{   
    /* To create a new java_cup.runtime.Symbol with information about
       the current token, the token will have no value in this
       case. */
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    
    /* Also creates a new java_cup.runtime.Symbol with information
       about the current token, but this object has a value. */
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

LineTerminator = \r|\n|\r\n
WhiteSpace     = {LineTerminator} | [ \t\f]
dec_int_lit = 0 | [1-9][0-9]*
dec_int_id = [A-Za-z_][A-Za-z_0-9]*

%%
/* ------------------------Lexical Rules Section---------------------- */
   /* YYINITIAL is the state at which the lexer begins scanning.  So
   these regular expressions will only be matched if the scanner is in
   the start state YYINITIAL. */
   
<YYINITIAL> {
   
    /* Return the token SEMI declared in the class sym that was found. */
    ";"                { return symbol(sym.SEMI); }
   
    /* Print the token found that was declared in the class sym and then
       return it. */
    "+"                { System.out.print(" + "); return symbol(sym.PLUS); }
    "-"                { System.out.print(" - "); return symbol(sym.MINUS); }
    "*"                { System.out.print(" * "); return symbol(sym.TIMES); }
    "/"                { System.out.print(" / "); return symbol(sym.DIVIDE); }
    "("                { System.out.print(" ( "); return symbol(sym.LPAREN); }
    ")"                { System.out.print(" ) "); return symbol(sym.RPAREN); }
   
    /* 
       Encontrar un entero, resulta en la transformación del mismo a entero y 
       a imprimirlo */
    {dec_int_lit}      { System.out.print(yytext());
                         return symbol(sym.NUMBER, new Integer(yytext())); }
   
    /* Lo mismo para el caso de los identificadores (nombres de variable) */
    {dec_int_id}       { System.out.print(yytext());
                         return symbol(sym.ID, new Integer(1));}
   
    /* Don't do anything if whitespace is found */
    {WhiteSpace}       { /* just skip what was found, do nothing */ }   
}

/* No token was found for the input so through an error.  Print out an
   Illegal character message with the illegal character that was found. */
[^]                    { throw new Error("Illegal character <"+yytext()+">"); }
