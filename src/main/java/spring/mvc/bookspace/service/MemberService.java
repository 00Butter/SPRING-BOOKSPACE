package spring.mvc.bookspace.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import spring.mvc.bookspace.dto.MemberDTO;
import spring.mvc.bookspace.dto.PublisherDTO;
import spring.mvc.bookspace.repository.LoginRepository;
import spring.mvc.bookspace.repository.MemberRepository;
@Service
public class MemberService extends DefaultTransactionDefinition{

	
	
	@Autowired
	private LoginRepository repository;
	
	@Autowired
	private MemberRepository memrepository;
	@Autowired
	private PlatformTransactionManager tx;

	private TransactionStatus status;
	
	public int insertOne(String type,Object param){
		int res=0;
		status=tx.getTransaction(this);
		if(type.equals("pub")){
			res=repository.insertPub((PublisherDTO)param);
		}else if(type.equals("log")){
			res=repository.insertLog((PublisherDTO)param);
		}else if (type.equals("mem")) {
			res = repository.insertPeo((MemberDTO) param);
		}else if(type.equals("logmem")){
			res=memrepository.insertLog((MemberDTO)param);
		}else if(type.equals("joindata")){
			res=repository.insertData((String)param);
		}else if(type.equals("visit")){
			res=repository.insertData();
		}
		
		
		

		if(res>0){
			tx.commit(status);
		}else{
			tx.rollback(status);
		}
		
		return res;
		
	}
	
	
	
	public int deleteOne(String type, MemberDTO dto) {
		
		int res = 0;
		status = tx.getTransaction(this);
		if(type!=null && dto != null){
			res = memrepository.deleteOne("mem.deleteOne",dto);
			if(res>0){
				
				memrepository.deleteOne("view.delRev", dto);
				memrepository.deleteOne("pay.cartDeleteAll", dto);
				memrepository.deleteOne("pay.deleteCash", dto);
				memrepository.deleteOne("pay.payDel", dto);
				res=memrepository.deleteOne("mem.deleteLog", dto);
				
			}
		}
		
		
		if(res>0){
			tx.commit(status);
		}else{
			tx.rollback(status);
		}
		
		return res;
	}
	public MemberDTO selectOne1(String type, Object param) { 
		if(type.equals("findOne1")){ 
			return memrepository.selectFind1((MemberDTO)param);
		} 
		
		return null;
	}
	
	public MemberDTO selectOne2(String type, Object param) { 
		if(type.equals("findOne2")){ 
			return memrepository.selectFind2((MemberDTO)param);
		} 
		
		return null;
	}

}
