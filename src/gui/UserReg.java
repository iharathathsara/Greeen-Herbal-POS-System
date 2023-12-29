/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gui;

import java.sql.ResultSet;
import java.util.Vector;
import java.util.regex.Pattern;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import model.MySQL;

/**
 *
 * @author acer
 */
@SuppressWarnings("deprecation")
public class UserReg extends javax.swing.JInternalFrame {

    /**
     * Creates new form UserReg
     */
    public UserReg() {
        initComponents();

        loadUsers();
        loadUserTypes();
        loadCities();
    }

    public void resetFields() {
        jTextField2.setText("");
        jTextField3.setText("");
        jTextField4.setText("");
        jPasswordField1.setText("");

    }

    public void loadCities() {
        try {
            ResultSet rs = MySQL.search("SELECT * FROM `city`");
            Vector v1 = new Vector();
            v1.add("SELECT");
            while (rs.next()) {
                v1.add(rs.getString("name"));
            }
            DefaultComboBoxModel dcm = new DefaultComboBoxModel(v1);
            jComboBox2.setModel(dcm);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void loadUserTypes() {
        try {
            ResultSet rs = MySQL.search("SELECT * FROM `user_type`");
            Vector v2 = new Vector();
            v2.add("SELECT");
            while (rs.next()) {
                v2.add(rs.getString("name"));
            }
            DefaultComboBoxModel dcm = new DefaultComboBoxModel(v2);
            jComboBox1.setModel(dcm);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void loadUsers(String text) {
        try {
            ResultSet rs = MySQL.search("SELECT `user`.`id`,`user`.`name`,`user`.`username`,`user`.`password`,`user`.`contact_number`,`user`.`nic`,`user_type`.`name` AS `user_type`,`city`.`name` AS `city_name`,`user_status`.`name` AS `user_status` FROM `user` INNER JOIN `city` ON `user`.`city_id` =`city`.`id` INNER JOIN `user_type` ON `user`.`user_type_id`=`user_type`.`id` INNER JOIN `user_status` ON `user`.`user_status_id`=`user_status`.`id` WHERE `user`.`name` LIKE '" + text + "%' OR `user`.`contact_number` LIKE '" + text + "%'  ORDER BY `user`.`id` ASC");
            DefaultTableModel dtm = (DefaultTableModel) jTable1.getModel();
            dtm.setRowCount(0);
            while (rs.next()) {
                Vector v = new Vector();
                v.add(rs.getString("id"));
                v.add(rs.getString("name"));
                v.add(rs.getString("username"));
                v.add(rs.getString("password"));
                v.add(rs.getString("contact_number"));
                v.add(rs.getString("nic"));
                v.add(rs.getString("user_type"));
                v.add(rs.getString("city_name"));
                v.add(rs.getString("user_status"));
                dtm.addRow(v);
            }
            jTable1.setModel(dtm);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void loadUsers() {
        try {
            ResultSet rs = MySQL.search("SELECT `user`.`id`,`user`.`name`,`user`.`username`,`user`.`password`,`user`.`contact_number`,`user`.`nic`,`user_type`.`name` AS `user_type`,`city`.`name` AS `city_name`,`user_status`.`name` AS `user_status` FROM `user` INNER JOIN `city` ON `user`.`city_id` =`city`.`id` INNER JOIN `user_type` ON `user`.`user_type_id`=`user_type`.`id` INNER JOIN `user_status` ON `user`.`user_status_id`=`user_status`.`id` ORDER BY `id` ASC");

            DefaultTableModel dtm = (DefaultTableModel) jTable1.getModel();
            dtm.setRowCount(0);

            while (rs.next()) {
                Vector v = new Vector();
                v.add(rs.getString("id"));
                v.add(rs.getString("name"));
                v.add(rs.getString("username"));
                v.add(rs.getString("password"));
                v.add(rs.getString("contact_number"));
                v.add(rs.getString("nic"));
                v.add(rs.getString("user_type"));
                v.add(rs.getString("city_name"));
                v.add(rs.getString("user_status"));
                dtm.addRow(v);
            }
            jTable1.setModel(dtm);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jPanel2 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jTextField1 = new javax.swing.JTextField();
        jSeparator1 = new javax.swing.JSeparator();
        jLabel2 = new javax.swing.JLabel();
        jTextField2 = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        jTextField3 = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        jPasswordField1 = new javax.swing.JPasswordField();
        jLabel5 = new javax.swing.JLabel();
        jTextField4 = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        jComboBox1 = new javax.swing.JComboBox<>();
        jLabel7 = new javax.swing.JLabel();
        jComboBox2 = new javax.swing.JComboBox<>();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jLabel8 = new javax.swing.JLabel();
        jTextField5 = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();

        setClosable(true);
        setMaximizable(true);
        setPreferredSize(new java.awt.Dimension(1095, 740));

        jLabel1.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        jLabel1.setText("Search User");

        jTextField1.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        jTextField1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                jTextField1KeyReleased(evt);
            }
        });

        jLabel2.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        jLabel2.setText("Name");

        jTextField2.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N

        jLabel3.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        jLabel3.setText("User Name");

        jTextField3.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N

        jLabel4.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        jLabel4.setText("Password");

        jPasswordField1.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N

        jLabel5.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        jLabel5.setText("Contact Number");

        jTextField4.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        jTextField4.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                jTextField4KeyReleased(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                jTextField4KeyTyped(evt);
            }
        });

        jLabel6.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        jLabel6.setText("Type");

        jComboBox1.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N

        jLabel7.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        jLabel7.setText("City");

        jComboBox2.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N

        jButton1.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        jButton1.setText("Create Account");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jButton2.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        jButton2.setText("Change Status");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jLabel8.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        jLabel8.setText("NIC");

        jTextField5.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jLabel1)
                    .addComponent(jTextField1)
                    .addComponent(jSeparator1)
                    .addComponent(jLabel2)
                    .addComponent(jTextField2)
                    .addComponent(jLabel3)
                    .addComponent(jTextField3)
                    .addComponent(jLabel4)
                    .addComponent(jPasswordField1)
                    .addComponent(jLabel5)
                    .addComponent(jTextField4)
                    .addComponent(jLabel6)
                    .addComponent(jComboBox1, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jLabel7)
                    .addComponent(jComboBox2, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButton1, javax.swing.GroupLayout.DEFAULT_SIZE, 323, Short.MAX_VALUE)
                    .addComponent(jButton2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jLabel8)
                    .addComponent(jTextField5))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jSeparator1, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jTextField2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel3)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jTextField3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel4)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPasswordField1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel5)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jTextField4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel8)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jTextField5, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel6)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel7)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jComboBox2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 78, Short.MAX_VALUE)
                .addComponent(jButton1)
                .addGap(18, 18, 18)
                .addComponent(jButton2)
                .addGap(39, 39, 39))
        );

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "ID", "Name", "Username", "Password", "Contact", "NIC", "Type", "City", "Status"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane1.setViewportView(jTable1);

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 710, Short.MAX_VALUE)
                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jScrollPane1))
                .addContainerGap())
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jTextField1KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTextField1KeyReleased
        // TODO add your handling code here:
        loadUsers(jTextField1.getText());
    }//GEN-LAST:event_jTextField1KeyReleased

    private void jTextField4KeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTextField4KeyTyped
        // TODO add your handling code here:
        String mobile = jTextField4.getText();
        String text = mobile + evt.getKeyChar();

        if (text.length() == 1) {
            if (!text.equals("0")) {
                evt.consume();
            }
        } else if (text.length() == 2) {
            if (!text.equals("07")) {
                evt.consume();
            }
        } else if (text.length() == 3) {
            if (!Pattern.compile("07[01245678]").matcher(text).matches()) {
                evt.consume();
            }
        } else if (text.length() <= 10) {
            if (!Pattern.compile("07[1245678][0-9]+").matcher(text).matches()) {
                evt.consume();
            }
        } else {
            evt.consume();
        }

        if (!Pattern.compile("0?7?[01245678]?[0-9]{0,7}").matcher(text).matches()) {
            evt.consume();
        }
    }//GEN-LAST:event_jTextField4KeyTyped

    private void jTextField4KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTextField4KeyReleased
        // TODO add your handling code here:
        if (jTextField4.getText().length() == 10) {
            jTextField4.setEditable(false);
        }
    }//GEN-LAST:event_jTextField4KeyReleased

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        String name = jTextField2.getText();
        String username = jTextField3.getText();
        char passwordArray[] = jPasswordField1.getPassword();
        String password = String.valueOf(passwordArray);
        String mobile = jTextField4.getText();
        String nic = jTextField5.getText();
        String type = jComboBox1.getSelectedItem().toString();
        String city = jComboBox2.getSelectedItem().toString();

        if (name.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Please enter Name", "Warning", JOptionPane.WARNING_MESSAGE);
        } else if (username.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Please enter Username", "Warning", JOptionPane.WARNING_MESSAGE);
        } else if (password.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Please enter Password", "Warning", JOptionPane.WARNING_MESSAGE);
        } else if (!Pattern.compile("07[01245678][0-9]{7}").matcher(mobile).matches()) {
            JOptionPane.showMessageDialog(this, "Invalid Mobile Number", "Warning", JOptionPane.WARNING_MESSAGE);
        } else if (nic.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Please enter NIC", "Warning", JOptionPane.WARNING_MESSAGE);
        } else if (type.equals("SELECT")) {
            JOptionPane.showMessageDialog(this, "Please select Type", "Warning", JOptionPane.WARNING_MESSAGE);
        } else if (city.equals("SELECT")) {
            JOptionPane.showMessageDialog(this, "Please select City", "Warning", JOptionPane.WARNING_MESSAGE);
        } else {
            try {
                ResultSet rs1 = MySQL.search("SELECT `id` FROM `city` WHERE `name`='" + city + "'");
                rs1.next();
                ResultSet rs2 = MySQL.search("SELECT `id` FROM `user_type` WHERE `name`='" + type + "'");
                rs2.next();

                String city_id = rs1.getString("id");
                String type_id = rs2.getString("id");

                MySQL.iud("INSERT INTO `user`(`name`,`username`,`password`,`contact_number`,`nic`,`user_type_id`,`city_id`) VALUES('" + name + "','" + username + "','" + password + "','" + mobile + "','" + nic + "'," + Integer.parseInt(type_id) + "," + Integer.parseInt(city_id) + ") ");

                resetFields();
                loadUsers();

                JOptionPane.showMessageDialog(this, "New user account created", "Success", JOptionPane.INFORMATION_MESSAGE);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // TODO add your handling code here:
        int selectedRow = jTable1.getSelectedRow();

        if (selectedRow == -1) {
            JOptionPane.showMessageDialog(this, "Can't change the status of super admin", "Error", JOptionPane.ERROR_MESSAGE);
        } else {
            String id = jTable1.getValueAt(selectedRow, 0).toString();
            if (id .equals("1")) {
                JOptionPane.showMessageDialog(this, "Can't change the status of super admin", "Error", JOptionPane.ERROR_MESSAGE);
            } else {
                String currentStatus = jTable1.getValueAt(selectedRow, 8).toString();
                int status;
                if (currentStatus.equals("Active")) {
                    status = 2;
                } else {
                    status = 1;
                }
                MySQL.iud("UPDATE `user` SET `user_status_id`=" + status + " WHERE `id`=" + Integer.parseInt(id) + "");
                loadUsers();
                JOptionPane.showMessageDialog(this, "User status updated", "Success", JOptionPane.INFORMATION_MESSAGE);
            }
        }
    }//GEN-LAST:event_jButton2ActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JComboBox<String> jComboBox1;
    private javax.swing.JComboBox<String> jComboBox2;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPasswordField jPasswordField1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JSeparator jSeparator1;
    private javax.swing.JTable jTable1;
    private javax.swing.JTextField jTextField1;
    private javax.swing.JTextField jTextField2;
    private javax.swing.JTextField jTextField3;
    private javax.swing.JTextField jTextField4;
    private javax.swing.JTextField jTextField5;
    // End of variables declaration//GEN-END:variables
}