package cn.deepcoding.model;

import java.util.List;

// 用户表
public class Users {
	
	private Integer id;
	private String username;    // 用户名称
	private String password;    // 用户密码 
	private Integer available;  // 状态  
	private Integer roleId;  // 角色
	private List<UsersRoles> usersRoles; // 关联表
	private String name;    // 用户昵称
	private String fackToken;//人脸图片的唯一标识
	public String getFackToken() {
		return fackToken;
	}
	public void setFackToken(String fackToken) {
		this.fackToken = fackToken;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getAvailable() {
		return available;
	}
	public void setAvailable(Integer available) {
		this.available = available;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public List<UsersRoles> getUsersRoles() {
		return usersRoles;
	}
	public void setUsersRoles(List<UsersRoles> usersRoles) {
		this.usersRoles = usersRoles;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Users [id=" + id + ", username=" + username + ", password=" + password + ", available=" + available
				+ ", roleId=" + roleId + ", usersRoles=" + usersRoles + ", name=" + name + ", fackToken=" + fackToken
				+ "]";
	}

	
	
	
	
}
