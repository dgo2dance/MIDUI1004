package com.fh.service.midui.userbasic;

import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;


@Service("userbasicService")
public class UserBasicService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("UserBasicMapper.save", pd);
	}
	/**
	 * 注册
	 * @param pd
	 * @throws Exception
	 */
	public void saveZhuce(PageData pd)throws Exception{
		dao.save("UserBasicMapper.saveZhuce", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("UserBasicMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("UserBasicMapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("UserBasicMapper.datalistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("UserBasicMapper.listAll", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserBasicMapper.findById", pd);
	}
	
	/**
	 * 获取当然登录人，如果为空表示未登录
	 * @return
	 */
	 public PageData getUserBasic() {
		 PageData pd = new PageData();
		 try {
			 Subject currentUser = SecurityUtils.getSubject();  
			 Session session = currentUser.getSession();
			 //"902e1877f6de49fbaa199fe5f7a648e3";//
			  String  userbasic_id  =(String)session.getAttribute("USERBASIC_ID");
			  if(userbasic_id==null || "".equals(userbasic_id)){
				  System.out.println("-------未登录---------"+userbasic_id); 
				  pd=null;
			  }else{
				  System.out.println("-------userbasic_id---------"+userbasic_id);
				  pd.put("USERBASIC_ID", userbasic_id);
				  pd=findById(pd);
			  }
			  
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return pd;
		
	}
	
	
	
	
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("UserBasicMapper.deleteAll", ArrayDATA_IDS);
	}
	
	
	
	/*
	* 
	*/
	public boolean findByUserName(PageData pd)throws Exception{
		List<PageData> list=(List<PageData>)dao.findForList("UserBasicMapper.findByUserName", pd);
		if(list!=null && list.size()>0){
			return true ;	
		}
		return false;
	}
	
	/**
	 * 登录
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findLogin(PageData pd)throws Exception{
		return (PageData)dao.findForObject("UserBasicMapper.findLogin", pd);
	}
	
	 
	
	
}

