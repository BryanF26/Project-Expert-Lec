package GUI;

import jess.*;

public class Main {

    public static Rete engine = null;

    public static void main(String[] args) {

        try {
            engine = new Rete();
            engine.batch("../main.clp");
        } catch (JessException e) {
            e.printStackTrace();
        }

        new GUI();
    }
}
