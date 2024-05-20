package kr.or.ddit.service.impl.goods;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.mapper.goods.IOrderMapper;
import kr.or.ddit.service.goods.IOrderService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.goods.OrderDetailVO;
import kr.or.ddit.vo.goods.OrderIssueVO;
import kr.or.ddit.vo.goods.OrderVO;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class OrderServiceImpl implements IOrderService {

	@Inject
	private IOrderMapper orderMapper;

	@Override
	public int selectOrderListCount(PaginationInfoVO<OrderVO> pagingVO) {
		return orderMapper.selectOrderListCount(pagingVO);
	}

	@Override
	public List<OrderVO> selectOrderList(PaginationInfoVO<OrderVO> pagingVO) {
		return orderMapper.selectOrderList(pagingVO);
	}

	@Override
	public List<OrderDetailVO> selectOrderDetailList(OrderDetailVO orderDetailVO) {
		return orderMapper.selectOrderDetailList(orderDetailVO);
	}

	@Override
	@Transactional(rollbackFor = {RuntimeException.class, IOException.class})
	public ServiceResult insertGoodsIssue(OrderIssueVO orderIssueVO) {
		ServiceResult result = null;
		
		String orderNo = orderIssueVO.getOrderNo();
		List<OrderDetailVO> orderDetailNoList = orderMapper.selectOrderDetailNoList(orderNo);
		
		orderMapper.updateDelivery(orderNo);
		for (OrderDetailVO orderDetailVO : orderDetailNoList) {
			
			orderIssueVO.setOdNo(orderDetailVO.getOdNo());
			int status = orderMapper.insertGoodsIssue(orderIssueVO);
			if (status > 0) {
				orderMapper.updateodStatus(orderDetailVO.getOdNo());
				
				orderMapper.updategoodsQuantityConuntPlus(orderDetailVO);
				result = ServiceResult.OK;
			} else {
				result = ServiceResult.FAILED;
			}
		}
		return result;
	}

	@Override
	@Transactional(rollbackFor = {RuntimeException.class, IOException.class})
	public ServiceResult insertIssueChange(HttpServletRequest req, OrderIssueVO orderIssueVO) {
		ServiceResult result = null;
		
		String IssueImg = null;
		
		try {
			IssueImg = issueFileUpload(orderIssueVO.getOrderIssuefile(), orderIssueVO, req);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		orderIssueVO.setGuiSavepath(IssueImg);
		
		int status = orderMapper.insertIssueChange(orderIssueVO);
		if (status > 0) {
			orderMapper.updateOrderStatus(orderIssueVO.getOdNo());
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	
	@Override
	public int selectOrderIssueListCount(PaginationInfoVO<OrderIssueVO> pagingVO) {
		return orderMapper.selectOrderIssueListCount(pagingVO);
	}

	@Override
	public List<OrderIssueVO> selectOrderIssueList(PaginationInfoVO<OrderIssueVO> pagingVO) {
		return orderMapper.selectOrderIssueList(pagingVO);
	}
	
	private String issueFileUpload(MultipartFile orderIssuefile, OrderIssueVO orderIssueVO, HttpServletRequest req) throws Exception {
		String savePath = "/resources/goodsissue/";
		
		String saveLocate = null;
		if (orderIssuefile != null) {
			String saveName = UUID.randomUUID().toString();
			saveName += "_" + orderIssueVO.getOrderIssuefile().getOriginalFilename();
			
			saveLocate = req.getServletContext().getRealPath(savePath);
			
			File file = new File(saveLocate);
			if (!file.exists()) {
				file.mkdirs();
			}
			
			saveLocate += saveName;
			
			File saveFile = new File(saveLocate);
			orderIssueVO.getOrderIssuefile().transferTo(saveFile);
			
			savePath += saveName;
		}
		return savePath;
	}

	@Override
	public int selectAllorderCancelListCount(PaginationInfoVO<OrderVO> pagingVO) {
		return orderMapper.selectAllorderCancelListCount(pagingVO);
	}

	@Override
	public List<OrderVO> selectAllorderCancelList(PaginationInfoVO<OrderVO> pagingVO) {
		return orderMapper.selectAllorderCancelList(pagingVO);
	}

	@Override
	public int selectAllOrderChangeListCount(PaginationInfoVO<OrderVO> pagingVO) {
		return orderMapper.selectAllOrderChangeListCount(pagingVO);
	}

	@Override
	public List<OrderVO> selectAllorderChangeList(PaginationInfoVO<OrderVO> pagingVO) {
		return orderMapper.selectAllorderChangeList(pagingVO);
	}

	@Override
	@Transactional(rollbackFor = {RuntimeException.class, IOException.class})
	public ServiceResult updateOrderIssueChange(OrderIssueVO orderIssueVO) {
		ServiceResult result = null;
		
		int status = orderMapper.updateOrderIssueChange(orderIssueVO);
		if (status > 0) {
			orderMapper.updateOrderStatusChange(orderIssueVO.getOdNo());
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public int selectOrderDeliveryListCount(PaginationInfoVO<OrderVO> pagingVO) {
		return orderMapper.selectOrderDeliveryListCount(pagingVO);
	}

	@Override
	public List<OrderVO> selectOrderDeliveryList(PaginationInfoVO<OrderVO> pagingVO) {
		return orderMapper.selectOrderDeliveryList(pagingVO);
	}


	@Override
	public ServiceResult updateDeliverycomplate(OrderVO orderVO) {
		ServiceResult result = null;
		
		int status = orderMapper.updateDeliverycomplate(orderVO);
		if (status > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult updateDeliverycomplate(List<OrderVO> orderList) {
		
		ServiceResult result = null;
		
		for (OrderVO orderVO : orderList) {
			int status = orderMapper.updateDeliverycomplate(orderVO);
			if (status > 0) {
				result = ServiceResult.OK;
			} else {
				result = ServiceResult.FAILED;
			}
		}
		return result;
	}


}
