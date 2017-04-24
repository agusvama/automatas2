/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package introduccion;

/**
 *
 * @author maldad
 */
import java.io.*;

public class Main {
    public static void main(String args[]) {   
    String archivo_a_parsear = "/home/maldad/repos/automatas/sintactico/src/introduccion/test.txt";
    /* instanciar la clase parser,
        la cual recibe como argumentos lo que se vaya a parsear */
    try {
      parser p = new parser(new Lexer(new FileReader(archivo_a_parsear)));
      Object result = p.parse().value;      
    } catch (Exception e) {
      /* do cleanup here -- possibly rethrow e */
      e.printStackTrace();
    }
  }
}
