package com.bigJD.others.action;/**
 * Created by Administrator on 2016/12/16.
 */

import com.bigJD.others.entity.KeyWord;
import com.bigJD.others.service.IKeyWordService;
import com.bigJD.others.service.impl.KeyWordService;
import com.bigJD.product.entity.Product;
import com.bigJD.utils.Constant;
import com.opensymphony.xwork2.ActionContext;

import java.util.Date;
import java.util.List;
import java.util.Map;

public class KeyWordAction {
    private IKeyWordService keyWordService = null;
    private KeyWord keyWord;
    private Integer state;
    private String name;
    private Integer clickNumber;
    private List<Product> productList = null;
    public String keywordFindProducts(){
        productList = keyWordService.keywordFindProducts(name);
        return "searchResultPage";
    }
    /**
     * 保存关键字s
     * @return
     */
    public String saveKeyWord(){
        try {
            if(keyWordService.queryKeyWord(keyWord) == null) {    //判断关键字是否已经存在
                keyWordService.saveKeyWord(keyWord);
                state= Constant.KEY_WORD_SAVE_SUCCESS;
            }else{
                  state=Constant.KEY_WORD_SAVE_FAIL;
            }
        } catch (Exception e) {
            e.printStackTrace();
            state=Constant.KEY_WORD_SAVE_FAIL;
        }
        return "state";
    }

    /**
     * 模糊查询关键字
     * @return
     * @throws Exception
     */
   public String fuzzyQuery()throws Exception{
          try{
              if(name !=null && !("".equals(name))) {
                  productList = keyWordService.fuzzyQuery(name);
              }
          }catch (Exception e){
              e.printStackTrace();
          }
       return "list";
   }


    /**
     * 更新关键字（点击量）
     * @return
     */
    public String updataKeyWord(){
        try {
        if(name !=null && !("".equals(name))){
            clickNumber=keyWordService.queryKeyWordByName(name).getClickNumber();
        }
        keyWord.setClickNumber(clickNumber+1);
        keyWord.setName(name);
        keyWord.setAddTime(new Date());
        state = keyWordService.updataKeyWord(keyWord);
        } catch (Exception e) {
            e.printStackTrace();
            state=Constant.KEY_WORD_UPDATA_FAIL;
        }
        return "state";
    }

    public void setKeyWordService(IKeyWordService keyWordService) {
        this.keyWordService = keyWordService;
    }

    public KeyWord getKeyWord() {
        return keyWord;
    }

    public void setKeyWord(KeyWord keyWord) {
        this.keyWord = keyWord;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getClickNumber() {
        return clickNumber;
    }

    public IKeyWordService getKeyWordService() {
        return keyWordService;
    }

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }

    public void setClickNumber(Integer clickNumber) {
        this.clickNumber = clickNumber;
    }
}
