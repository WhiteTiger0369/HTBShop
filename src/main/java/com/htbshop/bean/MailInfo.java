package com.htbshop.bean;

public class MailInfo {
	String form;
	String to;
	String cc;
	String bcc;
	String subject;
	String body;
	String files;
	
	public MailInfo() {
		super();
	}
	public MailInfo(String form, String to, String cc, String bcc, String subject, String body, String files) {
		super();
		this.form = form;
		this.to = to;
		this.cc = cc;
		this.bcc = bcc;
		this.subject = subject;
		this.body = body;
		this.files = files;
	}
	public MailInfo(String form, String to, String subject, String body) {
		super();
		this.form = form;
		this.to = to;
		this.subject = subject;
		this.body = body;
	}
	public String getForm() {
		return form;
	}
	public void setForm(String form) {
		this.form = form;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getCc() {
		return cc;
	}
	public void setCc(String cc) {
		this.cc = cc;
	}
	public String getBcc() {
		return bcc;
	}
	public void setBcc(String bcc) {
		this.bcc = bcc;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getFiles() {
		return files;
	}
	public void setFiles(String files) {
		this.files = files;
	}
	

}
