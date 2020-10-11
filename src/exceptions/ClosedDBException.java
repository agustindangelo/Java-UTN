package exceptions;

public class ClosedDBException extends RuntimeException {
	public ClosedDBException(String s) {
		super(s);
	}
}
