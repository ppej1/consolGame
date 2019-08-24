package global.sesoc.ConsolGame.dao;

import java.util.List;
import java.util.Map;

import global.sesoc.ConsolGame.dto.ConsolUser;

public interface MemberMapper {

	int insertMember(ConsolUser user);

	ConsolUser selectOneUser(ConsolUser user);

	int updateUser(ConsolUser user);

	ConsolUser confirmUserId(ConsolUser user);

	List<ConsolUser> selectAllUser(Map<String, Object> map);

}
