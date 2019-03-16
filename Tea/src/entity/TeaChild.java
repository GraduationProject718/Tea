package entity;

public class TeaChild {
	private String id;
	private String parentId;
	private String name;
	private String desc;
	private String function;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getFunction() {
		return function;
	}
	public void setFunction(String function) {
		this.function = function;
	}
	public TeaChild() {
	}
	public TeaChild(String id, String parentId, String name, String desc, String function) {
		super();
		this.id = id;
		this.parentId = parentId;
		this.name = name;
		this.desc = desc;
		this.function = function;
	}
	@Override
	public String toString() {
		return "TeaChild [id=" + id + ", parentId=" + parentId + ", name=" + name + ", desc=" + desc + ", function="
				+ function + "]";
	}
	
}
