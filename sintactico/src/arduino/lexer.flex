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

D=[0-9]
WHITE=[\t\r\n]

%%
/* ------------------------Lexical Rules Section---------------------- */

{WHITE}       { /* ignore */ }   
"//".* {/* ignore */}
    
"+"|"-"|"*"|"/"|"%" {System.out.print(yytext()); return symbol(sym.OPERADOR_ARITMETICO);}
    
{D}      { System.out.print(yytext());
    return symbol(sym.NUMBER, new Integer(yytext())); }   

";" {System.out.println(yytext()); return symbol(sym.PCOMA);}                      

[^]                    { throw new Error("Illegal character <"+yytext()+">"); }