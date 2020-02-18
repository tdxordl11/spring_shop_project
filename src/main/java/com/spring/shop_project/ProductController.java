package com.spring.shop_project;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;




@Controller
public class ProductController {
	@Autowired
	ProductService service;
	SqlSession session;
	
	//jquery form을 이용한 멀티 업로드
	//DataBase 저장 시 Path를 ","를 구분자로 하여금 분리
	
	@ResponseBody
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String fileUpload(MultipartHttpServletRequest multipartHttpServletRequest) throws IOException {
		
		String dbsavepath = "";
		//파일경로
		//String filePath ="D:\\Upload\\";
        // 저장 경로 설정
    	String filePath= multipartHttpServletRequest.getRealPath("/resources/img/goods/");
		
		//파일들을 List형식으로 보관
		List<MultipartFile> files = multipartHttpServletRequest.getFiles("files");
		
		File file = new File(filePath);
		//파일이 없다면 디렉토리를 생성
		if (file.exists() == false) {
			file.mkdirs();
		}

		try {
			
			for (int i = 0; i < files.size(); i++) {
				System.out.println(files.get(i).getOriginalFilename() +" 업로드");
				
				//파일명 변경해서 업로드 (시간_파일명.확장자)
				
				String FileName = System.currentTimeMillis()+ "_" + files.get(i).getOriginalFilename();

				//파일 업로드 소스 여기에 삽입
				file = new File(filePath + FileName);
				files.get(i).transferTo(file);	
				
				dbsavepath += "/img/goods/"+FileName+",";
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return dbsavepath;
	}

	/*-------------------------------------------------*/

	
	@RequestMapping(value="/product", method=RequestMethod.GET)
	public ModelAndView pagingList() {
		ModelAndView mav = new ModelAndView();
		int param[] = new int[2];
		mav.addObject("productlist", service.pagingProduct(param));
		mav.setViewName("admin_productlist");
		
		return mav;
	}
	
	@RequestMapping("/admin/admin_productlist")
	public ModelAndView productList(@RequestParam(value="pagenum", required = false, defaultValue="1") int pagenum) {
		ModelAndView mav = new ModelAndView();
		int param[] = new int[2]; 
		param[0] = ((pagenum-1) * 10) + 1;
		param[1] = pagenum * 10;
		mav.addObject("productlist", service.pagingProduct(param));
		mav.setViewName("admin_productlist");
		/* System.out.println("상품 관리 페이지 호출"); */
		return mav;
	}
	
	@RequestMapping("/admin/admin_product_detail")
	public ModelAndView getProductdetail(@RequestParam(value = "product_id") String product_id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("productDetail", service.getProductdetail(product_id));
		mav.setViewName("admin_product_detail");
		/* System.out.println("상품 상세 정보 호출"); */
		return mav;
	}
	
	// 상품 추가 페이지
	@RequestMapping("/admin/admin_product_insert_page")
	public ModelAndView insertProductPage(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin_product_insert_page");
		return mav;
	}
	
	// 상품 추가 용휘꺼
//	@RequestMapping("/admin/admin_product_insert")
//	@ResponseBody
//	public ModelAndView insertProduct(ProductVO vo) {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("productInsert", service.insertProduct(vo));
//		mav.setViewName("redirect:/admin/main?menu=admin_productlist");
//		/* System.out.println("상품 추가"); */
//		session.commit();
//		/* System.out.println("Auto Commit"); */
//		return mav;
//	}

	// 상품 추가 찐
	@RequestMapping(value="/admin/admin_product_insert" , method = RequestMethod.POST)
	@ResponseBody
	public void insertProduct(ProductVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		SessionVO sessionVO = (SessionVO)session.getAttribute("session");
		PrintWriter out;
		
		int level = Integer.parseInt(sessionVO.getAuthlevel());
			
			if(level >= 1) {
				service.insertProduct(vo);
				response.setContentType("text/html; charset=UTF-8");
				try {
					out = response.getWriter();
					out.println("<script>alert('상품추가 되었습니다'); location.href='"+request.getContextPath()+"/admin/main?menu=admin_productlist'</script>");	 
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
			 //실패시
				response.setContentType("text/html; charset=UTF-8");
				try {
					out = response.getWriter();
					out.println("<script>alert('권한이 없습니다.'); location.href='"+request.getContextPath()+"/admin/main?menu=admin_productlist'</script>");	 
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
		}
	}
	
	// 상품 삭제
	@RequestMapping("/admin/admin_product_delete")
	public ModelAndView deleteProduct(@RequestParam(value = "product_id") String product_id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("productDelete", service.deleteProduct(product_id));
		mav.setViewName("redirect:/admin/main?menu=admin_productlist");
		/* System.out.println("제거된 상품 코드 : "+ product_id ); */
		return mav;
	}
	
	// 상품 수정 페이지
	@RequestMapping("/admin/admin_product_modify_page")
	public ModelAndView modifyProductPage(@RequestParam(value="product_id") String product_id) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.addObject("productModifyPage", service.getProductdetail(product_id));
		mav.setViewName("admin_product_modify_page");
		/* System.out.println("상품 수정 페이지 호출"); */
		return mav;
	}
	
	// 상품 수정 용휘꺼
//	@RequestMapping("/admin/admin_product_modify")
//	@ResponseBody
//	public ModelAndView modifyProduct(ProductVO vo){
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("productModify", service.modifyProduct(vo));
//		mav.setViewName("redirect:/admin/main?menu=admin_productlist");
//		/* System.out.println("상품 수정"); */
//		session.commit();
//		System.out.println("Auto Commit");
//		return mav;
//	}
	
	// 상품 수정 찐
	@RequestMapping(value="/admin/admin_product_modify", method = RequestMethod.POST)
	@ResponseBody
	public void modifyProduct(ProductVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response){
		SessionVO sessionVO = (SessionVO)session.getAttribute("session");
		PrintWriter out;
		
		int level = Integer.parseInt(sessionVO.getAuthlevel());
			
			if(level >= 1) {
				service.modifyProduct(vo);
				response.setContentType("text/html; charset=UTF-8");
				try {
					out = response.getWriter();
					//out.println("<script>alert('수정 되었습니다'); location.href='"+request.getContextPath()+"/admin/main?menu=admin_productlist'</script>");	 
					out.println("<script>alert('수정 되었습니다'); opener.location.reload();window.close();</script>");
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
			 //실패시
				response.setContentType("text/html; charset=UTF-8");
				try {
					out = response.getWriter();
					//out.println("<script>alert('권한이 없습니다.'); location.href='"+request.getContextPath()+"/admin/main?menu=admin_productlist'</script>");	 
					out.println("<script>alert('수정 되었습니다'); opener.location.reload();window.close();</script>");
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
		}
	}
	
		
}
