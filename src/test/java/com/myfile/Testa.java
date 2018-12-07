package com.myfile;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

import org.apache.ibatis.io.Resources;

public class Testa {

	public static String pojoClassName = "Proclamation";
	public static String pojoClassNameLower = "proclamation";

	public static String a = "com.service"; // [service接口包路径];
	public static String b = "com.bean." + pojoClassName;// [pojo类路径]
	public static String c = pojoClassName;// [pojo类名字]
	public static String d = pojoClassNameLower;// [pojo类名字小写]
	// ///////////////////////////////////////
	public static String e = "com.service";// [service接口实现类包路径]
	public static String f = "com.dao." + pojoClassName + "Mapper";// [mybatis的dao接口路径]
	public static String g = pojoClassNameLower + "Mapper";// [mybatis的dao接口名字首字母小写]
	public static String h = pojoClassName + "Mapper";// [mybatis的dao接口名字]
	// ///////////////////////////////////////
	public static String i = "com.controller";// [controller包路径]
	public static String j = "com.service." + pojoClassName + "Service";// [service接口的类路径]
	public static String k = pojoClassNameLower + "ServiceImp";// [service接口实现类名字首字母小写]
	public static String m = pojoClassName + "Service";// [service接口名字]
	public static String n = pojoClassNameLower + "Service";// [service接口名字首字母小写]

	// 要生成的service接口的路径
	public static String writeservicePath = "/src/main/java/com/service/"
			+ pojoClassName + "Service.java";
	public static String serviceTempPath = "/src/test/java/com/myfile/ServiceTemp.txt";// service接口模板的路径
	// /////////////////
	// //service实现类
	public static String serviceImpTempPath = "/src/test/java/com/myfile/ServiceImpTemp.txt";// service实现类模板的路径
	public static String writeserviceImpPath = "/src/main/java/com/service/"
			+ pojoClassName + "ServiceImp.java";// service实现类的路径
	// ////////////////////
	public static String controllerTempPath = "/src/test/java/com/myfile/ControllerTemp.txt";// service实现类模板的路径
	public static String writecontrollerPath = "/src/main/java/com/controller/"
			+ pojoClassName + "Controller.java";// service实现类的路径

	// //////////////////

	public static void main(String[] args) throws Exception {
		service();// 生成service接口

		serviceimp();// 生成service实现类

		// 生成控制层
		controller();

	}

	// 生成控制层
	public static void controller() throws Exception {
		String controllerfilePath = new File("").getAbsolutePath()
				+ new File(controllerTempPath).getPath();// 控制层模板的路径

		String writecontrollerfilePath = new File("").getAbsolutePath()
				+ new File(writecontrollerPath).getPath();// 要写入的service实现类的路径

		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(writecontrollerfilePath)));

		BufferedReader br = new BufferedReader(new InputStreamReader(
				new FileInputStream(controllerfilePath)));// 缓存字符输入流
		String sline = null;
		while ((sline = br.readLine()) != null) {
			sline = sline.replaceAll("\\[pojo类路径\\]", b);
			sline = sline.replaceAll("\\[pojo类名字\\]", c);
			sline = sline.replaceAll("\\[pojo类名字小写\\]", d);
			sline = sline.replaceAll("\\[controller包路径\\]", i);
			sline = sline.replaceAll("\\[service接口的类路径\\]", j);
			sline = sline.replaceAll("\\[service接口实现类名字首字母小写\\]", k);
			sline = sline.replaceAll("\\[service接口名字\\]", m);
			sline = sline.replaceAll("\\[service接口名字首字母小写\\]", n);

			// System.out.println(sline);
			bw.write(sline);
			bw.newLine();
		}
		bw.close();
		br.close();
	}

	// 生成service实现类
	public static void serviceimp() throws Exception {
		String serviceimpfilePath = new File("").getAbsolutePath()
				+ new File(serviceImpTempPath).getPath();// service实现了模板的路径

		String writeserviceimpfilePath = new File("").getAbsolutePath()
				+ new File(writeserviceImpPath).getPath();// 要写入的service实现类的路径

		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(writeserviceimpfilePath)));

		BufferedReader br = new BufferedReader(new InputStreamReader(
				new FileInputStream(serviceimpfilePath)));// 缓存字符输入流
		String sline = null;
		while ((sline = br.readLine()) != null) {
			sline = sline.replaceAll("\\[pojo类路径\\]", b);
			sline = sline.replaceAll("\\[pojo类名字\\]", c);
			sline = sline.replaceAll("\\[pojo类名字小写\\]", d);
			sline = sline.replaceAll("\\[service接口实现类包路径\\]", e);
			sline = sline.replaceAll("\\[mybatis的dao接口路径\\]", f);
			sline = sline.replaceAll("\\[mybatis的dao接口名字首字母小写\\]", g);
			sline = sline.replaceAll("\\[mybatis的dao接口名字\\]", h);

			// System.out.println(sline);
			bw.write(sline);
			bw.newLine();
		}
		bw.close();
		br.close();
	}

	// 读取servie接口模板，并写入service接口
	public static void service() throws FileNotFoundException, IOException {
		String servicefilePath = new File("").getAbsolutePath()
				+ new File(serviceTempPath).getPath();// service接口模板的路径

		String writeservicefilePath = new File("").getAbsolutePath()
				+ new File(writeservicePath).getPath();// 要写入的service接口的路径

		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(writeservicefilePath)));

		BufferedReader br = new BufferedReader(new InputStreamReader(
				new FileInputStream(servicefilePath)));// 缓存字符输入流
		String sline = null;
		while ((sline = br.readLine()) != null) {
			sline = sline.replaceAll("\\[service接口包路径\\]", a);
			sline = sline.replaceAll("\\[pojo类路径\\]", b);
			sline = sline.replaceAll("\\[pojo类名字\\]", c);
			sline = sline.replaceAll("\\[pojo类名字小写\\]", d);

			bw.write(sline);
			bw.newLine();
		}
		bw.close();
		br.close();
	}
}
