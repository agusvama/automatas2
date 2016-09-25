package Classes;
import java.util.Scanner;
import java.io.*;
import javax.swing.*;

public class Main {
    public static void loop()throws FileNotFoundException, IOException {
        String s = JOptionPane.showInputDialog("write something");
        //System.out.println(s);
        StringReader entrada = new StringReader(s);
        Scanlex scan = new Scanlex(entrada);
        System.out.println(scan.yylex());
    }
    public static void main(String [] args) throws FileNotFoundException, IOException {
        while(true)
            loop();
    }
}
