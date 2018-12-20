/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tokyo;

import java.awt.Color;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.ImageIcon;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Orlandi
 */
public class Modality extends javax.swing.JFrame {

    private JTable tableEsporte = new javax.swing.JTable();
    private JTable tableModalidade = new javax.swing.JTable();
    
    /**
     * Creates new form Modality
     */
    public Modality() {
        initComponents();
        this.setTitle("Tokyo++ - Modality");
        this.setIconImage(new ImageIcon(getClass()
                .getResource("/img/japan.png"))
                .getImage()); 
        this.setLocationRelativeTo(null);
        
        labelSuccess.setVisible(false);
        
        selectModalidade();
        selectEsporte();
    }
    
    private void selectEsporte() {
        paneEsporte.setViewportView(tableEsporte);
        tableEsporte.setModel(new javax.swing.table.DefaultTableModel(
                new Object[][]{},
                new String[]{
                    "Sport name", "Unit"
                }
        ) {
            Class[] types = new Class[]{
                java.lang.String.class, java.lang.String.class
            };
            boolean[] canEdit = new boolean[]{
                false, false
            };
        });
        
        try {
            ResultSet resultSet = DatabaseConnection
                    .getInstance()
                    .select(scriptSelectEsporte());
                    
            DefaultTableModel model = (DefaultTableModel) tableEsporte.getModel();
            
            while (resultSet.next()) {
                model.addRow(new Object[]{
                    resultSet.getString("nomeEsporte"),
                    resultSet.getString("unidade")});
            }
        } catch(SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }
    
    private void selectModalidade() {
        paneModalidade.setViewportView(tableModalidade);
        tableModalidade.setModel(new javax.swing.table.DefaultTableModel(
                new Object[][]{},
                new String[]{
                    "Modality",
                    "Maximum athlete number",
                    "Category",
                    "Sport"
                }
        ) {
            Class[] types = new Class[]{
                java.lang.String.class, java.lang.String.class
            };
            boolean[] canEdit = new boolean[]{
                false, false, false, false
            };
        });
        
        try {
            ResultSet resultSet = DatabaseConnection
                    .getInstance()
                    .select(scriptSelectModalidade());
                    
            DefaultTableModel model = (DefaultTableModel) tableModalidade.getModel();
            
            while (resultSet.next()) {
                model.addRow(new Object[]{
                    resultSet.getString("nomeModalidade"),
                    resultSet.getString("numeroMaximoAtletas"),
                    resultSet.getString("categoria"),
                    resultSet.getString("nomeEsporte")});
            }
        } catch(SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }
    
    private void insertModalidade() {
        try {
            String nomeModalidade = textFieldNome.getText();
            String numeroMaximoAtletas = textFieldMax.getText();
            String categoria = comboCategoria.getSelectedItem().toString();
            String nomeEsporte = (String) tableEsporte.getModel()
                    .getValueAt(tableEsporte.getSelectedRow(), 0);
            
            if(nomeModalidade.isEmpty() || numeroMaximoAtletas.isEmpty()) {
                labelSuccess.setText("Insert a name and maximum number of athletes");
                labelSuccess.setForeground(Color.ORANGE);
                labelSuccess.setVisible(true);
                
                return;
            }
            
            DatabaseConnection
                    .getInstance()
                    .insertUpdateDelete(scriptInsertModalidade(
                            nomeModalidade,
                            numeroMaximoAtletas,
                            categoria,
                            nomeEsporte));
            
            labelSuccess.setText("Modality inserted");
            labelSuccess.setForeground(Color.BLUE);
            labelSuccess.setVisible(true);
        } catch(SQLException ex) {
            System.err.println(ex.getMessage());
            labelSuccess.setText("Fail: " + ex.getMessage());
            labelSuccess.setForeground(Color.RED);
            labelSuccess.setVisible(true);
        } catch(ArrayIndexOutOfBoundsException ex) {
            labelSuccess.setText("Select a row in sport");
            labelSuccess.setForeground(Color.ORANGE);
            labelSuccess.setVisible(true);
        }
    }
    
    private void updateModalidade() {
        try {
            String nomeModalidade = textFieldNome.getText();
            String numeroMaximoAtletas = textFieldMax.getText();
            String categoria = comboCategoria.getSelectedItem().toString();
            String nomeEsporte = (String) tableEsporte.getModel()
                    .getValueAt(tableEsporte.getSelectedRow(), 0);
            
            if(nomeModalidade.isEmpty() || numeroMaximoAtletas.isEmpty()) {
                labelSuccess.setText("Insert a name and maximum number of athletes");
                labelSuccess.setForeground(Color.ORANGE);
                labelSuccess.setVisible(true);
                
                return;
            }
            
            DatabaseConnection
                    .getInstance()
                    .insertUpdateDelete(scriptUpdateModalidade(
                            nomeModalidade,
                            numeroMaximoAtletas,
                            categoria,
                            nomeEsporte));
            
            labelSuccess.setText("Modality updated");
            labelSuccess.setForeground(Color.BLUE);
            labelSuccess.setVisible(true);
        } catch(SQLException ex) {
            System.err.println(ex.getMessage());
            labelSuccess.setText("Fail: " + ex.getMessage());
            labelSuccess.setForeground(Color.RED);
            labelSuccess.setVisible(true);
        } catch(ArrayIndexOutOfBoundsException ex) {
            labelSuccess.setText("Select a row in sport table");
            labelSuccess.setForeground(Color.ORANGE);
            labelSuccess.setVisible(true);
        }
    }
    
    private void deleteModalidade() {
        try {
            String nomeModalidade = (String) tableModalidade.getModel()
                    .getValueAt(tableModalidade.getSelectedRow(), 0);
            String nomeEsporte = (String) tableModalidade.getModel()
                    .getValueAt(tableModalidade.getSelectedRow(), 3);
            
            DatabaseConnection
                    .getInstance()
                    .insertUpdateDelete(scriptDeleteModalidade(
                            nomeModalidade,
                            nomeEsporte));
            
            labelSuccess.setText("Modality deleted");
            labelSuccess.setForeground(Color.BLUE);
            labelSuccess.setVisible(true);
        } catch(SQLException ex) {
            System.err.println(ex.getMessage());
            labelSuccess.setText("Fail: " + ex.getMessage());
            labelSuccess.setForeground(Color.RED);
            labelSuccess.setVisible(true);
        } catch(ArrayIndexOutOfBoundsException ex) {
            labelSuccess.setText("Select a row in modality table");
            labelSuccess.setForeground(Color.ORANGE);
            labelSuccess.setVisible(true);
        }
    }
    
    private String scriptSelectEsporte() {
        return "select * "
                + "from esporte";
    }
    
    private String scriptSelectModalidade() {
        return "select * "
                + "from modalidade";
    }
    
    private String scriptInsertModalidade(String nomeModalidade,
            String numeroMaximoAtletas, String categoria, String nomeEsporte) {
        
        return "insert into modalidade "
                + "(nomeModalidade, numeroMaximoAtletas, categoria, nomeEsporte) "
                + "values "
                + "('" + nomeModalidade + "', "
                + numeroMaximoAtletas + ", "
                + "'" + categoria + "', "
                + "'" + nomeEsporte + "')";
    }

    private String scriptUpdateModalidade(String nomeModalidade,
            String numeroMaximoAtletas, String categoria, String nomeEsporte) {
        
        return "update modalidade "
                + "set numeroMaximoAtletas = " + numeroMaximoAtletas + ", "
                + "categoria = '" + categoria + "', "
                + "nomeEsporte = '" + nomeEsporte + "' "
                + "where nomeModalidade = '" + nomeModalidade + "'";
    }

    private String scriptDeleteModalidade(String nomeModalidade,
            String nomeEsporte) {
        
        return "delete from modalidade "
                + "where nomeModalidade = '" + nomeModalidade + "' and "
                + "nomeEsporte = '" + nomeEsporte + "'";
    }
    
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        labelSuccess = new javax.swing.JLabel();
        buttonRemover = new javax.swing.JButton();
        buttonInserir = new javax.swing.JButton();
        buttonAtualizar = new javax.swing.JButton();
        paneModalidade = new javax.swing.JScrollPane();
        jPanel = new javax.swing.JPanel();
        labelNome = new javax.swing.JLabel();
        textFieldNome = new javax.swing.JTextField();
        labelNumMax = new javax.swing.JLabel();
        labelCategoria = new javax.swing.JLabel();
        labelEsporte = new javax.swing.JLabel();
        textFieldMax = new javax.swing.JTextField();
        paneEsporte = new javax.swing.JScrollPane();
        comboCategoria = new javax.swing.JComboBox<>();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        labelSuccess.setFont(new java.awt.Font("Source Sans Pro Semibold", 0, 14)); // NOI18N
        labelSuccess.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        labelSuccess.setText("label ");
        labelSuccess.setToolTipText("");

        buttonRemover.setFont(new java.awt.Font("Source Sans Pro Semibold", 0, 18)); // NOI18N
        buttonRemover.setText("Remove");
        buttonRemover.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                buttonRemoverActionPerformed(evt);
            }
        });

        buttonInserir.setFont(new java.awt.Font("Source Sans Pro Semibold", 0, 18)); // NOI18N
        buttonInserir.setText("Insert");
        buttonInserir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                buttonInserirActionPerformed(evt);
            }
        });

        buttonAtualizar.setFont(new java.awt.Font("Source Sans Pro Semibold", 0, 18)); // NOI18N
        buttonAtualizar.setText("Update");
        buttonAtualizar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                buttonAtualizarActionPerformed(evt);
            }
        });

        paneModalidade.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mousePressed(java.awt.event.MouseEvent evt) {
                paneModalidadeMousePressed(evt);
            }
        });

        jPanel.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mousePressed(java.awt.event.MouseEvent evt) {
                jPanelMousePressed(evt);
            }
        });

        javax.swing.GroupLayout jPanelLayout = new javax.swing.GroupLayout(jPanel);
        jPanel.setLayout(jPanelLayout);
        jPanelLayout.setHorizontalGroup(
            jPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 463, Short.MAX_VALUE)
        );
        jPanelLayout.setVerticalGroup(
            jPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 345, Short.MAX_VALUE)
        );

        paneModalidade.setViewportView(jPanel);

        labelNome.setFont(new java.awt.Font("Source Sans Pro Semibold", 0, 14)); // NOI18N
        labelNome.setText("Modality Name");

        textFieldNome.setFont(new java.awt.Font("Source Sans Pro Semibold", 0, 14)); // NOI18N
        textFieldNome.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                textFieldNomeActionPerformed(evt);
            }
        });

        labelNumMax.setFont(new java.awt.Font("Source Sans Pro Semibold", 0, 14)); // NOI18N
        labelNumMax.setText("Maximum number of Athletes:");

        labelCategoria.setFont(new java.awt.Font("Source Sans Pro Semibold", 0, 14)); // NOI18N
        labelCategoria.setText("Category:");

        labelEsporte.setFont(new java.awt.Font("Source Sans Pro Semibold", 0, 14)); // NOI18N
        labelEsporte.setText("Sport:");

        textFieldMax.setFont(new java.awt.Font("Source Sans Pro Semibold", 0, 14)); // NOI18N
        textFieldMax.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                textFieldMaxActionPerformed(evt);
            }
        });

        paneEsporte.setFont(new java.awt.Font("Source Sans Pro Semibold", 0, 14)); // NOI18N

        comboCategoria.setFont(new java.awt.Font("Source Sans Pro Semibold", 0, 14)); // NOI18N
        comboCategoria.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "masculino", "feminino", "misto" }));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(paneModalidade, javax.swing.GroupLayout.PREFERRED_SIZE, 330, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addComponent(labelNome, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(labelEsporte, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(labelCategoria, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(labelNumMax, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(comboCategoria, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 121, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(textFieldMax, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(paneEsporte, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(textFieldNome, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 345, Short.MAX_VALUE)))
                    .addComponent(labelSuccess, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(buttonRemover, javax.swing.GroupLayout.PREFERRED_SIZE, 328, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(buttonInserir, javax.swing.GroupLayout.PREFERRED_SIZE, 175, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(buttonAtualizar, javax.swing.GroupLayout.DEFAULT_SIZE, 170, Short.MAX_VALUE)))
                .addGap(115, 115, 115))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(labelNome)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(textFieldNome, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(labelNumMax)
                        .addGap(11, 11, 11)
                        .addComponent(textFieldMax, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(labelCategoria)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(comboCategoria, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(10, 10, 10)
                        .addComponent(labelEsporte)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(paneEsporte, javax.swing.GroupLayout.PREFERRED_SIZE, 105, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(paneModalidade, javax.swing.GroupLayout.PREFERRED_SIZE, 315, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(labelSuccess)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(buttonRemover)
                    .addComponent(buttonInserir)
                    .addComponent(buttonAtualizar))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void buttonRemoverActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_buttonRemoverActionPerformed
        deleteModalidade();
        selectModalidade();
    }//GEN-LAST:event_buttonRemoverActionPerformed

    private void buttonInserirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_buttonInserirActionPerformed
        insertModalidade();
        selectModalidade();
    }//GEN-LAST:event_buttonInserirActionPerformed

    private void buttonAtualizarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_buttonAtualizarActionPerformed
        updateModalidade();
        selectModalidade();
    }//GEN-LAST:event_buttonAtualizarActionPerformed

    private void textFieldNomeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_textFieldNomeActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_textFieldNomeActionPerformed

    private void textFieldMaxActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_textFieldMaxActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_textFieldMaxActionPerformed

    private void jPanelMousePressed(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jPanelMousePressed
        
    }//GEN-LAST:event_jPanelMousePressed

    private void paneModalidadeMousePressed(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_paneModalidadeMousePressed
        
    }//GEN-LAST:event_paneModalidadeMousePressed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton buttonAtualizar;
    private javax.swing.JButton buttonInserir;
    private javax.swing.JButton buttonRemover;
    private javax.swing.JComboBox<String> comboCategoria;
    private javax.swing.JPanel jPanel;
    private javax.swing.JLabel labelCategoria;
    private javax.swing.JLabel labelEsporte;
    private javax.swing.JLabel labelNome;
    private javax.swing.JLabel labelNumMax;
    private javax.swing.JLabel labelSuccess;
    private javax.swing.JScrollPane paneEsporte;
    private javax.swing.JScrollPane paneModalidade;
    private javax.swing.JTextField textFieldMax;
    private javax.swing.JTextField textFieldNome;
    // End of variables declaration//GEN-END:variables
}
