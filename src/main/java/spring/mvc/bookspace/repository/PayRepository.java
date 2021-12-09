package spring.mvc.bookspace.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.bookspace.dto.BookDTO;
import spring.mvc.bookspace.dto.CartDTO;
import spring.mvc.bookspace.dto.CashDTO;
import spring.mvc.bookspace.dto.MemberDTO;
import spring.mvc.bookspace.dto.PaymentDTO;
import spring.mvc.bookspace.dto.PublisherDTO;
import spring.mvc.bookspace.dto.ReviewDTO;

@Repository
public class PayRepository {
   
   @Autowired
   private SqlSessionTemplate sqlSessionTemplate;
   
   public Object selectOne(String path,Object param){
	   return sqlSessionTemplate.selectOne(path, param);
   }
   
   public int insertOne(String path,Object param){
	   return sqlSessionTemplate.insert(path, param);
   }
   
   public List<Object> cartSelectList(MemberDTO dto) {
      return sqlSessionTemplate.selectList("pay.cartSelectList", dto);
   }

   public void cartDeleteOne(MemberDTO dto) {
      sqlSessionTemplate.delete("pay.cartDeleteOne", dto);
   }
   public void cartDeleteOne(CartDTO dto) {
	      sqlSessionTemplate.delete("pay.cartDeletebook", dto);
	   }
   public void cartDeleteAll(MemberDTO dto) {
      sqlSessionTemplate.delete("pay.cartDeleteAll", dto);
   }

   public MemberDTO selectCash(MemberDTO dto) {
      return sqlSessionTemplate.selectOne("pay.selectCash", dto);
   }

   public CartDTO cartPaymentOne(MemberDTO dto) {
      return sqlSessionTemplate.selectOne("pay.cartPaymentOne", dto);
   }

	public void cashUpdate(MemberDTO dto) {
		sqlSessionTemplate.update("pay.cashUpdate", dto);
	}

	public BookDTO getOneBookSelect(CartDTO cDto) {
		return sqlSessionTemplate.selectOne("pay.getOneBookSelect", cDto);
	}

	public void paymentInsertOne(PaymentDTO pDto) {
		sqlSessionTemplate.insert("pay.paymentInsertOne", pDto);
	}

	public List<Object> buySelectList(MemberDTO mDto) {
		return sqlSessionTemplate.selectList("pay.buySelectList", mDto);
	}

	public void cashInsert(CashDTO cDto) {
		sqlSessionTemplate.insert("pay.cashInsert", cDto);
	}

	public List<Object> cashSelectList(MemberDTO mDto) {
		return sqlSessionTemplate.selectList("pay.cashSelectList", mDto);
	}

	public void revInsert(ReviewDTO rDto) {
		sqlSessionTemplate.insert("pay.revInsert", rDto);
	}
	
	public int insertOne(CartDTO dto) {
		return sqlSessionTemplate.insert("pay.insertOne", dto);
	}

	public CartDTO check(CartDTO dto) { 
		return sqlSessionTemplate.selectOne("pay.check", dto); 
	}
	
	public PaymentDTO checkbook(CartDTO dto){
		return sqlSessionTemplate.selectOne("pay.checkBook", dto);
	}
	
	public BookDTO book(String bookname){
		return sqlSessionTemplate.selectOne("pay.book", bookname); 
	}

	public void memUpdateLebvel(MemberDTO mem) {
		sqlSessionTemplate.update("mem.updateLevel", mem);
		
	}
}