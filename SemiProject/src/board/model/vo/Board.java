package board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5219066150385199445L;
	private int B_NO;//게시판 고유번호
	private String B_TYPE;//게시판카테고리
	private	int B_NAME;//게시판 종류
	private String B_TITLE;//게시판 제목
	private String B_TEXT;//게시판 내용
	private	String USER_ID;//게시판 작성자
	private Date B_TIME;//작성일자
	private int B_COUNT;//조회수
	private String B_FLOG;//삭제여부
	
	
}