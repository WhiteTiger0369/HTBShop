package com.htbshop.controller;

import java.util.List;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.htbshop.dao.ProductDAO;
import com.htbshop.entity.Product;
import com.htbshop.service.CookieService;

@Controller
public class ProductController {
	@Autowired
	ProductDAO pdao;
	@Autowired
	CookieService cookie;
	

	@RequestMapping("/product/list-by-category/{cid}")
	public String listByCategory(Model model, @PathVariable("cid") Integer categoryId) {
		List<Product> list = pdao.findByCategoryId(categoryId);
		model.addAttribute("list", list);
		return "product/list";
		
	}
	//tiem kiem san pham
	@RequestMapping("/product/list-by-keywords")
	public String listByKeyword(Model model, @RequestParam("keywords") String keywords) {
		List<Product> list = pdao.findByKeywords(keywords);
		model.addAttribute("list", list);
		return "product/list";
		
	}
	@RequestMapping("/product/detail/{id}")
	public String detail(Model model, @PathVariable("id") Integer id) {
		Product p = pdao.findById(id);
		List<Product> list = pdao.findByCategoryId(p.getCategory().getId());
		model.addAttribute("p", p);
		model.addAttribute("list", list);
		return "product/detail";
		
	}
	@ResponseBody
	@RequestMapping("/product/add-to-favo/{id}")
	public boolean addToFavo(Model model, @PathVariable("id") Integer id) {
		Cookie favo = cookie.read("favo"); //lay cookie tu client
		String value = id.toString(); // lay 
		if(favo != null) {
			value = favo.getValue(); //neu co lay gia tri cookie coi co id do chua
			if(!value.contains(id.toString())) {
				value += "," +id.toString();
			}else {
				return false;
			}
			
		}
		favo = cookie.create("favo", id.toString(), 30);
		return true;
		
	}

}
