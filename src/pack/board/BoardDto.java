package pack.board;

public class BoardDto { // FormBean
	private String name, pass, mail, title, cont, bip, bdate;
	private int num, readcnt, gnum, onum, nested;

	//이름(1)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	//비밀번호(2)
	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	//메일(3)
	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	//타이틀(4)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	//카운트(5)
	public String getCont() {
		return cont;
	}

	public void setCont(String cont) {
		this.cont = cont;
	}

	//Bip(6)
	public String getBip() {
		return bip;
	}

	public void setBip(String bip) {
		this.bip = bip;
	}

	//Bdate(7)
	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	//Num(8)
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	//Readcnt(9)
	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	//Gnum(10)
	public int getGnum() {
		return gnum;
	}

	public void setGnum(int gnum) {
		this.gnum = gnum;
	}

	//Onum(11)
	public int getOnum() {
		return onum;
	}

	public void setOnum(int onum) {
		this.onum = onum;
	}

	//Nested(12)
	public int getNested() {
		return nested;
	}

	public void setNested(int nested) {
		this.nested = nested;
	}

}
