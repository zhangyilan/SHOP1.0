package com.bigJD.others.dao;

import com.bigJD.others.entity.KeyWord;
import com.bigJD.product.entity.Product;

import java.util.List;
public interface IKeyWordDao {
    /**
     * 保存关键字
     * @param keyWord
     * @return
     */
    Integer saveKeyWord(KeyWord keyWord);

    /**
     * 查找关键字是否已存在s
     * @param keyWord
     * @return
     */
    KeyWord queryKeyWord(KeyWord keyWord);

    /**
     * 更新关键字（点击量）
     * @param keyWord
     * @return
     */
    Integer updataKeyWord(KeyWord keyWord);

    /**
     * 按照关键字查询
     * @param name
     * @return
     */
    KeyWord queryKeyWordByName(String name);

    /**
     * 模糊查询关键字
     * @param name
     * @return
     */
    List<Product> fuzzyQuery(String name);

    /**
     *
     * @param name
     * @return
     */
    List<Product> keywordFindProducts(String name);
}
