package GUI;

import jess.*;
import java.util.*;

public class Main {

    public static Rete engine = null;

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        Integer input = 0;
        try {
            engine = new Rete();

            do {
                System.out.println("Engine apa yang ingin anda coba gunakan?");
                System.out.println("1. Forward chaining");
                System.out.println("2. Backward chaining (Anda dapat melihat alasan dari setiap pertanyaan))");
                System.out.println("Masukkan angka 1 atau 2 : ");
                input = in.nextInt();
            } while (input != 1 && input != 2);

            if (input == 1) 
                engine.batch("../forward.clp");
            if (input == 2)
                engine.batch("../backward.clp");
            
            in.close();

        } catch (JessException e) {
            e.printStackTrace();
        }

        new GUI(input);
    }
}
