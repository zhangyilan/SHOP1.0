package com.bigJD.product.action;

import com.bigJD.product.entity.Product;
import com.bigJD.product.entity.ProductImg;
import com.bigJD.product.entity.SecondCategoryProduct;
import com.bigJD.product.entity.ThirdCategoryProduct;
import com.bigJD.product.service.IProductService;
import com.bigJD.user.service.IUserService;
import com.bigJD.utils.PageUtil;
import com.bigJD.utils.PictureUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ProductAction extends ActionSupport {
    private IUserService userService;
    private IProductService productService;
    private Integer state = 0;
    private Product product;
    private Integer id;
    private List<Integer> ids;
    private String content;
    private PageUtil<Product> pageProducts;
    private List<SecondCategoryProduct> categoryProducts;
    private List<ThirdCategoryProduct> thirdcategoryProducts;
    private PageUtil<Product> pageUtil ;
    private Integer secondId;
    private Integer index;
    private File[] file;
    private String[] fileFileName;
    private String[] fileContentType;
    private Integer categoryId;
    private String msg;
    //////////////////////////////////////////////////////管理员开始//////////////////////////////////////////////
    /**
     * 添加商品加载分类
     * @return
     */
    public String addLoadFenlei(){
    	indexShow();
    	return "upload";
    }
	///////////////////////////////////////////////////管理员结束//////////////////////////////////////////////
    /**
     * 商品新增
     * @return
     */
    public String add() {

        return "state";
    }

    /**
     * 商品编辑
     * @return
     */
    public String edit() {
        return "state";
    }

    /**
     * 商品删除
     * @return
     */
    public String delete() {
        return "state";
    }

    /**
     * 商品批量删除
     * @return
     */
    public String deletes() {
        return "state";
    }

    /**
     * 模糊查询
     * @return
     */
    public String search(){
        return "state";
    }

    /**
     * 主页显示
     * @return
     */
    public String indexShow() {
        categoryProducts = productService.findAllCategoryAndProducts();
        ActionContext.getContext().getSession().put("categoryProducts", categoryProducts);
        return "index";
    }

    /**
     * 二级分类查询和分页查询商品
     * @return
     */
    public String thirdCategoryAndProduct() {
        thirdcategoryProducts =  productService.thirdCategory(id);
        secondId = id;
        pageUtil = new PageUtil<>(12);
        pageUtil = productService.findPageProducts(pageUtil,secondId);
        ActionContext.getContext().getSession().put("pageUtil", pageUtil);
        ActionContext.getContext().getSession().put("thirdcategoryProducts", thirdcategoryProducts);
        return "secondShow";
    }

    /**
     * 分页上下页
     * @return
     */
    public String nextPage() {
        try {
            thirdcategoryProducts =  productService.thirdCategory(id);
            secondId = id;
            pageUtil = (PageUtil<Product>) ActionContext.getContext().getSession().get("pageUtil");
            pageUtil.setCurrentPage(index);
            pageUtil = productService.findPageProducts(pageUtil,secondId);
            ActionContext.getContext().getSession().put("pageUtil", pageUtil);
            ActionContext.getContext().getSession().put("thirdcategoryProducts", thirdcategoryProducts);
            return "secondShow";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "secondShow";
    }
    /**
     * 商品详情
     * @return
     */
    public String detail() {
        product = productService.detail(id);
        return "detail";
    }

    /**
     * 添加新的商品
     * @return
     */
    public String newProduct() {
        Set<ProductImg> imgs = new HashSet<>();
        String path = ServletActionContext.getServletContext()
                .getRealPath("/upload/product");
        for(int i = 0; i < file.length; ++i) {
            String picName = PictureUtil.upload(file[i], fileContentType[i], path);
            ProductImg img = new ProductImg();
            img.setUrl(picName);
            imgs.add(img);
        }
        product.setImgs(imgs);
        ThirdCategoryProduct third = new ThirdCategoryProduct();
        SecondCategoryProduct second = new SecondCategoryProduct();
        second.setId(categoryId);
        third.setId(categoryId);
        third.setSecondCategoryProduct(second);
        product.setThirdCategoryProduct(third);
        product.setAddTime(new Date());
        productService.add(product);
        state = 1;
        msg = "添加商品成功！";
        return "upload";
    }

    public void setUserService(IUserService userService) {
        this.userService = userService;
    }

    public void setProductService(IProductService productService) {
        this.productService = productService;
    }

    public IUserService getUserService() {
        return userService;
    }

    public IProductService getProductService() {
        return productService;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public List<Integer> getIds() {
        return ids;
    }

    public void setIds(List<Integer> ids) {
        this.ids = ids;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public PageUtil<Product> getPageProducts() {
        return pageProducts;
    }

    public void setPageProducts(PageUtil<Product> pageProducts) {
        this.pageProducts = pageProducts;
    }

    public List<SecondCategoryProduct> getCategoryProducts() {
        return categoryProducts;
    }

    public void setCategoryProducts(List<SecondCategoryProduct> categoryProducts) {
        this.categoryProducts = categoryProducts;
    }

    public List<ThirdCategoryProduct> getThirdcategoryProducts() {
        return thirdcategoryProducts;
    }

    public void setThirdcategoryProducts(List<ThirdCategoryProduct> thirdcategoryProducts) {
        this.thirdcategoryProducts = thirdcategoryProducts;
    }

    public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public PageUtil<Product> getPageUtil() {
        return pageUtil;
    }

    public void setPageUtil(PageUtil<Product> pageUtil) {
        this.pageUtil = pageUtil;
    }

    public Integer getSecondId() {
        return secondId;
    }

    public void setSecondId(Integer secondId) {
        this.secondId = secondId;
    }

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public File[] getFile() {
        return file;
    }

    public void setFile(File[] file) {
        this.file = file;
    }

    public String[] getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String[] fileFileName) {
        this.fileFileName = fileFileName;
    }

    public String[] getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(String[] fileContentType) {
        this.fileContentType = fileContentType;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }
}
