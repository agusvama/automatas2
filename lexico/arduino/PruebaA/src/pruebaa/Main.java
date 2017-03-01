/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pruebaa;

/**
 *
 * @author Mary
 */
import java.io.File;
import java.io.IOException;


public class Main {

    public static void main(String[] args) {
        // TODO code application logic here
       //String path="C:/Users/Mendoza/Documents/NetBeansProjects/PruebaA/src/pruebaa/Lexer.flex";
       String path="/home/maldad/repos/automatas/lexico/arduino/PruebaA/src/pruebaa/Lexer.flex";
       generarLexer(path);
        
    }

    public static void generarLexer(String path){
        File file=new File(path);
        jflex.Main.generate(file);
    }

    
    }



