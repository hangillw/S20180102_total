package oracle.java.s20180102.dao;

import java.util.List;

import oracle.java.s20180102.model.ReviewDto;

public interface ReviewDao {

	void inReview(ReviewDto revDto);                        // 후기 등록
	ReviewDto oneReview(ReviewDto revDto);                  // 하나의 후기 선택
	void upReview(ReviewDto revDto);                        // 후기 수정
	List<ReviewDto> oneReviewList(ReviewDto revDto);        // 하나의 후기에 달린 답변들
	void inComment(ReviewDto revDto);                       // 코멘트 등록
	void delReview(ReviewDto revDto);                       // 후기 삭제	
	void delComment(ReviewDto revDto);                      // 코멘트 삭제
	
	
	int total_Complete(ReviewDto reviewDto);
	List<ReviewDto> selReviewList(ReviewDto reviewDto);     // 후기리스트 
}