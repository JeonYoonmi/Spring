package kr.or.ddit.vo;

import lombok.Data;

@Data
public class BomVO {
	private int itemId;
	private int parentId;
	private String itemName;
	private int itemQty;
	private int rnum;
	private int lvl;
}
