
package Analizador;

import java.io.File;

public class Generadora {
    
    public Generadora(){
        
    }//constructor
    
    public void generarLexer(String ruta){
        File file = new File(ruta);
        jflex.Main.generate(file);
    }//generarLexer
    
}//end class
