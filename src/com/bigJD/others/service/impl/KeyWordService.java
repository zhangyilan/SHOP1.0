package com.bigJD.others.service.impl;/**
 * Created by Administrator on 2016/12/16.
 */

import com.bigJD.others.dao.IKeyWordDao;
import com.bigJD.others.entity.KeyWord;
import com.bigJD.others.service.IKeyWordService;
import com.bigJD.product.entity.Product;

import java.util.List;
public class KeyWordService implements IKeyWordService {
    private IKeyWordDao keyWordDao;
    @Override
    public Integer saveKeyWord(KeyWord keyWord) {
        Integer state;
        if(keyWord != null){
            keyWordDao.saveKeyWord(keyWord);
            state=0;
        }else {
            state=1;
        }
        return state;
    }


    /**
     * 查询关键字是否存在s
     * @param keyWord
     * @return
     */
    @Override
    public KeyWord queryKeyWord(KeyWord keyWord) {
        keyWordDao.queryKeyWord(keyWord);
       return  null;

    }

    /**
     * 更新关键字
     * @param keyWord
     * @return
     */
    @Override
    public Integer updataKeyWord(KeyWord keyWord) {
        Integer state;
        if(keyWord !=null){
        keyWordDao.updataKeyWord(keyWord);
            state=0;
        }else {
            state=1;
        }
        return state;
    }

    @Override
    public KeyWord queryKeyWordByName(String name) {

       return keyWordDao.queryKeyWordByName(name);
    }

    /**
     * 按照关键字模糊查询
     * @param name
     * @return
     */
    @Override
    public List<Product> fuzzyQuery(String name) {

        return keyWordDao.fuzzyQuery(name);
    }

    @Override
    public List<Product> keywordFindProducts(String name) {
        return keyWordDao.keywordFindProducts(name);
    }

    public void setKeyWordDao(IKeyWordDao keyWordDao) {
        this.keyWordDao = keyWordDao;
    }
}
