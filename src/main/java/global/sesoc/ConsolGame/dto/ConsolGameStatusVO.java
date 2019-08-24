package global.sesoc.ConsolGame.dto;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ConsolGameStatusVO {
	int gamenum;
	String gametitle;
	String production;
	String content;
	String imageurl; 
	String genre;
	String typename;
	String status;
	String username; 
}
