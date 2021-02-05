package member.dao;

import java.util.List;
import java.util.Map;

import board.bean.ItemDTO;
import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;

public interface MemberDAO {

	public MemberDTO login(Map<String, String> map);

	public int write(MemberDTO memberDTO);

	public MemberDTO checkId(String userId);

	public List<ZipcodeDTO> checkPostSearch(Map<String, String> map);

	public int GetKey(String userId, String user_key);

	public int regSuccess(String userId, String key);

	public int checkKakaoId(String kakaoId);

	public int kakaoWrite(MemberDTO memberDTO);
	
	public void sellerWrite(ItemDTO itemDTO);

	public List<ZipcodeDTO> searchlocation(String address);


}
