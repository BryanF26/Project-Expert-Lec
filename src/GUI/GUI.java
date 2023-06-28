package GUI;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;

import jess.*;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Vector;


public class GUI extends JFrame {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	Integer option = 0;
    String solution = "";
    String solutionDescription = "";

    JPanel choicePanel = new JPanel(new GridLayout(4, 1));
    JPanel resultPanel = new JPanel(new GridLayout(4, 1));
    JPanel containerPanel = new JPanel(new GridLayout(2, 1));
    JLabel resultLabel = new JLabel("Anda cocok di jurusan :");
    JLabel resultSolution = new JLabel("TI");
    JLabel resultDescriptionLabel = new JLabel("Jurusan ini adalah...");
    JLabel resultReason = new JLabel("Apakah anda ingin melihat alasannya?");
    JRadioButton yesRadioButton = new JRadioButton("yes", true);
    JRadioButton noRadioButton = new JRadioButton("no");
    ButtonGroup choiceButtonGroup = new ButtonGroup();
    JButton nextButton = new JButton("Next");
    
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
                this.solution = results.getString("solution");
                this.solutionDescription = results.getString("description");


                data.add(new Vector<Object>());
                data.get(data.size() - 1).add(results.getString("reason"));
            }
            
            resultSolution.setText(this.solution);
            resultDescriptionLabel.setText(this.solutionDescription);


        } catch (Exception e) {
            e.printStackTrace();
        }

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

        choiceButtonGroup.add(yesRadioButton);
        choiceButtonGroup.add(noRadioButton);
        
        choicePanel.add(resultReason);
        choicePanel.add(yesRadioButton);
        choicePanel.add(noRadioButton);
        choicePanel.add(nextButton);
        
        nextButton.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				String input = yesRadioButton.isSelected() ? "yes" : "no";
				if(input.equals("no")) {
					dispose();
					return;					
				}
				
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
				JFrame jf2 = new JFrame();
				jf2.add(resultPanel);
				jf2.setSize(1000,1000);
				jf2.setVisible(true);
				jf2.setDefaultCloseOperation(EXIT_ON_CLOSE);
				dispose();
			}
		});
        containerPanel.add(resultPanel);
        containerPanel.add(choicePanel);
        
        add(containerPanel);
    }

    public void promptAnswers() {
    	
    }

    public GUI(Integer option) {
        this.option = option;
        setTitle("Aplikasi pemilihan keputusan jurusan");
        // set sizenya sesuai dengan isi komponen
        setSize(1000, 1000);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        promptAnswers();
        generateComponents();
        pack();
        
        setVisible(true);
    }

}
