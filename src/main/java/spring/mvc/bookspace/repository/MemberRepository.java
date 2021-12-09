
package spring.mvc.bookspace.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.bookspace.dto.BookDTO;
import spring.mvc.bookspace.dto.MemberDTO;
import spring.mvc.bookspace.dto.PaymentDTO;

@Repository
public class MemberRepository {

	@Autowired
	private SqlSession sqlTemplate;

	public Object selectOne(Integer num) {
		return sqlTemplate.selectOne("peo.selectOne", num);
	}
	public MemberDTO selectOne(MemberDTO dto) {
		dto.getId();
		dto.getPw();
		return sqlTemplate.selectOne("mem.selectOne", dto);
	}
	public int insertmem(MemberDTO dto) {
		return sqlTemplate.insert("mem.joinOne", dto);
	}

	public int insertLog(MemberDTO dto) {
		return sqlTemplate.insert("mem.insertlog", dto);
	}

	public int updateOne(MemberDTO dto) {// 회원수정하면서 추가됐어요
		int res =  sqlTemplate.update("mem.updateOne", dto);
		if(res > 0){
			return sqlTemplate.update("mem.updateLog", dto);
		}
		return 0;
	}
	
	public MemberDTO selectFind1(MemberDTO dto) {//아이디 비번찾기 하면서 추가해써요!!!!
		return sqlTemplate.selectOne("mem.findOne1", dto);
	}
	 
	public MemberDTO selectFind2(MemberDTO dto) {//아이디 비번찾기 하면서 추가해써요!!!!
		return sqlTemplate.selectOne("mem.findOne2", dto);
	}

	public Object selectBook(String path,Object param){
		return sqlTemplate.selectOne(path, param);
	}

	public int deleteOne(String path,MemberDTO dto) { //회원탈퇴 하면서 추가됐어요!
		return sqlTemplate.delete(path,dto);
	}
	public List<Object> selectList(String path,String id) {
		return sqlTemplate.selectList(path, id);
	}
	
	public List<BookDTO> selectBookList(String path,String id) {
		return sqlTemplate.selectList(path, id);
	}
	public int bookmark(PaymentDTO dto) {
		return sqlTemplate.update("mem.bookmark",dto);
	}


}