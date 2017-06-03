package ejemploa;

import java.io.*;
   
public class Main {
  static public void main(String argv[]) {    
    /* Start the parser */
    String archivo_a_parsear = "/home/maldad/repos/automatas/semantico/EjemploA/src/ejemploa/test.txt";
    try {
      parser p = new parser(new Lexer(new FileReader(archivo_a_parsear)));
      Object result = p.parse().value;      
    } catch (Exception e) {
      /* do cleanup here -- possibly rethrow e */
      e.printStackTrace();
    }
  }
}
