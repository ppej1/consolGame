package global.sesoc.ConsolGame.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ConsolUser {
	String usernum;
	String userid;
	String  userpwd;
	String  birthdate;
	String username; 
	String email;
	String  tel1;
	String tel2;
	String tel3;
	String imageurl;
    int point; 
    int  userlevel;
    LendConsol lend;
}
