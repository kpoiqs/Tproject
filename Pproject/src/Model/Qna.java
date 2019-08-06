package Model;

public class  Qna {
	
	private int no;
	private String subject;
	private String content;
	private String writer;
	private String wdate;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	
	@Override
	public String toString() {
		return "Qna [no=" + no + ", subject=" + subject + ", content=" + content + ", writer=" + writer + ", wdate="
				+ wdate + "]";
	}
	
	
	
}