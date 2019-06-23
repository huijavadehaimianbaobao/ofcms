package cn.deepcoding.dao;

import org.springframework.stereotype.Repository;

import cn.deepcoding.model.EmergencyPerson;

@Repository
public interface EmergencyPersonDao {

	public void save(EmergencyPerson emergencyPerson);

	// 根据学生ID删除紧急联系人
	public void deleteemergencyPerson(Integer id);

}
