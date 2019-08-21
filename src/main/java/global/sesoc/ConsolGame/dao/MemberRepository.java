package global.sesoc.ConsolGame.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.ConsolGame.dto.ConsolUser;

@Repository
public class MemberRepository {
	@Autowired
	SqlSession session;

	public int insertMember(ConsolUser user) {
		MemberMapper mapper  = session.getMapper(MemberMapper.class);
		
		return mapper.insertMember(user);
	}


	public ConsolUser selectOneUser(ConsolUser user) {
		MemberMapper mapper  = session.getMapper(MemberMapper.class);
		
		return mapper.selectOneUser(user);
	}


	public int updateUser(ConsolUser user) {
		MemberMapper mapper  = session.getMapper(MemberMapper.class);
		if (user.getImageurl().equals("")) {
			user.setImageurl(null);
		}
		return mapper.updateUser(user);
	}


}
