package com.kh.letEatGo.order.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.letEatGo.order.model.vo.Menu;
import com.kh.letEatGo.order.model.vo.Order;
import com.kh.letEatGo.order.model.vo.Review;
import com.kh.letEatGo.order.model.vo.ReviewComment;
import com.kh.letEatGo.partner.model.vo.Partner;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Override
	public int selectDefaultCount(SqlSessionTemplate session) {
		int totalCount = session.selectOne("order.selectDefaultCount");
		return totalCount;
	}

	@Override
	public List<Partner> selectDefaultTruckList(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds rb = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		List<Partner> list = session.selectList("order.selectDefaultTruckList", null, rb);
		return list;
	}

	@Override
	public int selectCount(SqlSessionTemplate session, Map<String, Object> menu) {
		int count = session.selectOne("order.selectCount", menu);
		return count;
	}

	@Override
	public double selectStar(SqlSessionTemplate session, int partner_No) {
	      try {
	         double result = session.selectOne("order.selectStar", partner_No);
	         return result;
	      }
	      catch(NullPointerException e) {
	    	 double starCount = 0;
	         return starCount;
	      }
	}

	@Override
	public int selectReviewCount(SqlSessionTemplate session, int partner_No) {
		try{
			int result = session.selectOne("order.selectReviewCount", partner_No);
			return result;
		} catch (NullPointerException e) {
			int reviewCount = 0;
			return reviewCount;
		}
	}

	@Override
	public List<Partner> selectTruckList(SqlSessionTemplate session, int cPage, int numPerPage, Map<String, Object> menu) {
		RowBounds rb = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		List<Partner> list = session.selectList("order.selectTruckList", menu, rb);
		return list;
	}

	@Override
	public List<Menu> selectMenu(SqlSessionTemplate session, int partner_No) {
		List<Menu> menuList = session.selectList("order.selectMenu", partner_No);
		return menuList;
	}
	
	@Override
	public Partner selectTruck(SqlSessionTemplate session, int partner_No) {
		Partner result = session.selectOne("order.selectTruck", partner_No);
		return result;
	}

	@Override
	public List<Review> selectReview(SqlSessionTemplate session, int partner_No) {
		List<Review> list = session.selectList("order.selectReview", partner_No);
		return list;
	}

	@Override
	public int insertOrder(SqlSessionTemplate session, Order order) {
		int result = session.insert("order.insertOrder", order);
		return result;
	}

	@Override
	public List<ReviewComment> selectReviewComment(SqlSessionTemplate session, int comment_To) {
		List<ReviewComment> list = session.selectList("order.selectReviewComment", comment_To);
		return list;
	}

	@Override
	public List<Menu> selectMenuList(SqlSessionTemplate session, Menu m) {
		m.setMenu_Name("%"+m.getMenu_Name()+"%");
		System.out.println(m.getMenu_Name());
		List<Menu> menuList = session.selectList("order.selectMenuList", m);
		return menuList;
	}

	@Override
	public List<Partner> selectMenuTruckList(SqlSessionTemplate session, int cPage, int numPerPage, String menu_Name) {
		List<Partner> list = session.selectList("order.selectMenuTruckList", menu_Name); 
		return list;
	}
	
	@Override
	public int selectMenuCount(SqlSessionTemplate session, String menu_Name) {
		int result = session.selectOne("order.selectMenuCount", menu_Name);
		return result;
	}	
	
}