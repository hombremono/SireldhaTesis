package ar.com.iua.web.spring.services;

import java.io.Serializable;

public class SimpleResponse implements Serializable {
	private static final long serialVersionUID = 6229322065137629670L;

	private int code;

	private String message;
	
	private String devMessage;
	public String getDevMessage() {
		return devMessage;
	}

	public void setDevMessage(String devMessage) {
		this.devMessage = devMessage;
	}

	public SimpleResponse() {
	}

	public SimpleResponse(int code, String message) {
		super();
		this.code = code;
		this.message = message;
	}
	
	public SimpleResponse(int code, String message, String devMessage) {
		super();
		this.code = code;
		this.message = message;
		this.devMessage=devMessage;
	}

	public int getCode() {
		return code;
	}

	public String getMessage() {
		return message;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
