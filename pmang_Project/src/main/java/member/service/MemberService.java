package member.service;

import java.util.List;

import board.bean.ItemDTO;
import member.bean.ZipcodeDTO;

public interface MemberService {

	public void sellerWrite(ItemDTO itemDTO);

	public List<ZipcodeDTO> searchlocation(String address);

}
