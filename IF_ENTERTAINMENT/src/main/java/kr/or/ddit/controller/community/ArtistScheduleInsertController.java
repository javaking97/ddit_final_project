package kr.or.ddit.controller.community;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.service.community.IArtistScheduleSerivce;
import kr.or.ddit.vo.community.CalVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 아티스트 일정 등록 컨트롤러(관리자)
 * FullCalendar API 활용
 * @author 조재훈
 */
@Controller
@Slf4j
@RequestMapping("/community/artist/schedule")
public class ArtistScheduleInsertController {

	@Inject
	private IArtistScheduleSerivce scheduleService;
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value="/insert.do", method = RequestMethod.POST)
	public ResponseEntity<String> insert(@RequestBody CalVO calVO ,Model model) {
		log.info("asdf" + calVO);
		
		scheduleService.insert(calVO);
		

		
		return new ResponseEntity<String>("su",HttpStatus.OK);
	}
}
