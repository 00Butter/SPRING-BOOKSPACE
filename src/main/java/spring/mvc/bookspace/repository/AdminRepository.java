package spring.mvc.bookspace.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.bookspace.dto.AdminDTO;
import spring.mvc.bookspace.dto.MemberDTO;

@Repository
public class AdminRepository {

	@Autowired
	private SqlSession sqlTemplate; 
	

	public List<Object> selectList(String path){
		return sqlTemplate.selectList(path);
	}
	
	public List<Object> selectListSearch(String path, Object params){
		return sqlTemplate.selectList(path,params);
	}
	public Object selectOne(String path){
		
		return sqlTemplate.selectOne(path);
	}
	public Object selectOne(String path, Object params){
		if(params instanceof AdminDTO){
			Object obj= sqlTemplate.selectOne(path,(AdminDTO)params);
		}else if(params instanceof Integer){
			Object obj= sqlTemplate.selectOne(path,(Integer)params);
		}

		Object obj= sqlTemplate.selectOne(path, params);
		return obj;
	}
	
	
	public int insertOne(String path,Object dto){
		return sqlTemplate.insert(path, dto);
	}
	
	public int deleteOne(String path,Object params){
		return sqlTemplate.delete(path, params);
	}
	
	public int updateOne(String path,Object params){
		if(params instanceof AdminDTO){
			return sqlTemplate.update(path,(AdminDTO)params);
		}
		return sqlTemplate.update(path, params);
	}



	public int deleteAdOne(String param) {
		return sqlTemplate.delete("admin.delOne", Integer.parseInt(param.trim()));
	}
	
	public int deletePubOne(Integer num) {
		return sqlTemplate.delete("pub.deleteOne", num);
	}


	
	public int plusCash(MemberDTO dto) {
		return sqlTemplate.update("admin.plusCash", dto);
	}

	
	
}
