package com.TempoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.TempoEntities.Vehicle;

public class VehicleDao {
	Connection conn;
	
	public VehicleDao(Connection conn) {
		this.conn = conn;
	}
	
	public boolean saveVehicle(Vehicle vehicle) {
		boolean f = false;
		
		try {
			String query = "insert into vehicle(vType,vModel,vPlate,vPhoto,userId) values(?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, vehicle.getvType());
			pstmt.setString(2, vehicle.getvModel());
			pstmt.setString(3, vehicle.getvPlate());
			pstmt.setString(4, vehicle.getvPhoto());
			pstmt.setInt(5, vehicle.getUserId());
			
			pstmt.executeUpdate();
			f=true;
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
	}
}
