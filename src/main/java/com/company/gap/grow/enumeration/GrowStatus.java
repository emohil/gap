package com.company.gap.grow.enumeration;


public enum GrowStatus {
	
	GOING(1, "进行中"),
	
	COMPLETED(2, "已完成"),
	
	ARCHIVED(3, "已归档");
	
	private int status;
	private String name;
	
	GrowStatus(int status, String name) {
		this.status = status;
		this.name = name;
	}
	
	public static GrowStatus valueOf(int status) {
		switch (status) {
			case 1 : return GOING;
			case 2 : return COMPLETED;
			case 3 : return ARCHIVED;
			default: return GOING;
		}
	}

	public int getStatus() {
		return status;
	}

	public String getName() {
		return name;
	}
	
	
}
