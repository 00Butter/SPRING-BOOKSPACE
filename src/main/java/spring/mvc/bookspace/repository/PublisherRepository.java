package spring.mvc.bookspace.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.bookspace.dto.BoardDTO;

@Repository
public class PublisherRepository {
	
	
	@Autowired
	private SqlSession sqlTemplate; 
	
	public Object selectOne(Integer num){
		return sqlTemplate.selectOne("pub.selectOne", num);
	}
	
	public Object selectOne(String path,String param){
		return sqlTemplate.selectOne(path, param);
	}
	public Object selectOne(String path,Object obj){
		return sqlTemplate.selectOne(path, obj);
	}
	
	public List<Object> selectList(String search){
		return sqlTemplate.selectList("",search);
	}
	
	public int updateOne(String path,Object obj){
		return sqlTemplate.update(path, obj);
	}
	public List<BoardDTO> selectqna(BoardDTO dto) {
		return sqlTemplate.selectList("board.msgList",dto);
	}

	public List<Object> selectList(String path, Object params) {
		return sqlTemplate.selectList(path, params);
	}

}
