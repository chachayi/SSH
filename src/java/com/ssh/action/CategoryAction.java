package com.ssh.action;

import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.Category;
import com.ssh.service.CategoryService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.text.ParseException;
import java.util.List;

@Controller("categoryAction")
@Scope("prototype")
public class CategoryAction extends ActionSupport{

    private String categoryName;
    private List list;
    private String message="";

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    @Resource
    private CategoryService categoryService;

    public String insertCategory() {
        Category category = new Category();
        category.setCategoryName(categoryName);
        if (categoryService.lookCategoryByName(categoryName)) {
            categoryService.insertCategory(category);
            return SUCCESS;
        }else{
            this.message="此类型已存在";
            addActionMessage(message);
            return INPUT;
        }
    }
    public  String lookCategory(){
        this.setList(categoryService.lookCategory());
        return SUCCESS;
    }
}
