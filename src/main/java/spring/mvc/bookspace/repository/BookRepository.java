package spring.mvc.bookspace.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.bookspace.dto.BookDTO;
import spring.mvc.bookspace.dto.BookRegDTO;
import spring.mvc.bookspace.dto.OfficialDTO;

@Repository
public class BookRepository {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<OfficialDTO> selectList() {
		return sqlSessionTemplate.selectList("board.offList");
	}

	public List<BookDTO> best() {
		return sqlSessionTemplate.selectList("book.best");
	}

	public List<BookDTO> newB() {
		return sqlSessionTemplate.selectList("book.newB");
	}

	public List<BookDTO> magz() {
		return sqlSessionTemplate.selectList("book.magz");
	}

	public List<BookDTO> cartoon() {
		return sqlSessionTemplate.selectList("book.cartoon");
	}

	public List<BookDTO> selectList(String a) {
		return sqlSessionTemplate.selectList("book.list", a);
	}
	public List<BookDTO> selectMainList(String a) {
		return sqlSessionTemplate.selectList("book.listmain", a);
	}

	public List<BookDTO> search(String a) {
		return sqlSessionTemplate.selectList("book.search", a);
	}

	public List<BookDTO> bestOne() {
		return sqlSessionTemplate.selectList("book.bestOne");
	}

	public BookDTO selectOne(Integer num) {
		return sqlSessionTemplate.selectOne("book.selectOne", num);
	}

	public List<BookDTO> selectInfo(int num) {
		return sqlSessionTemplate.selectList("book.selectinfo", num);
	}


	public List<Object> corpList(String id) { 
		String name = sqlSessionTemplate.selectOne("pub.selectOneId", id);
		return sqlSessionTemplate.selectList("book.corpList", name);
	}
	
	public List<Object> corpRegList(String id,String state) { 
		String name = sqlSessionTemplate.selectOne("pub.selectOneId", id);
		BookRegDTO dto=new BookRegDTO();
		dto.setPublisher(name);
		dto.setState(state);
		return sqlSessionTemplate.selectList("book.corpregList", dto);
	}
	
	public String publishName(String id){
		return sqlSessionTemplate.selectOne("pub.selectOneId", id);
	}

	public int bookDelete(int num) {
		return sqlSessionTemplate.delete("book.delete", num);
	}

	public int insertOne(BookRegDTO dto) {
		return sqlSessionTemplate.insert("book.insertOne", dto);

	}

	public BookDTO findBookNum(String bookname) {
		return sqlSessionTemplate.selectOne("book.findBookNum", bookname);
	}
	public BookDTO detailAll(Integer num) {
		return sqlSessionTemplate.selectOne("book.detailAll", num);
	}
	
	public BookDTO DeleteCk(Integer num) {
		return sqlSessionTemplate.selectOne("book.deleteck", num);
	}
	public BookRegDTO detailView(Integer num) {
		return sqlSessionTemplate.selectOne("book.detailView", num);
	}
	public List<Object> dubcheck(String bookname) {
		return sqlSessionTemplate.selectList("book.dubcheck", bookname);
	}
	public List<Object> dubdelete(String bookname) {
		return sqlSessionTemplate.selectList("book.dubdelete", bookname);
		
	}

}