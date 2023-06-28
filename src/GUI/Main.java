package GUI;

import jess.*;

public class Main {

    public static Rete engine = null;

    public static void main(String[] args) {
        Integer input = 0;
        try {
            engine = new Rete();
            System.out.println("Aplikasi pemilihan keputusan jurusan");
            engine.batch("../backward.clp");

        } catch (JessException e) {
            e.printStackTrace();
        }

        new GUI(input);
    }
}
