package entity;

public class User {

	private String name;
	private String pass;
	private String email;
	private String verificationCode;

	public User(String name, String pass, String email, String verificationCode) {
		this.name = name;
		this.pass = pass;
		this.email = email;
		this.verificationCode = verificationCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getVerificationCode() {
		return verificationCode;
	}

	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}

	@Override
	public String toString() {
		return "User [name=" + name + ", pass=" + pass + ", email=" + email + "]";
	}

}
