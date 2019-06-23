package cn.deepcoding.model;

// 权限资源表
public class Permissions {
	
	private Integer id;
	private String permission;    // 权限名称
	private String resource;      // 资源路径
	private String perCode;       // 权限标识符
	private String description;   // 描述
	private Integer available;    // 状态
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	public String getResource() {
		return resource;
	}
	public void setResource(String resource) {
		this.resource = resource;
	}
	
	public String getPerCode() {
		return perCode;
	}
	public void setPerCode(String perCode) {
		this.perCode = perCode;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getAvailable() {
		return available;
	}
	public void setAvailable(Integer available) {
		this.available = available;
	}
	@Override
	public String toString() {
		return "Permissions [id=" + id + ", permission=" + permission + ", resource=" + resource + ", perCode="
				+ perCode + ", description=" + description + ", available=" + available + "]";
	}
	
	
}
