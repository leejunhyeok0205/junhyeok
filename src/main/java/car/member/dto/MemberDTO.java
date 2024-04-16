package car.member.dto;


public class MemberDTO {
	private int member_code;
	private String member_id;
	private String member_name;
	private String member_password;
	private String member_email;
	private String member_callnumber;
	private String member_birthday;
	private String member_gender;
	private String member_joinday;
	private String member_car_num1;
	private String member_car_num2;
	private String member_car_num3;
	private String member_rating;
	
	public int getMember_code() {
		return member_code;
	}
	public void setMember_code(int member_code) {
		this.member_code = member_code;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_callnumber() {
		return member_callnumber;
	}
	public void setMember_callnumber(String member_callnumber) {
		this.member_callnumber = member_callnumber;
	}
	public String getMember_birthday() {
		return member_birthday;
	}
	public void setMember_birthday(String member_birthday) {
		this.member_birthday = member_birthday;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_joinday() {
		return member_joinday;
	}
	public void setMember_joinday(String member_joinday) {
		this.member_joinday = member_joinday;
	}
	public String getMember_car_num1() {
		return member_car_num1;
	}
	public void setMember_car_num1(String member_car_num1) {
		this.member_car_num1 = member_car_num1;
	}
	public String getMember_car_num2() {
		return member_car_num2;
	}
	public void setMember_car_num2(String member_car_num2) {
		this.member_car_num2 = member_car_num2;
	}
	public String getMember_car_num3() {
		return member_car_num3;
	}
	public void setMember_car_num3(String member_car_num3) {
		this.member_car_num3 = member_car_num3;
	}
	public String getMember_rating() {
		return member_rating;
	}
	public void setMember_rating(String member_rating) {
		this.member_rating = member_rating;
	}
	@Override
	public String toString() {
		return "MemberDTO [member_code=" + member_code + ", member_id=" + member_id + ", member_name=" + member_name
				+ ", member_password=" + member_password + ", member_email=" + member_email + ", member_callnumber="
				+ member_callnumber + ", member_birthday=" + member_birthday + ", member_gender=" + member_gender
				+ ", member_joinday=" + member_joinday + ", member_car_num1=" + member_car_num1 + ", member_car_num2="
				+ member_car_num2 + ", member_car_num3=" + member_car_num3 + ", member_rating=" + member_rating + "]";
	}
}