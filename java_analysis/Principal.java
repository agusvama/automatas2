
package Analizador;

import java.awt.HeadlessException;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.StringReader;
import java.util.LinkedList;

public class Principal {
    //CAMBIAR ESTAS RUTAS POR DONDE ESTE SU .flex y .txt CON PALABRAS A ANALIZAR
    /*
    static String rutaFlex = "/home/maldad/NetBeansProjects/Analizador/src/Analizador/lexer.flex";
    static String rutaArchivo = "/home/maldad/NetBeansProjects/Analizador/src/Analizador/javaWords.txt";
    //objeto para generar la clase analizadora
    static Generadora g = new Generadora();
    */
    //lista ligada donde se almacenan las palabras
    static LinkedList<String> lista = new LinkedList<>();
    static String rutaArchivo = "/home/maldad/Documents/tec/9no/automatas2/projects/java_analysis/javaWords.txt";
    static Analizador ana;
    //"/home/maldad/Docu/Analizador/src/Analizador/javaWords.txt";
    public static void archivoToLista(String rutaArchivo) throws FileNotFoundException, IOException {
        String cadena;
        FileReader fr = new FileReader(rutaArchivo);
        BufferedReader br = new BufferedReader(fr);
        
        while((cadena = br.readLine())!=null) {
            lista.add(cadena);
        }//while
        br.close();
    }//archivoToLista
    
    public static void analizarLista(){
        //cadena auxiliar para leer cada elemento de la lista
        String s = "";
        while(lista.isEmpty() == false){
            try{
               s = lista.poll();
               ana = new Analizador(new StringReader(s));
               //imprimimos cadena
               System.out.print(s+" - ");
               //analizamos cadena con el Jflex
               System.out.println(ana.yylex());
               ana = null;
            }//try
            catch(java.lang.Error | HeadlessException | IOException e){
            System.out.println("Error lexico");
            }//catch
        }//while
    }//analizarLista
    
    public static void main(String [] args) throws FileNotFoundException, IOException{
        //g.generarLexer(rutaFlex);
        //vaciarArreglo();
        archivoToLista(rutaArchivo);
        analizarLista();
        System.out.println("Hola mundo");
        System.out.println("Hola mundo");
        System.out.println("Hola mundo");
        System.out.println("Hola mundo");
        System.out.println("Hola mundo");
    }//main
    
}//Principal
