package GUI;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;

import jess.*;

import java.awt.*;
import java.util.Vector;


public class GUI extends JFrame {

    String solution = "";
    String solutionDescription = "";

    JPanel resultPanel = new JPanel(new GridLayout(4, 1));
    JLabel resultLabel = new JLabel("Anda cocok di jurusan :");
    JLabel resultSolution = new JLabel("TI");
    JLabel resultDescriptionLabel = new JLabel("Jurusan ini adalah...");
    
    JTable reasonTable = new JTable();
    JScrollPane reasonPane = new JScrollPane(reasonTable);

    Vector<Vector<Object>> data = new Vector<Vector<Object>>();
    Vector<String> columns = new Vector<String>();

    public void fetchDataFromExpertSystem() {
        this.solution = "";
        this.solutionDescription = "";

        try {
            QueryResult results = Main.engine.runQueryStar("get-solution", new ValueVector());

            while (results.next()) {
                System.out.println("debug" + results.getString("text"));
                this.solution = results.getString("text");
                this.solutionDescription = results.getString("desc");
            }
            
            resultSolution.setText(this.solution);
            resultDescriptionLabel.setText(this.solutionDescription);

            // QueryResult reasons = Main.engine.runQueryStar("get-reasons", new ValueVector());
            
            // while (reasons.next()) {
            //     data.add(new Vector<Object>());
            //     data.get(data.size() - 1).add(reasons.getString("reason"));
            // }

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Contoh data dummy

        // data.add(new Vector<Object>());
        // data.get(0).add("Alasan 1");
        // data.add(new Vector<Object>());
        // data.get(1).add("Alasan 2");
        // data.add(new Vector<Object>());
        // data.get(2).add("Alasan 3");
        // data.add(new Vector<Object>());
        // data.get(3).add("Alasan 4");
        
    }
    
    public void generateComponents() {

        resultLabel.setHorizontalAlignment(JLabel.CENTER);
        resultLabel.setFont(resultLabel.getFont().deriveFont(12.0f));
        
        resultSolution.setHorizontalAlignment(JLabel.CENTER);
        resultSolution.setFont(resultSolution.getFont().deriveFont(20.0f));
        
        resultDescriptionLabel.setHorizontalAlignment(JLabel.CENTER);
        resultDescriptionLabel.setFont(resultDescriptionLabel.getFont().deriveFont(15.0f));
        
        fetchDataFromExpertSystem();
        
        resultPanel.add(resultLabel);
        resultPanel.add(resultSolution);
        resultPanel.add(resultDescriptionLabel);

        if (data.size() <= 0 ) {
            data.add(new Vector<Object>());
            data.get(0).add("Tidak ada alasan yang mendukung");
            resultPanel.add(new JLabel("Tidak ada alasan yang mendukung"));
        } else {
            columns.add("Alasan-alasan yang mendukung");
            reasonPane.setPreferredSize(new Dimension(400, 200));
            reasonTable.setModel(new DefaultTableModel(data, columns));
            reasonTable.setEnabled(false);
            resultPanel.add(reasonPane);
        }

        add(resultPanel);
    }


    public GUI() {
        setTitle("Aplikasi pemilihan keputusan jurusan");
        // set sizenya sesuai dengan isi komponen
        setSize(700, 500);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        generateComponents();
        pack();
        
        setVisible(true);
    }

}
