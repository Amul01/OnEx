package data;
import java.io.Serializable;

public class data implements Serializable {

	private String name;
	private String enr;
	private String ques[];
	private String options[][];
	private String corr[];
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEnr() {
		return enr;
	}

	public void setEnr(String enr) {
		this.enr = enr;
	}

	public String[] getQues() {
		return ques;
	}

	public void setQues(String[] ques) {
		this.ques = ques;
	}

	public String[][] getOptions() {
		return options;
	}

	public void setOptions(String[][] options) {
		this.options = options;
	}

	public String[] getCorr() {
		return corr;
	}

	public void setCorr(String[] corr) {
		this.corr = corr;
	}

	public data() {
		super();
	}

}
