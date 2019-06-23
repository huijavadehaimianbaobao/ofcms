package cn.deepcoding.model;

// 用户，角色关联表
public class UsersRoles {
	
	private Integer id;
	private Users users;  // 用户编号
	private Roles roles;  // 角色编号
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public Roles getRoles() {
		return roles;
	}
	public void setRoles(Roles roles) {
		this.roles = roles;
	}
	@Override
	public String toString() {
		return "UsersRoles [id=" + id + ", users=" + users + ", roles=" + roles + "]";
	}

	
	
}
