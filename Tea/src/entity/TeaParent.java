package entity;

public class TeaParent {
	private String id;
	private String name;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public TeaParent() {
	}
	@Override
	public String toString() {
		return "TeaParent [id=" + id + ", name=" + name + "]";
	}
	public TeaParent(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
}
