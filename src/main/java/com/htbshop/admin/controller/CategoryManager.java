package com.htbshop.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.htbshop.dao.CategoryDAO;
import com.htbshop.entity.Category;

@Controller
public class CategoryManager {
	@Autowired
	CategoryDAO dao;
	
	@RequestMapping("/admin/category/index")
	public String index(Model model) {
		Category entity = new Category();
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/category/index";
	}
	@RequestMapping("/admin/category/edit/{id}")
	public String edit(Model model,
			@PathVariable("id") Integer id) {
		Category entity = dao.findById(id);
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/category/index";
	}
	//them danh muc
	@RequestMapping("/admin/category/create")
	public String create(RedirectAttributes model, @ModelAttribute("entity") Category entity) {
		dao.create(entity);
		model.addAttribute("msg", "Thêm thành công");
		return "redirect:/admin/category/index";
	}
	@RequestMapping("/admin/category/update")
	public String update(RedirectAttributes model, @ModelAttribute("entity") Category entity) {
		dao.update(entity);
		model.addAttribute("msg", "Sửa thành công");
		return "redirect:/admin/category/edit/" + entity.getId();
	}
	@RequestMapping(value= {"/admin/category/delete","/admin/category/delete/{id}"})
	public String delete(RedirectAttributes model,
			@RequestParam(value = "id", required = false) Integer id1,
			@PathVariable(value = "id", required = false) Integer id2) {
		// id bang id1 neu id1 khac null, nguoc lại thì id = id2
		Integer id =(id1 != null) ? id1 : id2;
		dao.delete(id);
		model.addAttribute("msg", "Xóa thành công");
		return "redirect:/admin/category/index";
	}
}
