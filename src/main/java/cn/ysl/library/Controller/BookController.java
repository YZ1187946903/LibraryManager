package cn.ysl.library.Controller;

import cn.ysl.library.base.pojo.vo.PageVO;
import cn.ysl.library.pojo.entity.Book;
import cn.ysl.library.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;


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

	@GetMapping("/updatePower/{id}")
	public String forwardUpdatePower(@PathVariable Long id, ModelMap map) throws Exception {
		map.put("id",id);
		return "book/book_powerUpdate";
	}

	@GetMapping("/update/{id}")
	public String forwardUpdate(@PathVariable Long id, ModelMap map) throws Exception {
		map.put("book",bookService.findBookById(id));
		return "book/book_update";
	}

	@GetMapping("/borrow")
	public String forwardBorrow() throws Exception{
		return "book/book_borrow";
	}

	@GetMapping("/back")
	public String forwardBack() throws Exception{
		return "book/book_back";
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
	public PageVO<Book> page(Integer pageNo, Integer pageSize,
	                         Integer draw, Integer status,Long id) throws Exception {
		// 1、根据ajax前端页面传过来的参数，创建PageVO对象
		PageVO<Book> pageVO = new PageVO<>(pageNo,pageSize,draw);
		pageVO = bookService.getByPage(pageVO, status,id);
		// 2、将 pageVO对象异步传给前端
		return pageVO;
	}


	@PostMapping("/update")
	@ResponseBody
	public boolean updateBook(Book book) throws Exception{
		return bookService.updateBook(book);
	}

	@PostMapping("/backBook")
	@ResponseBody
	public boolean backBook(Long id,Long userId,Integer number) throws Exception {
		return bookService.backBook(id,userId,number);
	}

	@PostMapping("/borrowBook")
	@ResponseBody
	public boolean borrowBook(Long id,Long userId,Integer number,Integer price) throws Exception {
		return bookService.borrowBook(id,userId,number,price);
	}
}
