package walk.mvc.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import walk.mvc.member.model.vo.Member;

/**
 * 인터셉터(Interceptor)란?
 *  - 컨트롤러를 호출 하기 전/후에 요청과 응답을 가로채서 처리할수 있는 별도의 로직을 수행하는 역할 
 *  - HandlerInterceptorAdapter 상속하고, Bean으로 생성하여 등록시키면 사용할 수 있음 
 *  - Spring에서 필터 역할을 수행한다.
 * 
 * 필터와 인터셉터의 차이점
 *  - 필터는 Servlet 수행 이전에 실행되고 인터셉터는 컨트롤 수행 전에 실행된다. 
 *  - Servlet은 web.xml에서 정의하고 인터셉터는 servlet-context.xml에서 정의한다.
 *  
 * Servlet / 필터 / 인터셉터 실행 순서
 * Filter -> DispatcherServlet -> Interceptor(전처리) -> Controller -> Interceptor(후처리) 실행 순
 *
 */


public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	//컨트롤러가 호출되기 이전에 호출되는 메소드
	//return값: 컨트롤러의 수행 여부를 결정, false = 실행 안 함 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("preHandle()");
		
		Member loginMember = (Member) request.getSession().getAttribute("loginMember");
		if(loginMember == null ) {
			
			request.setAttribute("msg", "로그인 후 이용이 가능합니다.");
			request.setAttribute("location", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return false; //이후 컨트롤러 수행되지 않음
		}
		
		return super.preHandle(request, response, handler);
	}
	
	// postHandle: 컨트롤러가 호출 된 이후 호출되는 메소드 
		@Override
		public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
				ModelAndView modelAndView) throws Exception {
			
			System.out.println("postHandle()");
			
			super.postHandle(request, response, handler, modelAndView);
		}
		
		// afterCompletion: 컨트롤러 - View 전송이 끝난 이후 호출되는 메소드
		@Override
		public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
				throws Exception {
			System.out.println("afterCompletion()");
			super.afterCompletion(request, response, handler, ex);
		}
		

		// afterConcurrentHandlingStarted : 컨트롤러가 AJAX나 페이징을 직접 그릴때 afterCompletion 대신 호출하는 메소드
		@Override
		public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			System.out.println("afterConcurrentHandlingStarted()");
			super.afterConcurrentHandlingStarted(request, response, handler);
		}
}