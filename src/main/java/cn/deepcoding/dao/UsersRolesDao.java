package cn.deepcoding.dao;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import cn.deepcoding.model.UsersRoles;
public interface UsersRolesDao {

	// 根据用户 id 查询角色
	List<UsersRoles> getRoleByUserId(Integer id);

	// 添加
	void add(UsersRoles usersRoles);
	// 根据 用户 id 修改
	void updateByUserId(UsersRoles usersRoles);
	// 根据 用户 id 删除
	void deleteByUserId(Integer id);
	// 根据 角色 id 删除
	void deleteByRoleId(Integer id);
	
	// 根据 用户 id ，角色id 删除
	void deleteByUserIdRoleId(@Param("userId")Integer userId,@Param("roleId")Integer roleId);
}
