package exceptions;

public class BusinessLogicException extends Exception{
	private static final long serialVersionUID = 1L;
	private String message;
	public BusinessLogicException() {}
	public BusinessLogicException(String msg) {
		this.message = msg;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
