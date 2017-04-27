/* --------------------------Usercode Section------------------------ */
package arduino;
import java_cup.runtime.*;
      
%%

/* -----------------Options and Declarations Section----------------- */

%class Lexer
%line
%column
    
%cup
%{   
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

num = 0 | [1-9][0-9]*
LineTerminator = \r|\n|\r\n
   
/* White space is a line terminator, space, tab, or line feed. */
WhiteSpace     = {LineTerminator} | [ \t\f]
ids = [A-Za-z_][A-Za-z_0-9]*

%%
/* ------------------------Lexical Rules Section---------------------- */

<YYINITIAL> {

{WhiteSpace}       { /* ignore */ }   
"//".* {/* ignore */}
    
/* "+"|"-"|"*"|"/"|"%" {System.out.print(yytext()); return symbol(sym.OPERADOR_ARITMETICO);} */
    "+"                { System.out.print(" + "); return symbol(sym.MAS); }
    "-"                { System.out.print(" - "); return symbol(sym.MENOS); }
    "*"                { System.out.print(" * "); return symbol(sym.POR); }
    "/"                { System.out.print(" / "); return symbol(sym.ENTRE); }
    "("                { System.out.print(" ( "); return symbol(sym.PARENI); }
    ")"                { System.out.print(" ) "); return symbol(sym.PAREND); }
    "{"                { System.out.print(" { "); return symbol(sym.LLAVEI); }
    "}"                { System.out.print(" } "); return symbol(sym.LLAVED); }
    /*  condicion  */
    "if" {System.out.print(yytext()); return symbol(sym.IF);}
    /*  ciclos */
    "while" {System.out.print(yytext()); return symbol(sym.WHILE);}
    "do"    {System.out.print(yytext()); return symbol(sym.DO);}
    "for"   {System.out.print(yytext()); return symbol(sym.FOR);}
    
{num}      { System.out.print(yytext()); return symbol(sym.NUMBER); }
{ids}       { System.out.print(yytext()); return symbol(sym.ID);}   

";" {System.out.print(yytext()); return symbol(sym.PCOMA);}                      
}
[^]                    { throw new Error("Illegal character <"+yytext()+">"); }