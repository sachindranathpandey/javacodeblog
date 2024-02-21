package com.tech.blog.helper;

public class Test {

	public static void main(String[] args) {
		
		ConnectionProvider connectionProvider=new ConnectionProvider();
		
		System.out.println(connectionProvider.getConnection());
	}
}
