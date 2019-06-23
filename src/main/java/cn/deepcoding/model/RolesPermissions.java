package cn.deepcoding.model;

// 角色权限关联表
public class RolesPermissions {
	
	private Integer id;
	private Roles roles;      // 角色编号
	private Permissions permissions;  // 权限编号
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Roles getRoles() {
		return roles;
	}
	public void setRoles(Roles roles) {
		this.roles = roles;
	}
	public Permissions getPermissions() {
		return permissions;
	}
	public void setPermissions(Permissions permissions) {
		this.permissions = permissions;
	}
	@Override
	public String toString() {
		return "RolesPermissions [id=" + id + ", roles=" + roles + ", permissions=" + permissions + "]";
	}
	
	
	 
}
