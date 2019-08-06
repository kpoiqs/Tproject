package Model;

public class  Qna {
	
	private int no;
	private String subject;
	private String content;
	private String writer;
	private int wdate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getWdate() {
		return wdate;
	}
	public void setWdate(int wdate) {
		this.wdate = wdate;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Qna [no=" + no + ", subject=" + subject + ", content=" + content + ", writer=" + writer + ", wdate="
				+ wdate + "]";
	}
	
	
}