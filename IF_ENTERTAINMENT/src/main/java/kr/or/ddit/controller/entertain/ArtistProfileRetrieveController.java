package kr.or.ddit.controller.entertain;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.service.entertain.IArtistService;
import kr.or.ddit.vo.entertain.AlbumVO;
import kr.or.ddit.vo.entertain.ArtistGroupVO;
import kr.or.ddit.vo.entertain.ArtistVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 아티스트 프로필 조회 컨트롤러
 * @author 조재훈
 */
@Controller
@Slf4j
@RequestMapping("/entertain/artist/profile")
public class ArtistProfileRetrieveController {
	
	@Autowired
	private IArtistService artistService;

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/artistDetail.do", method = RequestMethod.GET)
	public String artistDetail(Model model, String agId) {
		ArtistGroupVO artistGroupVO = artistService.profileList(agId);
		List<ArtistVO> artistList = artistService.artistSelect(agId);
		List<AlbumVO> albumList = artistService.albumList(agId); 
		
		model.addAttribute("albumList", albumList);
		model.addAttribute("profile",artistGroupVO);
		model.addAttribute("artistList",artistList);
		
		return "admin/entertain/artistDetail";
		
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value="/test.do", method = RequestMethod.GET)
	public String test(String agId) {
		return "admin/entertain/artistDetail";
	}
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String profileList(Model model, String agId) {
		ArtistGroupVO artistGroupVO = artistService.profileList(agId);
		List<ArtistVO> artistList = artistService.artistSelect(agId);
		
		log.info("artistList" + artistList);
		model.addAttribute("profile",artistGroupVO);
		model.addAttribute("artistList",artistList);
		return "entertain/artistProfile";
	}

	@RequestMapping(value = "/artistList.do", method = RequestMethod.GET)
	public String artistList(Model model) {
		List<ArtistGroupVO> artistList = artistService.artistList();
		log.info("artistList --> " + artistList);
		model.addAttribute("artist",artistList);
		
		return "entertain/artistList";
	}
	
}