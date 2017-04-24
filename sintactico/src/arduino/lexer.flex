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

L=[a-z]
D=[0-9]
X=[A-Z_]
e=[HIGH, LOW, INPUT, OUTPUT]
es=[ ]
WHITE=[ \t\r\n]

%%
/* ------------------------Lexical Rules Section---------------------- */

/* {WHITE} {/* ignore */} */
/* "//".* {/* ignore */} */
/* "void setup()"|"void loop()" { return ESTRUCTURA_INICIO_EJECUCION;} */

<YYINITIAL> {
    /* "+"                { System.out.print(yytext()); return symbol(sym.PLUS); } */
    {WHITE}       { /* ignore */ }   
    "//".* {/* ignore */}
    "+"|"-"|"*"|"/"|"%" {System.out.print(yytext()); return symbol(sym.OPERADOR_ARITMETICO);}
    
    {D}      { System.out.print(yytext());
                         return symbol(sym.NUMBER, new Integer(yytext())); }
}

[^]                    { throw new Error("Illegal character <"+yytext()+">"); }