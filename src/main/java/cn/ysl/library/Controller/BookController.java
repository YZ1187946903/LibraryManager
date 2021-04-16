package cn.ysl.library.Controller;

import cn.ysl.library.base.pojo.vo.PageVO;
import cn.ysl.library.pojo.entity.Book;
import cn.ysl.library.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 图书控制层
 */
@Controller("BookController")
@RequestMapping("/book")
public class BookController {
	@Autowired
	private BookService bookService;
	/**
	 * <b>转发到图书信息页面</b>
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/list")
	public String index() throws Exception {
		return "book/book_list";
	}

	@GetMapping("/power")
	public String forwardPower() throws Exception {
		return "book/book_power";
	}

	@GetMapping("/in")
	public String forwardIn() throws Exception {
		return "book/book_in";
	}

	@GetMapping("/out")
	public String forwardOut() throws Exception {
		return "book/book_out";
	}

	/**
	 * <b>分页查询图书信息</b>
	 * @param pageNo
	 * @param pageSize
	 * @param draw
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/page", method = RequestMethod.POST)
	@ResponseBody
	public PageVO<Book> page(Integer pageNo, Integer pageSize, Integer draw, Integer status) throws Exception {
		// 1、根据ajax前端页面传过来的参数，创建PageVO对象
		PageVO<Book> pageVO = new PageVO<>(pageNo,pageSize,draw);
		pageVO = bookService.getByPage(pageVO, status);
		// 2、将 pageVO对象异步传给前端
		return pageVO;
	}
}
