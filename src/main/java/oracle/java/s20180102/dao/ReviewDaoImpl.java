package oracle.java.s20180102.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20180102.model.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public void inReview(ReviewDto revDto) {
		session.insert("inReview",revDto);
	}

	@Override
	public ReviewDto oneReview(ReviewDto revDto) {
		return session.selectOne("oneReview",revDto);
	}

	@Override
	public void upReview(ReviewDto revDto) {
		session.update("upReview", revDto);
	}

	@Override
	public List<ReviewDto> oneReviewList(ReviewDto revDto) {
		System.out.println();
		return session.selectList("oneReviewList", revDto);
	}

	@Override
	public void inComment(ReviewDto revDto) {
		session.insert("inComment", revDto);
	}

	@Override
	public void delReview(ReviewDto revDto) {
		session.delete("delReview", revDto);
	}

	@Override
	public void delComment(ReviewDto revDto) {
		session.delete("delComment", revDto);
	}

	@Override
	public int total_Complete(ReviewDto reviewDto) {
		return session.selectOne("totalRevs",reviewDto);

	}

	@Override
	public List<ReviewDto> selReviewList(ReviewDto reviewDto) {
		return session.selectList("selReviewList", reviewDto);
	}

	

}
