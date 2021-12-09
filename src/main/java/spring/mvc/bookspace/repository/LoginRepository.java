package spring.mvc.bookspace.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.net.aso.p;
import spring.mvc.bookspace.dto.MemberDTO;
import spring.mvc.bookspace.dto.PublisherDTO;

@Repository
public class LoginRepository {

	@Autowired
	private SqlSession sqlTemplate; 

	public String idCheck(String id) {
		return sqlTemplate.selectOne("log.idck", id);
	}


	public String loginCheck(MemberDTO dto) {
		return sqlTemplate.selectOne("log.login", dto);
	}

	public Object checkLicense(String license){
		return sqlTemplate.selectOne("pub.checkLicense", license);
	}

	public int insertPub(PublisherDTO dto) {
		return sqlTemplate.insert("pub.joinOne", dto);
	}

	public Object checkid(String id) {
		return sqlTemplate.selectOne("pub.checkID", id);
	}

	public int insertLog(PublisherDTO dto) {
		return sqlTemplate.insert("pub.insertlog",dto);
	}

	public int insertPeo(MemberDTO dto) {
		return sqlTemplate.insert("mem.joinOne", dto);
	}

	public int deleteOne(String id) {
		return sqlTemplate.delete("pub.deleteLog",id);
	}



	public int insertData(String param) {
		if(param.equals("남")){
			return sqlTemplate.insert("admin.joinman");
		}else{
		return sqlTemplate.insert("admin.joinwoman");
	}}

	public int insertData() {
		return sqlTemplate.insert("admin.visit");
	}


	public String selectPubName(String id) {
		return sqlTemplate.selectOne("pub.selectOneId", id);
	}
	
	
	
	
}
