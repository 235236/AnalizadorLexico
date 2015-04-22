import java.util.ArrayList;
import java.util.List;
import java.io.FileReader;
%%
%public
%class Lexer
%standalone

%{
	private List<String> tokens = new ArrayList<>();
%}

%{
	public List<String> analizar(String archivo) {
		FileReader in = null;
		try{
                    in = new FileReader(archivo);
                    Lexer lexer = new Lexer(in);
                    while(!lexer.zzAtEOF) {
                        lexer.yylex();
                    }
                }catch (Exception ex) {
                    System.out.println("Error al analizar el archivo.");
                }finally{
                    try {
                        in.close();
                    }catch(Exception ex) {
                        System.out.println("Error al cerrar el archivo.");
                    }
                }
            return tokens;
        }
%}

%%

">"      {tokens.add(">"); System.out.println("PARENTESIS ANGULAR DERECHO");}
"<"      {tokens.add("<"); System.out.println("PARENTESIS ANGULAR IZQUIERDO");}
"=="     {tokens.add("=="); System.out.println("DOBLE IGUAL");}
"%%"     {tokens.add("%%"); System.out.println("DOBLE PORCENTAJE");}
[(_)(A-Za-za-z0-9)] {tokens.add("a0"); System.out.println("IDENTIFICADOR");}
[0-9]    {tokens.add("0"); System.out.println("NUMERO");}