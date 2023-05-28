package com.TempoHelper;

import java.io.*;

public class Helper {
	
	public static boolean saveFile(InputStream is, String path) {
		boolean f= false;
		
		try {
			byte[] bA = new byte[is.available()];
			is.read(bA);
			
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(bA);
			
			fos.flush();
			fos.close();
			
			f=true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public static boolean deleteFile(String path) {
		boolean f= false;
		try {
			File file= new File(path);
			f = file.delete();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
}
