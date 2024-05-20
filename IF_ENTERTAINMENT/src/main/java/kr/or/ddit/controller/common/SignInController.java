package kr.or.ddit.controller.common;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.service.common.ISignService;
import lombok.extern.slf4j.Slf4j;

/**
 * 로그인 컨트롤러
 * @author 홍진영
 */
@Controller
@Slf4j
public class SignInController {

	@Inject
	private ISignService signService;
	
	@RequestMapping(value="/signin.do", method = RequestMethod.GET)
	private String signinForm () {
		return "commons/signinForm";
	}
	
}