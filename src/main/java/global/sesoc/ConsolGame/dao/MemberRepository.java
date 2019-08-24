package global.sesoc.ConsolGame.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

		return mapper.updateUser(user);
	}


	public ConsolUser confirmUserId(ConsolUser user) {
		MemberMapper mapper  = session.getMapper(MemberMapper.class);

		return mapper.confirmUserId(user);
	}


	public List<ConsolUser> selectAllUser(ConsolUser user, String searchList, String searchItem) {
		MemberMapper mapper  = session.getMapper(MemberMapper.class);
		Map<String, Object> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchList", searchList);
		map.put("ConsolUser", user);
		return mapper.selectAllUser(map);
	}


}
