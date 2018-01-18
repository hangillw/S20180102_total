package oracle.java.s20180102.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;  // 
import org.springframework.stereotype.Repository;

import oracle.java.s20180102.model.MemberDto;
import oracle.java.s20180102.model.PagingDto;

@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSession session;

	@Override
	public MemberDto selMember(String id) {
		return session.selectOne("selMember", id);
	}
	
	@Override
	public int totalMember() {
		return session.selectOne("totalMember");
	}

	@Override
	public List<MemberDto> selMemberList(PagingDto pDto) {
		return session.selectList("selMemberList",pDto);
	}
	
	@Override
	public int changePw(MemberDto memberDto) {
		return session.update("changePw",memberDto);
	}

	@Override
	public int changePwConfirm(MemberDto memberDto) {
		return session.selectOne("checkPw",memberDto);
	}

	@Override
	public void upPoint(MemberDto mbDto) {
		session.update("upPoint", mbDto);
	}

	@Override
	public void delMember(String ID) {
		session.delete("delMember", ID);
	}

	@Override
	public void upMember(MemberDto mbDto) {
		session.update("upMember", mbDto);
	}
	@Override
	public int inMember(MemberDto mbDto) {
		return session.insert("inMember",mbDto);
	}



}