/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Account;
import model.Category;
import model.Order;
import model.Product;

/**
 *
 * @author ADMIN
 */
public class ProductDAO {

    Connection conn = null;
    PreparedStatement ptm = null;
    ResultSet rs = null;

    java.util.Date utilDate = new java.util.Date();
    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

    public List<Product> listProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from dbo.Product";

        try {
            conn = DBManager.getConnection();
            ptm = conn.prepareStatement(query);
            rs = ptm.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5), rs.getString(6));
                list.add(p);
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getListByPage(List<Product> list, int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Product> getProductByCID(String cid) {
        List<Product> list = new ArrayList<>();
        String query = "select * from dbo.Product where categoryID=?";
        try {
            conn = new DBManager().getConnection();//mo ket noi voi sql
            ptm = conn.prepareStatement(query);
            ptm.setString(1, cid);
            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product \n"
                + "where [name] LIKE ?";
        try {
            conn = new DBManager().getConnection();//mo ket noi voi sql
            ptm = conn.prepareStatement(query);
            ptm.setString(1, "%" + txtSearch + "%"); // Câu lệnh LIKE cần %%
            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getProductByID(String id) {
        String query = "select * from Product\n"
                + "where id = ?";
        try {
            conn = new DBManager().getConnection();//mo ket noi voi sql
            ptm = conn.prepareStatement(query);
            ptm.setString(1, id);
            rs = ptm.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from dbo.category";
        try {
            conn = new DBManager().getConnection();//mo ket noi voi sql
            ptm = conn.prepareStatement(query);
            rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

  

    public Account checkLogin(String username, String password) {
        String query = "select * from accs where [user] = ? AND pass=? ";
        try {
            conn = new DBManager().getConnection();//mo ket noi voi sql
            ptm = conn.prepareStatement(query);
            ptm.setString(1, username);
            ptm.setString(2, password);
            rs = ptm.executeQuery();
            while (rs.next()) {
                //return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));

            }
        } catch (Exception e) {

        }
        return null;
    }

    public void signUp(String username, String password) {
        String query = "INSERT INTO dbo.accs ([user], pass, role) VALUES (?, ?, 'us')";

        try {
            conn = new DBManager().getConnection();//mo ket noi voi sql
            ptm = conn.prepareStatement(query);
            ptm.setString(1, username);
            ptm.setString(2, password);
            ptm.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Account checkAcconutExist(String username) {
        String query = "select * from accs where [user] = ?";
        try {
            conn = new DBManager().getConnection();//mo ket noi voi sql
            ptm = conn.prepareStatement(query);
            ptm.setString(1, username);

            rs = ptm.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public void delete(String id) {
        String query = "delete from Product where id = ?";
        try {
            conn = new DBManager().getConnection();//mo ket noi voi sql
            ptm = conn.prepareStatement(query);
            ptm.setString(1, id);
            ptm.executeUpdate();
        } catch (Exception e) {

        }

    }

    public void insertProduct(String name, String image, String price, String title, String description, String category) {
        String query = "insert into [dbo].[Product]([name],[image],[price],[title],[description],[categoryID])\n"
                + "values(?,?,?,?,?,?)";
        try {
            conn = new DBManager().getConnection();//mo ket noi voi sql
            ptm = conn.prepareStatement(query);
            ptm.setString(1, name);
            ptm.setString(2, image);
            ptm.setString(3, price);
            ptm.setString(4, title);
            ptm.setString(5, description);
            ptm.setString(6, category);

            ptm.executeUpdate();
        } catch (Exception e) {

        }

    }

    public void editProduct(String id, String name, String image, String price, String title, String description, String category) {
        String query = "UPDATE [dbo].[Product]\n"
                + "SET name = ?,\n"
                + "image = ?,\n"
                + "price = ?,\n"
                + "title = ?,\n"
                + "description = ?,\n"
                + "categoryID = ?\n"
                + "WHERE id = ?";

        try {
            conn = DBManager.getConnection();
            ptm = conn.prepareStatement(query);

            ptm.setString(1, name);
            ptm.setString(2, image);
            ptm.setString(3, price);
            ptm.setString(4, title);
            ptm.setString(5, description);
            ptm.setString(6, category);
            ptm.setString(7, id);

            ptm.executeUpdate();

        } catch (Exception e) {
        }

    }

//    public void createOrder(java.sql.Date orderDate, double total, int userID) {
//        String query = "INSERT INTO [dbo].[Order] (orderDate, total, [uID]) \n"
//                + "VALUES (?, ?, ?);";
//        try {
//            conn = new DBManager().getConnection();//mo ket noi voi SQL Server
//            ptm = conn.prepareStatement(query);
//
//            ptm.setDate(1, orderDate); // orderDate là một java.sql.Date
//            ptm.setDouble(2, total);
//            ptm.setInt(3, userID);
//
//            ptm.executeUpdate();
//        } catch (Exception e) {
//
//        }
//    }
    
 public Order createOrder(java.sql.Date orderDate, double total) {
    String query = "INSERT INTO [dbo].[Order] (orderDate, total) VALUES (?, ?)";
    Connection conn = null;
    PreparedStatement ptm = null;
    ResultSet generatedKeys = null;
    Order order = null; // Khởi tạo đối tượng Order
    
    try {
        conn = new DBManager().getConnection();
        ptm = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        ptm.setDate(1, orderDate);
        ptm.setDouble(2, total);
        ptm.executeUpdate();

        generatedKeys = ptm.getGeneratedKeys();
        if (generatedKeys.next()) {
            int orderID = generatedKeys.getInt(1);
            order = new Order(orderID, utilDate, total);
            order.setOrderID(orderID); // Đặt orderID cho đối tượng Order
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Đóng kết nối và tài nguyên
        try {
            if (generatedKeys != null) {
                generatedKeys.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    return order; // Trả về đối tượng Order
}




    public void beginTransaction() throws SQLException, ClassNotFoundException {
        // Bắt đầu giao dịch
        Connection conn = new DBManager().getConnection(); // Lấy kết nối đến cơ sở dữ liệu
        conn.setAutoCommit(false);
    }

    public void commitTransaction() throws SQLException, ClassNotFoundException {
        // Kết thúc giao dịch và lưu các thay đổi
        Connection conn = new DBManager().getConnection(); // Lấy kết nối đến cơ sở dữ liệu

        conn.commit();
        conn.setAutoCommit(true);
    }

    public void createOrderDetail(int orderID, int productID, double price, int quantity) {

        String query = "INSERT INTO OrderDetail (orderID, id, price, quantity) VALUES (?, ?, ?, ?)";
        try {
            conn = new DBManager().getConnection();//mo ket noi voi SQL Server
            ptm = conn.prepareStatement(query);

            ptm.setInt(1, orderID);
            ptm.setInt(2, productID);
            ptm.setDouble(3, price);
            ptm.setInt(4, quantity);
            ptm.executeUpdate();

            ptm.executeUpdate();
        } catch (Exception e) {

        }

    }
    
    

    public void updateUser(int id, String address, java.sql.Date birthdate, String phone, String mail) {
        String query = "UPDATE accs\n"
                + "    SET\n"
                + "        [address] = ?,\n"
                + "        [birthday] = ?,\n"
                + "        [phone] = ?,\n"
                + "        [mail] = ?\n"
                + "    WHERE [uID] = ?;";
        try {
            conn = new DBManager().getConnection();//mo ket noi voi SQL Server
            ptm = conn.prepareStatement(query);

            ptm.setInt(5, id);
            ptm.setNString(1, address);
            ptm.setDate(2, birthdate);
            ptm.setString(3, phone);
            ptm.setString(4, mail);

            ptm.executeUpdate();
        } catch (Exception e) {

        }
    }

    public Account selectUser(int id) {
        String query = "select * from accs where [uID] = ?";
        try {
            conn = new DBManager().getConnection();//mo ket noi voi sql
            ptm = conn.prepareStatement(query);
            ptm.setInt(1, id);

            rs = ptm.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
            }
        } catch (Exception e) {

        }
        return null;
    }

  
}
