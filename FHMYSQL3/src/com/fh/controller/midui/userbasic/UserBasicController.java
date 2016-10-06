package com.fh.controller.midui.userbasic;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.midui.love.LoveService;
import com.fh.service.midui.photo.PhotoService;
import com.fh.service.midui.userbasic.UserBasicService;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;

/** 
 * 类名称：UserBasicController
 * 创建人：FH 
 * 创建时间：2016-10-02
 */
@Controller
@RequestMapping(value="/userbasic")
public class UserBasicController extends BaseController {
	
	String menuUrl = "userbasic/list.do"; //菜单地址(权限用)
	@Resource(name="userbasicService")
	private UserBasicService userbasicService;
	
	@Resource(name="photoService")
	private PhotoService photoService;
	
	@Resource(name="loveService")
	private LoveService loveService;
	
	private static final String LOGINURL="midui/userbasic/userbasic_login";
	private static final String USERBASIC_ID="USERBASIC_ID";
	  
	/**
	 * 个人中心
	 * @return
	 */
	@RequestMapping(value="/goPersonIndex")
	public ModelAndView goPersonIndex(){
		ModelAndView mv = this.getModelAndView();
		try {
			PageData pd=userbasicService.getUserBasic();
			if(pd==null){
				mv.setViewName(LOGINURL);
			}else{
				mv.addObject("pd", pd);
				mv.setViewName("midui/userbasic/userbasic_personIndex");
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	

	/**
	 * 进入个人详情页面
	 * @return
	 */
	@RequestMapping(value="/goPerson")
	public ModelAndView goPerson(){
		ModelAndView mv = this.getModelAndView();
		try {
			PageData pd=userbasicService.getUserBasic();

				mv.addObject("pd", pd);
				mv.setViewName("midui/userbasic/userbasic_person");

		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**
	 * 个人详情页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/personInfo")
	@ResponseBody
	public Object personInfo() {
		ModelAndView mv = this.getModelAndView();
		JSONObject jsonObjectDetail = new JSONObject();
		JSONObject jsonObject = new JSONObject();
		PageData pd = new PageData();
		pd = this.getPageData();
		String uuId = pd.getString("USERBASIC_ID");
		try {
			pd = userbasicService.findPersonById(pd);
			jsonObjectDetail.put("detail", pd);
			Map<String, String> map = new HashMap<String, String>();
			// 如果没有登录
			Subject currentUser = SecurityUtils.getSubject();
			Session session = currentUser.getSession();
			String userbasic_id = (String) session.getAttribute("USERBASIC_ID");
			if (userbasic_id == null || "".equals(userbasic_id)) {
				map.put("isLiked", "false");
				map.put("likeCount", "0");
				map.put("isLoved", "false");
			} else {
				// 放入action
				// isLiked likeCount isLoved
				map.put("isLiked", "true");
				map.put("likeCount", "100");
				// 查询是否存在心动的
				PageData pdLove = new PageData();
				pdLove.put("FROMLOVEUSER", userbasic_id);
				pdLove.put("LOVEUSER", uuId);
				PageData lovepd = loveService.findByUserId(pdLove);
				if ((Long) lovepd.get("count") > 0) {
					map.put("isLoved", "true");
				} else {
					map.put("isLoved", "false");
				}
			}
			jsonObjectDetail.put("action", map);
			jsonObject.element("statusCode", "200");
			jsonObject.element("result", jsonObjectDetail);
			return new String(jsonObject.toString().getBytes("utf-8"),
					"iso-8859-1");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}
		return "";
	}
	
	/**
	 * 图片墙
	 * @return
	 */
	@RequestMapping(value="/goPhotoWall")
	public ModelAndView goPhotoWall(){
		ModelAndView mv = this.getModelAndView();
		try {
			PageData pd=userbasicService.getUserBasic();
			if(pd==null){
				mv.setViewName(LOGINURL);
			}else{
				
				PageData photoPD=new PageData();
				photoPD.put("USERID", pd.get(USERBASIC_ID));
				List<PageData> photoList=photoService.listAllByUserId(photoPD);
				 mv.addObject("pd", pd);
				 mv.addObject("varList", photoList);
				mv.setViewName("midui/userbasic/userbasic_photoWall2");
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	
	/**
	 * 图片上传
	 * @return
	 */
	@RequestMapping(value="/goPhotoLoad")
	public ModelAndView goPhotoLoad(){
		ModelAndView mv = this.getModelAndView();
		try {
			PageData pd=userbasicService.getUserBasic();
			if(pd==null){
				mv.setViewName(LOGINURL);
			}else{
				mv.addObject("pd", pd);
				mv.setViewName("midui/userbasic/userbasic_photoLoad");
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	 
	/**
	 * 保存图片
	 * @return
	 */
	@RequestMapping(value="/photoLoadSave")
	@ResponseBody
	public Object photoLoadSave(){
		JSONObject jsonObject=new JSONObject();
		try{
			PageData pd   = this.getPageData();
			if(pd.containsKey("headImg")){
				String headImg=pd.getString("headImg");
				String imgName= Base64Img.GenerateTOImage(headImg);
				PageData photo = new PageData();
				String photo_id=this.get32UUID();
				System.out.println(photo_id);
				       photo.put("PHOTO_ID",photo_id);	//主键
				       PageData loginUser=userbasicService.getUserBasic();
						photo.put("USERID",loginUser.get("USERBASIC_ID"));
						photo.put("PHOTOPATH",imgName);
						photo.put("NOTE1", "");	//备用1
						photo.put("NOTE2", "");	//备用2
						photo.put("NOTE3", "");	//备用3
						photo.put("NOTE4", "");	//备用4
				photoService.save(photo);
				jsonObject.element("code", "200");
				jsonObject.element("result",imgName);
			}
			 
		} catch(Exception e){
		    jsonObject.element("code", "500");
			e.printStackTrace();
		   logger.error(e.toString(), e);
		}
		return jsonObject.toString();
		
	}
	
	
	
	
	/**
	 * 登录
	 * @return
	 */
	@RequestMapping(value="/goLogin")
	public ModelAndView goLogin(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("midui/userbasic/userbasic_login");
			mv.addObject("msg", "login");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	 
	
	/**
	 *  
	 */
	@RequestMapping(value="/login")
	@ResponseBody
	public Object login(){
		Map<String,String> map = new HashMap<String,String>();
		String info="1";
		try{
			PageData pd = new PageData();
			     pd = this.getPageData();
		    PageData loginUser=userbasicService.findLogin(pd);
		    if(loginUser!=null){
		    	info="1";
		    	Subject currentUser = SecurityUtils.getSubject();  
				 Session session = currentUser.getSession();
				 session.setAttribute("USERBASIC_ID", loginUser.getString("USERBASIC_ID"));
				 session.setAttribute("USERNAME", loginUser.getString("USERNAME"));
				 session.setAttribute("PASSWORD", loginUser.getString("PASSWORD"));
				 
				 map.put("USERNAME", loginUser.getString("USERNAME"));
				 map.put("PASSWORD", loginUser.getString("PASSWORD"));
				 map.put("USERBASIC_ID", loginUser.getString("USERBASIC_ID"));
		    }else{
		    	info="0";	
		    }
		} catch(Exception e){
			info="0";
			logger.error(e.toString(), e);
		}
		map.put("result", info);		
		
		return  AppUtil.returnObject(new PageData(), map);
	}
	
	
	
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="/goZhuce")
	public ModelAndView goZhuce(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("midui/userbasic/userbasic_zhuce");
			mv.addObject("msg", "saveZhuce");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	 
	
	/**
	 *  
	 */
	@RequestMapping(value="/saveZhuce")
	@ResponseBody
	public Object saveZhuce(){
		Map<String,String> map = new HashMap<String,String>();
		try{
			PageData pd = new PageData();
			pd = this.getPageData();
			pd.put("USERBASIC_ID", this.get32UUID());	//主键
			 userbasicService.saveZhuce(pd);
			Subject currentUser = SecurityUtils.getSubject();  
			 Session session = currentUser.getSession();
			 session.setAttribute("USERBASIC_ID", pd.getString("USERBASIC_ID"));
			 session.setAttribute("USERNAME", pd.getString("USERNAME"));
			 session.setAttribute("PASSWORD", pd.getString("PASSWORD"));
			    map.put("USERNAME", pd.getString("USERNAME"));
				map.put("PASSWORD", pd.getString("PASSWORD"));
				map.put("USERBASIC_ID", pd.getString("USERBASIC_ID"));
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		System.out.println(AppUtil.returnObject(new PageData(), map));
		
		return  AppUtil.returnObject(new PageData(), map);
	}
	
	 
	
	/**
	 * 编辑个人信息
	 * @return
	 */
	@RequestMapping(value="/goEditDetail")
	public ModelAndView goEditDetail(){
		ModelAndView mv = this.getModelAndView();
		try {
			
			PageData pd=userbasicService.getUserBasic();
			if(pd==null){
				mv.setViewName(LOGINURL);
				mv.addObject("msg", "login");
			 
			  }else{
				  
					mv.setViewName("midui/userbasic/userbasic_editDetail");
					mv.addObject("msg", "editDetailSave");
					mv.addObject("pd", pd);
			  }
			  
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	
	/**
	 *  
	 */
	@RequestMapping(value="/editDetailSave")
	@ResponseBody
	public Object editDetailSave(){
		String result="0";
		JSONObject jsonObject = new JSONObject();
		try{
		 //HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest(); 
		 //HttpServletResponse resp = ((ServletWebRequest)RequestContextHolder.getRequestAttributes()).getResponse();
			PageData pd   = this.getPageData();
			if(pd.containsKey("headImg")){
				String headImg=pd.getString("headImg");
				result = Base64Img.GenerateTOImage(headImg);
				jsonObject.element("result",result);
				PageData HeadPD=new PageData();	
					HeadPD.put("HEADIMG",result);
					//System.out.println("------ZBF00000-----"+pd.get("USERBASIC_ID"));
					HeadPD.put("USERBASIC_ID",pd.get("USERBASIC_ID"));
				userbasicService.editHeadImg(HeadPD);
				
			}else{
				userbasicService.edit(pd);	
				jsonObject.element("statusCode", "200");
				jsonObject.element("result","1");
			}
			//pd.put("ISMARRIED", "");
			//System.out.println(pd.toString());
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		return jsonObject.toString();
	}
	
	
	
	@RequestMapping(value="/hasUserName")
	@ResponseBody
	public Object hasUserName(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "error";
		try{
		 PageData pd = this.getPageData();
			if(!userbasicService.findByUserName(pd)){
				errInfo = "success"; 
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
			e.printStackTrace();
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	 
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增UserBasic");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("USERBASIC_ID", this.get32UUID());	//主键
		pd.put("ADDTIME", "");	//添加时间
		pd.put("NOTE1", "");	//备注1
		pd.put("NOTE2", "");	//备注
		pd.put("NOTE3", "");	//备注
		pd.put("NOTE4", "");	//备注
		pd.put("NOTE5", "");	//备注
		pd.put("NOTE6", "");	//备注
		pd.put("NOTE7", "");	//备注
		pd.put("NOTE8", "");	//备注
		userbasicService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除UserBasic");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			userbasicService.delete(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, "修改UserBasic");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		userbasicService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表UserBasic");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>	varList = userbasicService.list(page);	//列出UserBasic列表
			mv.setViewName("midui/userbasic/userbasic_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
		logBefore(logger, "去新增UserBasic页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("midui/userbasic/userbasic_edit");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	/**
	 * 去首页
	 */
	@RequestMapping(value="/goIndex")
	public ModelAndView goIndex(){
		logBefore(logger, "去首页");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
		//	page.setPd(pd);

		//	List<PageData>	varList = userbasicService.list(page);	//列出UserBasic列表
			mv.setViewName("midui/userbasic/userbasic_index");
		//	mv.addObject("varList", varList);
			mv.addObject("pd", pd);
	//		mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 首页列表
	 */
	@RequestMapping(value="/indexList")
	@ResponseBody
	public String indexList(Page page){
		logBefore(logger, "列表UserBasic");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
        JSONObject jsonObject=new JSONObject();
        //响应到前台为utf-8
		try{
			pd = this.getPageData();
			System.out.println("page---------"+pd.get("page"));
			
			
			//设置当前登录用户ID
			pd.put("currentUserUUID","902e1877f6de49fbaa199fe5f7a648e3");
			page.setPd(pd);
			
			//设置当前页
			if(null!=pd.get("page")){
			page.setCurrentPage(Integer.parseInt((String) pd.get("page")));
			}
			
			
			JSONObject jsonObjectRem=new JSONObject();
			//今天推荐
			List<PageData>	varListToday = userbasicService.indexlist(page);
			
			//昨天推荐
			List<PageData>	varListYesterday = userbasicService.indexlist(page);
			
			//往期推荐
			List<PageData>	varListAgo = userbasicService.indexlist(page);	//列出UserBasic列表
			
			
			jsonObjectRem.put("today", varListToday);
			jsonObjectRem.put("yesterday", varListYesterday);
	        jsonObjectRem.put("ago", varListAgo);
			jsonObject.element("statusCode", "200");
			jsonObject.element("recommend",jsonObjectRem);
			jsonObject.element("page",page.getCurrentPage());

			return new String(jsonObject.toString().getBytes("utf-8"),"iso-8859-1") ;
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return "" ;
		}
	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		logBefore(logger, "去修改UserBasic页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = userbasicService.findById(pd);	//根据ID读取
			mv.setViewName("midui/userbasic/userbasic_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		logBefore(logger, "批量删除UserBasic");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				userbasicService.deleteAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/*
	 * 导出到excel
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(){
		logBefore(logger, "导出UserBasic到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("用户名");	//1
			titles.add("密码");	//2
			titles.add("真实姓名");	//3
			titles.add("性别");	//4
			titles.add("生日");	//5
			titles.add("城市");	//6
			titles.add("身高");	//7
			titles.add("学历");	//8
			titles.add("收入");	//9
			titles.add("职业");	//10
			titles.add("是否有婚姻史");	//11
			titles.add("一句话说明");	//12
			titles.add("头像");	//13
			titles.add("手机号");	//14
			titles.add("微信号");	//15
			titles.add("QQ");	//16
			titles.add("用户状态");	//17
			titles.add("添加时间");	//18
			titles.add("备注1");	//19
			titles.add("备注");	//20
			titles.add("备注");	//21
			titles.add("备注");	//22
			titles.add("备注");	//23
			titles.add("备注");	//24
			titles.add("备注");	//25
			titles.add("备注");	//26
			dataMap.put("titles", titles);
			List<PageData> varOList = userbasicService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("USERNAME"));	//1
				vpd.put("var2", varOList.get(i).getString("PASSWORD"));	//2
				vpd.put("var3", varOList.get(i).getString("REALNAME"));	//3
				vpd.put("var4", varOList.get(i).getString("SEX"));	//4
				vpd.put("var5", varOList.get(i).getString("BIRTHDAY"));	//5
				vpd.put("var6", varOList.get(i).getString("CITY"));	//6
				vpd.put("var7", varOList.get(i).getString("HIGHT"));	//7
				vpd.put("var8", varOList.get(i).getString("XUELI"));	//8
				vpd.put("var9", varOList.get(i).getString("SHOURU"));	//9
				vpd.put("var10", varOList.get(i).getString("WORKS"));	//10
				vpd.put("var11", varOList.get(i).getString("ISMARRIED"));	//11
				vpd.put("var12", varOList.get(i).getString("MYDESC"));	//12
				vpd.put("var13", varOList.get(i).getString("HEADIMG"));	//13
				vpd.put("var14", varOList.get(i).getString("PHONE"));	//14
				vpd.put("var15", varOList.get(i).getString("WEIXIN"));	//15
				vpd.put("var16", varOList.get(i).getString("QQ"));	//16
				vpd.put("var17", varOList.get(i).getString("STATUS"));	//17
				vpd.put("var18", varOList.get(i).getString("ADDTIME"));	//18
				vpd.put("var19", varOList.get(i).getString("NOTE1"));	//19
				vpd.put("var20", varOList.get(i).getString("NOTE2"));	//20
				vpd.put("var21", varOList.get(i).getString("NOTE3"));	//21
				vpd.put("var22", varOList.get(i).getString("NOTE4"));	//22
				vpd.put("var23", varOList.get(i).getString("NOTE5"));	//23
				vpd.put("var24", varOList.get(i).getString("NOTE6"));	//24
				vpd.put("var25", varOList.get(i).getString("NOTE7"));	//25
				vpd.put("var26", varOList.get(i).getString("NOTE8"));	//26
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelView erv = new ObjectExcelView();
			mv = new ModelAndView(erv,dataMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/* ===============================权限================================== */
	public Map<String, String> getHC(){
		Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>)session.getAttribute(Const.SESSION_QX);
	}
	/* ===============================权限================================== */
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
