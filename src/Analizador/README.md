Se hace uso de la libreria JFlex, disponible en:
http://jflex.de/download.html

Archivos esenciales:
rules.flex -> son las reglas léxicas
Tokens.java -> son los identificadores que retornaremos en caso de una palabra esté en nuestro lenguaje, es un enum de java
$ jflex rules.flex -> nos va generar un archivo Scanner.java
Scanner.java -> es el propio analizador léxico
Principal.java -> usamos este archivo para leer palabras desde un .txt y analizarlas mediante el Scanner.java
words.txt -> es el archivo con palabras a analizar

ORDEN DE COMPILADO:
1-$ jflex rules.flex
2-Tokens
3-Scanner
4-Principal

EJECUCION:
$ java Principal
