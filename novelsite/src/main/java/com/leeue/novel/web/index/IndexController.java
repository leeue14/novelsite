package com.leeue.novel.web.index;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.leeue.novel.utils.NetBookApi;
import com.leeue.novel.web.rank.RankController;

@Controller
@RequestMapping(value = "/indexoperation")
public class IndexController {

	@Autowired
	private RankController rankController;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getIndex(HttpServletRequest request) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("weekrank", rankController.getWeekRank(request));
		modelMap.put("salerank", rankController.getSaleRank(request));
		// 获取玄幻精品
		try {
			JSONObject indexTypeOne = NetBookApi.getType(request, "male", "hot",
					"玄幻", "", 0, 10);
			JSONObject indexTypeTwo = NetBookApi.getType(request, "male", "hot",
					"仙侠", "", 0, 10);
			JSONObject indexTypeThree = NetBookApi.getType(request, "male", "hot",
					"都市", "", 0, 10);
			JSONObject indexTypeFour = NetBookApi.getType(request, "male", "hot",
					"历史", "", 0, 10);
			JSONObject indexTypeFive = NetBookApi.getType(request, "male", "hot",
					"科幻", "", 0, 10);
			JSONObject indexTypeSix = NetBookApi.getType(request, "male", "hot",
					"竞技", "", 0, 10);
			request.getSession().setAttribute("indexTypeOne", indexTypeOne);//玄幻奇幻
			request.getSession().setAttribute("indexTypeTwo", indexTypeTwo);
			request.getSession().setAttribute("indexTypeThree", indexTypeThree);
			request.getSession().setAttribute("indexTypeFour", indexTypeFour);
			request.getSession().setAttribute("indexTypeFive", indexTypeFive);
			request.getSession().setAttribute("indexTypeSix", indexTypeSix);
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}
		return modelMap;
	}
}
