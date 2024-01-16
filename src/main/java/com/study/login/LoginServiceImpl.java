package com.study.login;

import com.study.login.vo.UserVO;
import com.study.member.dao.IMemberDao;
import com.study.member.vo.MemberVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class LoginServiceImpl implements ILoginService {

    @Inject
    IMemberDao memberDao;

    @Override
    public UserVO getUser(String id, String password) {
        MemberVO member = memberDao.getMember(id);
        if (member == null) {
            return null;
        }
        if (!StringUtils.equals(member.getMemPass(), password)) {
            return null;
        }

        // 보통 권한 테이블이 따로 존재하지만 복잡하므로 넘어감
        if (member.getMemId().equals("a004")) {
            UserVO user = new UserVO(member.getMemId(), member.getMemName(), member.getMemPass(), "MANAGER");
            return user;
        } else {
            UserVO user = new UserVO(member.getMemId(), member.getMemName(), member.getMemPass(), "MEMBER");
            return user;
        }


    }
}
