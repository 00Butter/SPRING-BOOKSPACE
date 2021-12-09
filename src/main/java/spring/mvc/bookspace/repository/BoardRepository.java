package spring.mvc.bookspace.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.bookspace.dto.BoardDTO;
import spring.mvc.bookspace.dto.OfficialDTO;

@Repository
public class BoardRepository {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;


	public int insertOne(OfficialDTO d) {
		return sqlSessionTemplate.insert("board.insertOne", d);
	}
	
	public int setGroupnum (){
		return sqlSessionTemplate.update("board.setgroup");
	}
	
	public List<Object> selecMsgtList(BoardDTO dto) {
		return sqlSessionTemplate.selectList("board.msgList", dto);
	}

	public int insertMsg(BoardDTO dto){
		return sqlSessionTemplate.insert("board.msgInsert",dto);
	}

	public int insertBoard(String type, Object param) {
		return sqlSessionTemplate.insert(type, param);
	}

	public Object selectBoard(String path, BoardDTO dto) {
		return sqlSessionTemplate.selectOne(path, dto);
	}

	public int updateBoard(String path, Object param) {
		return sqlSessionTemplate.update(path, param);
	}
	public int updateBoard(String path) {
		return sqlSessionTemplate.update(path);
	}
	public List<Object> selectBoardList(String id) {
		return sqlSessionTemplate.selectList("board.QnAList", id);
	}

	public int QnADelete(BoardDTO dto) {
		return sqlSessionTemplate.delete("board.QnADel", dto);
	}
}
