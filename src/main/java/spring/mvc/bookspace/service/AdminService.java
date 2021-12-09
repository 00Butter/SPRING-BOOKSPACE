package spring.mvc.bookspace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.bookspace.dto.AdminDTO;
import spring.mvc.bookspace.dto.BoardDTO;
import spring.mvc.bookspace.dto.MemberDTO;
import spring.mvc.bookspace.dto.PublisherDTO;
import spring.mvc.bookspace.repository.AdminRepository;
import spring.mvc.bookspace.repository.BoardRepository;
import spring.mvc.bookspace.repository.LoginRepository;
import spring.mvc.bookspace.repository.PublisherRepository;

@Service
public class AdminService extends DefaultTransactionDefinition{
	
	@Autowired
	private AdminRepository repository;

	@Autowired
	private PlatformTransactionManager tx;

	private TransactionStatus status;
	
	
	public Object selectOne(String type,Object params){
		if(params!=null){
			return repository.selectOne(type, params);
		}else if(params instanceof Integer){
			return repository.selectOne(type,(Integer)params);
		}
		return repository.selectOne(type);
	}
	
	public int insertOne(String path,Object dto){
		int res=0;
		status=tx.getTransaction(this);
		res=repository.insertOne(path, dto);
		if(res>0){
			tx.commit(status);
		}else{
			tx.rollback(status);
		}
		return res;
	}
	
	public int deleteOne(String path,Object params){
		int res=0;
		status=tx.getTransaction(this);
		
	
			res=repository.deleteOne(path, params);
		
		if(res>0){
			tx.commit(status);
		}else{
			tx.rollback(status);
		}
		return res;
	}


	public List<Object> selectList(String path,Object params) {
		List<Object> list=null;
		if(params==null){
			list=repository.selectList(path);
		}else{
			list=repository.selectListSearch(path, params);
		}
		return list;
	}


	public int updateOne(String path, Object params) {
		int res=0;
		status=tx.getTransaction(this);
		
		res=repository.updateOne(path, params);
		if(res>0){
			tx.commit(status);
		}else{
			tx.rollback(status);
		}
		return res;
	}
	
	
	
}
