package kr.or.ddit.service.impl.common;

import java.io.IOException;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.mapper.common.IMypageMapper;
import kr.or.ddit.service.common.IMypageService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.UserVO;

@Service
public class MypageServiceImpl implements IMypageService {

	@Inject
	private IMypageMapper mypageMapper;

	@Override
	public void updateProfile(Map<String, Object> map) {
		mypageMapper.updateProfile(map);
	}

	@Override
	public UserVO selectUserMypage(int userNo) {
		return mypageMapper.selectUserMypage(userNo);
	}
	
	@Transactional(rollbackFor = {RuntimeException.class, IOException.class})
	@Override
	public ServiceResult myPagePasswordUpdate(HttpServletRequest req, UserVO userVO) {
		ServiceResult result = null;
		int status = mypageMapper.myPagePasswordUpdate(userVO);
		if (status > 0) {	// 수정 성공
			// 수정 성공시 알림 설정도 업데이트
			mypageMapper.myPageNoticeSettingUpdate(userVO);
			mypageMapper.myPagememberNotificationUpdate(userVO);
			// 수정 성공시 알림 수신여부도 업데이트
			result = ServiceResult.OK;
		} else {			// 수정 실패
			result = ServiceResult.FAILED;
		}
		return result;
	}
	
	@Override
	public ServiceResult deleteMyForm(int userNo) {
		ServiceResult result = null;
		int status = mypageMapper.deleteMyForm(userNo);
		if (status > 0) {	// 삭제 성공
			result = ServiceResult.OK;
		} else {			// 삭제 실패
			result = ServiceResult.FAILED;
		}
		return result;
	}

}
