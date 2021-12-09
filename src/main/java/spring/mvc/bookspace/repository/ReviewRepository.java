package spring.mvc.bookspace.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.bookspace.dto.BookDTO;
import spring.mvc.bookspace.dto.ReviewDTO;

@Repository
public class ReviewRepository {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Object> revSelectList(ReviewDTO rcvRDto) {
		return sqlSessionTemplate.selectList("view.revSelectList", rcvRDto);
	}

	public void revDelete(ReviewDTO rDto) {
		sqlSessionTemplate.update("view.revDelete", rDto);
	}

	public void revUpdate(ReviewDTO rDto) {
		sqlSessionTemplate.update("view.revUpdate", rDto);
	}

	public ReviewDTO revSelectNum(ReviewDTO rDto) {
		return sqlSessionTemplate.selectOne("view.revSelectNum", rDto);
	}
	public List<ReviewDTO> selectRlist(String reviewBN) {
	
		return sqlSessionTemplate.selectList("view.selectRlist", reviewBN);
	}

	public List<Object> revStarSelect(ReviewDTO rDto) {
		return sqlSessionTemplate.selectList("view.revStarSelect", rDto);
	}

	public void bookStarUpdate(BookDTO bDto) {
		sqlSessionTemplate.update("view.bookStarUpdate", bDto);
	}

	public int recommendUpdate(Integer num) {
		return sqlSessionTemplate.update("view.recomUp", num);
	}

	public int complainUpdate(Integer num,String id) {
		sqlSessionTemplate.update("mem.complainUp",id);
	return sqlSessionTemplate.update("view.complainUp",num);
	}
	
}
