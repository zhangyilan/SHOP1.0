package com.bigJD.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import org.apache.commons.io.IOUtils;
import org.apache.struts2.ServletActionContext;
public class FileUpload {
	/**
	 * FILE
	 * 
	 * @param fileName
	 * @param file
	 * @param savePath
	 * (eg:upload)
	 * @return
	 */
	public static String upload(String fileName, File file, String savePath) {
		String[] s = fileName.split("\\.");
		String end = s[s.length-1];
		String fileNames = StringUtil.onlyString();
		String savePaths = ServletActionContext.getServletContext().getRealPath("/" + savePath + "/" + fileNames+"."+end);
		try {
			FileInputStream fis = new FileInputStream(file);
			FileOutputStream fos = new FileOutputStream(savePaths);
			System.out.println(savePaths);
			IOUtils.copy(fis, fos);
			fos.flush();
			fos.close();
			fis.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fileNames+"."+end;
	}

	public static void delete(String fileName) {
		File file = new File(fileName);
		if (!file.exists()) {
			return;
		} else {
			if (file.isFile())
				file.delete();
		}
	}
}
