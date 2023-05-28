package com.TempoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.TempoEntities.User;

public class UserDao {
	private Connection conn;

	public UserDao(Connection conn) {
		this.conn = conn;
	}

	public boolean saveUser(User user) {

		boolean f = false;

		try {
			String query = "insert into user(uId,name,phoneno,gender,email,password,liscencename,profileName,category) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, user.getuId());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getPhoneno());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getEmail());
			pstmt.setString(6, user.getPassword());
			pstmt.setString(7, user.getLiscenceName());
			pstmt.setString(8, user.getProfileName());
			pstmt.setString(9, user.getCategory());

			pstmt.executeUpdate();

			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public User getUserByEmailAndPassword(String email, String password) {
		User user = new User();

		try {
			String query = "select * from user where email = ? and password = ?";
			PreparedStatement pstmt = conn.prepareStatement(query);

			pstmt.setString(1, email);
			pstmt.setString(2, password);

			ResultSet set = pstmt.executeQuery();

			if (set.next()) {
				
				user.setuId(set.getInt("uId"));
				user.setName(set.getString("name"));
				user.setPhoneno(set.getString("phoneno"));
				user.setGender(set.getString("gender"));
				user.setEmail(email);
				user.setPassword(password);
				user.setLiscenceName(set.getString("liscenceName"));
				user.setProfileName(set.getString("profileName"));
				user.setCategory(set.getString("category"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;

	}
	
	public User getUserByUserId(int uId) {
		User user = null;
		
		try {
			String query="select * from user where uId = ?";
			
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, uId);
			
			ResultSet set = pstmt.executeQuery();
			
			if(set.next()) {
				String name = set.getString("name");
				String phoneno = set.getString("phoneno");
				String gender = set.getString("gender");
				String email = set.getString("email");
				String password = set.getString("password");
				String liscenceName = set.getString("liscenseName");
				String profileName = set.getString("profileName");
				String category = set.getString("category");
				
				user = new User(uId,name,phoneno,gender,email,password,liscenceName,profileName,category);
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
}
