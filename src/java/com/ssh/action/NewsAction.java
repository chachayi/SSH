package com.ssh.action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.News;
import com.ssh.service.NewsOperationService;
import com.ssh.tool.Shuru;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


@Controller("newsAction")
@Scope("prototype")
public class NewsAction extends ActionSupport {

    private String title;
    private int content_id;
    private int category_id = 1;
    private String xinwenleixing;
    private List<News> list;
    private String img = "坦克";
    private Date date;
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getContent_id() {
        return content_id;
    }

    public void setContent_id(int content_id) {
        this.content_id = content_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getXinwenleixing() {
        return xinwenleixing;
    }

    public void setXinwenleixing(String xinwenleixing) {
        this.xinwenleixing = xinwenleixing;
    }

    public List<News> getList() {
        return list;
    }

    public void setList(List<News> list) {
        this.list = list;
    }

    @Resource
    private NewsOperationService newsOperationService;

    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

    public String insertNews() throws ParseException {
        News news = new News();
        news.setTitle(title);
        news.setImg(img);

        String format = sdf.format(new Date());
        date = sdf.parse(format);
        news.setTime(date);

        news.setCategory_id(category_id);
        news.setContent_id(content_id);
        newsOperationService.insertNews(news);
        return SUCCESS;
    }
    public String deleteNews(){
        News news = new News();
        news.setId(id);
        newsOperationService.deleteNews(news);
        return SUCCESS;
    }
    public String updateNews(){
        if(xinwenleixing.equals("财经")){
            this.setCategory_id(2);
        }else if(xinwenleixing.equals("教育")){
            this.setCategory_id(3);
        }else if(xinwenleixing.equals("娱乐")){
            this.setCategory_id(4);
        }
        News news = new News();
        news.setTitle(title);
        news.setId(id);
        news.setContent_id(content_id);
        news.setCategory_id(category_id);
     newsOperationService.updateNews(news);
        return  SUCCESS;
    }
    public String lookNewsInformationByTime(){
        this.setList(newsOperationService.lookNewsInformationByTime(date));
        return  SUCCESS;
    }
    public String lookNewsListByCategory(){
        newsOperationService.newsFrequency();
        this.setList(newsOperationService.lookNewsListByCategory(category_id));
        return  SUCCESS;
    }
    public String lookNewsInformationByTitle(){
        this.setList(newsOperationService.lookNewsInformationByTitle(title));
        return  SUCCESS;
    }
    public String searchNewsByTitle(){
        this.setList(newsOperationService.searchNewsByTitle(title));
        return  SUCCESS;
    }

}
