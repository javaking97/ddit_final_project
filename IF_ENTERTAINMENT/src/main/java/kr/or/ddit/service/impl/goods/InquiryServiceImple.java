package kr.or.ddit.service.impl.goods;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.goods.IInquiryMapper;
import kr.or.ddit.service.goods.IInquiryService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.goods.goodsInquiryVO;

@Service
public class InquiryServiceImple implements IInquiryService {
	
	@Inject
	private IInquiryMapper inquiryMapper;

	@Override
	public int selectInquiryListCount(PaginationInfoVO<goodsInquiryVO> pagingVO) {
		return inquiryMapper.selectInquiryListCount(pagingVO);
	}

	@Override
	public List<goodsInquiryVO> selectInquiryList(PaginationInfoVO<goodsInquiryVO> pagingVO) {
		return inquiryMapper.selectInquiryList(pagingVO);
	}

	@Override
	public goodsInquiryVO selectInquiry(int giNo) {
		return inquiryMapper.selectInquiry(giNo);
	}

	@Override
	public ServiceResult updateInquiry(goodsInquiryVO goodsInquiryVO) {
		ServiceResult result = null;
		
		int status = inquiryMapper.updateInquiry(goodsInquiryVO);
		
		if (status > 0) {
			result = ServiceResult.OK;
		}else {
			result =ServiceResult.FAILED;
		}
		return result;
	}
	
	// 사용자
	
	@Override
	public int selectUserInquiryListCount(PaginationInfoVO<goodsInquiryVO> pagingVO) {
		return inquiryMapper.selectUserInquiryListCount(pagingVO);
	}

	@Override
	public List<goodsInquiryVO> selectUserInquiryList(PaginationInfoVO<goodsInquiryVO> pagingVO) {
		return inquiryMapper.selectUserInquiryList(pagingVO);
	}

	@Override
	public goodsInquiryVO selectUserInquiry(int giNo) {
		return inquiryMapper.selectUserInquiry(giNo);
	}

	@Override
	public ServiceResult goodsInquiryInsert(HttpServletRequest req, goodsInquiryVO goodsInquiryVO) {
		ServiceResult result = null;
		int status = inquiryMapper.goodsInquiryInsert(goodsInquiryVO);
		if (status > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

}
