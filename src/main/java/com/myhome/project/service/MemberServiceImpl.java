package com.myhome.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.myhome.project.dao.MemberDao;
import com.myhome.project.model.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDao dao;

	@Override
	public int insert(Member member) {
		
		return dao.insert(member);
	}

	@Override
	public int idCheck(String id) {
		
		Member member = dao.idCheck(id);
		
		int result = -1;
		if(member != null) {
			result = 1;
		}
		
		return result;
	}

	@Override
	public int nicknameCheck(String nickname) {
		Member member = dao.nicknameCheck(nickname);
		
		int result = -1;
		if(member != null) {
			result = 1;
		}
		return result;
	}
	
	@Override
	public Member userCheck(String id){
		return dao.userCheck(id);
		
	}
	
	@Override
	public int memberUpdateOk(Member member) {
		return dao.memberUpdateOk(member);
	}

	@Override
	public Member getMember(String id) {
		return dao.getMember(id);
	}

	@Override
	public Member findId(String name) {
		return dao.findId(name);
	}
	
	public Member findpw(Member member) {
		return dao.findpw(member);
	}

	@Override
	public Member emailCheck(Member member) {
		return dao.emailCheck(member);
	}
	
	@Override
	public void pwUpdate(Member member) {
		dao.pwUpdate(member);
	}
	
	@Override
	public void memberDelete(Member member) {
		dao.memberDelete(member);
	}
	
	// kakao
	@Override
	public int insertKakao(Member member) {
		return dao.insertKakao(member);
	}

	@Override
	public Member KakaoUserCheck(String member_id) {
		return dao.KakaoUserCheck(member_id);
	}

	@Override
	public Member isLogin(String id,String pw) {
        Member member = dao.userCheck(id);
        
        if (member != null && member.getMember_pw().equals(pw)) {
            // 로그인 성공
            return member;
        } else {
            // 로그인 실패
            return null;
        }
    }




	
	
	
}









