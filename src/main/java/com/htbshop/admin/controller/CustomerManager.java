package com.htbshop.admin.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.htbshop.dao.CustomerDAO;
import com.htbshop.entity.Customer;

@Controller
public class CustomerManager {
	@Autowired
	CustomerDAO dao;
	@Autowired
	//muon upload file phai co cai nay
	ServletContext app;
	
	@RequestMapping("/admin/customer/index")
	public String index(Model model) {
		Customer entity = new Customer();
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/customer/index";
	}
	@RequestMapping("/admin/customer/edit/{id}")
	public String edit(Model model,
			@PathVariable("id") String id) {
		Customer entity = dao.findById(id);
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/customer/index";
	}
	//them danh muc
	@RequestMapping("/admin/customer/create")
	public String create(RedirectAttributes model,
			@ModelAttribute("entity") Customer entity,
			@RequestParam("photo-file") MultipartFile file) throws IllegalStateException, IOException {
		if(file.isEmpty()) {
			entity.setPhoto("user.png");
		}else {
			entity.setPhoto(file.getOriginalFilename());
			String path = app.getRealPath("/static/images/customers/" + entity.getPhoto());
			file.transferTo(new File(path));
		}
		dao.create(entity);
		model.addAttribute("msg", "Thêm thành công");
		return "redirect:/admin/customer/index";
	}
	@RequestMapping("/admin/customer/update")
	public String update(RedirectAttributes model, 
			@ModelAttribute("entity") Customer entity,
			@RequestParam("photo-file") MultipartFile file) throws IllegalStateException, IOException {
		if(!file.isEmpty()) {
			entity.setPhoto(file.getOriginalFilename());
			String path = app.getRealPath("/static/images/customers/" + entity.getPhoto());
			file.transferTo(new File(path));
		}
		dao.update(entity);
		model.addAttribute("msg", "Sửa thành công");
		return "redirect:/admin/customer/edit/" + entity.getId();
	}
	@RequestMapping(value= {"/admin/customer/delete","/admin/customer/delete/{id}"})
	public String delete(RedirectAttributes model,
			@RequestParam(value = "id", required = false) String id1,
			@PathVariable(value = "id", required = false) String id2) {
		// id bang id1 neu id1 khac null, nguoc lại thì id = id2
		String id =(id1 != null) ?  id1 : id2;
		dao.delete(id);
		model.addAttribute("msg", "Xóa thành công");
		return "redirect:/admin/customer/index";
	}
}
