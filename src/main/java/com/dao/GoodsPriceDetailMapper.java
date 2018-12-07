package com.dao;
import java.util.List;
import org.apache.ibatis.annotations.Param;

import tk.mybatis.mapper.common.Mapper;

import com.bean.Goods;
import com.bean.GoodsDetail;
import com.bean.GoodsPrice;
import com.bean.GoodsPriceDetail;

public interface GoodsPriceDetailMapper extends Mapper<GoodsPriceDetail>{
   List<GoodsPriceDetail> selectall();
   List<GoodsPriceDetail>selectbygoodscode(@Param("goodscode")Integer goodscode,@Param("type")String type,@Param("goodsname")String goodsname);
  GoodsPriceDetail selectbyid(@Param("id")Integer id);
  
   //修改
   int changegoods(GoodsPriceDetail good);
   int deletebyid(Integer id);
   //批量删除
   int deletelist (String [] pks);
   
}