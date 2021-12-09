package spring.mvc.bookspace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.bookspace.dto.BoardDTO;
import spring.mvc.bookspace.repository.BoardRepository;

@Service
public class BoardService extends DefaultTransactionDefinition {

	@Autowired
	private PlatformTransactionManager tx;

	private TransactionStatus status;

	@Autowired
	private BoardRepository repository;

	public List<Object> selectList(String type, Object object) {
		List<Object> list = null;
		if (type.equals("msg")) {
			list = repository.selecMsgtList((BoardDTO) object);
		} else if (type.equals("QnA")) {
			list = repository.selectBoardList((String) object);
		}
		return list;
	}

	public int deleteQnA(BoardDTO dto) {
		return repository.QnADelete(dto);
	}

	public int updateBoard(String path, Object param) {
		status = tx.getTransaction(this);
		int res = 0;
		if (param == null) {
			res = repository.updateBoard(path);
		} else {
			res = repository.updateBoard(path, param);
		}
		if (res > 0) {
			tx.commit(status);
		} else {
			tx.rollback(status);
		}
		return res;

	}

	public int insertBoard(String type, Object param) {
		int res = 0;
		status = tx.getTransaction(this);
		if (type.equals("msg")) {
			res = repository.insertMsg((BoardDTO)param);
		} else {
			res = repository.insertBoard(type, param);
		}
		repository.setGroupnum(); 
		if (res > 0) {
			tx.commit(status);
		} else {
			tx.rollback(status);
		}
		return res;
	}

	public Object selectBoard(String path, BoardDTO dto) {
		return repository.selectBoard(path, dto);
	}

}
