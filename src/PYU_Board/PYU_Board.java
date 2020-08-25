package PYU_Board;

public class PYU_Board {
	private int BoardID;
	private String BoardTitle;
	private String userID;
	private String BoardDate;
	private String BoardContent;
	private int BoardAvailable;
	
	public int getBoardID() {
		return BoardID;
	}
	public void setBoardID(int boardID) {
		BoardID = boardID;
	}
	
	public String getBoardTitle() {
		return BoardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		BoardTitle = boardTitle;
	}
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	public String getBoardDate() {
		return BoardDate;
	}
	public void setBoardDate(String boardDate) {
		BoardDate = boardDate;
	}
	
	public String getBoardContent() {
		return BoardContent;
	}
	public void setBoardContent(String boardContent) {
		BoardContent = boardContent;
	}
	
	public int getBoardAvailable() {
		return BoardAvailable;
	}
	public void setBoardAvailable(int boardAvailable) {
		BoardAvailable = boardAvailable;
	}
	
}
