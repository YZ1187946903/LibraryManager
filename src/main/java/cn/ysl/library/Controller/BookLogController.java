package cn.ysl.library.Controller;

import cn.ysl.library.base.pojo.vo.PageVO;
import cn.ysl.library.pojo.entity.Book;
import cn.ysl.library.pojo.entity.BookLog;
import cn.ysl.library.service.BookLogService;
import cn.ysl.library.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * 图书记录表控制层
 * @author YSL
 * @date 2021/4/28
 */
@Controller("BookLogController")
@RequestMapping("/bookLog")
public class BookLogController {
	@Autowired
	private BookLogService bookLogService;
	@Autowired
	private BookService bookService;

	@GetMapping("/in")
	public String forwardIn() throws Exception {
		return "bookLog/book_in";
	}

	@GetMapping("/out")
	public String forwardOut() throws Exception {
		return "bookLog/book_out";
	}

	@GetMapping("/add")
	public String forwardAdd() throws Exception {
		return "bookLog/book_add";
	}

	@GetMapping("/delete")
	public String forwardDelete() throws Exception {
		return "bookLog/book_delete";
	}

	/**
	 * 根据 type 类型进行分页查询出入库记录表
	 * @param pageNo
	 * @param pageSize
	 * @param draw
	 * @param t
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/page")
	@ResponseBody
	public PageVO<BookLog> page(Integer pageNo, Integer pageSize,
	      Integer draw, String type) throws Exception {
		// 1、根据ajax前端页面传过来的参数，创建PageVO对象
		PageVO<BookLog> pageVO = new PageVO<>(pageNo,pageSize,draw);
		pageVO = bookLogService.getByPage(pageVO,type);
		return pageVO;
	}

	@PostMapping("/add")
	@ResponseBody
	public boolean addBook(Book book,String operator,String place) throws Exception{
		// 创建BookLog对象封装信息
		BookLog bookLog = new BookLog();
		bookLog.setType("入库");
		bookLog.setName(book.getName());
		bookLog.setNumber(book.getNumber());
		bookLog.setOperator(operator);
		bookLog.setPlace(place);
		// 如果入库的图书已存在，则只需要修改库存数量
		Book findBook = bookService.findBookByNo(book.getNo());
		if (findBook != null) {
			book.setNumber(findBook.getNumber()+book.getNumber());
			// 调用 bookService 修改图书信息，并且调用 bookLogService保存入库记录
			if (bookService.updateBook(book) && bookLogService.saveBookLog(bookLog)) {
				return true;
			}
		}
		// 没有图书信息直接保存
		if (bookService.saveBook(book) && bookLogService.saveBookLog(bookLog)) {
			return true;
		}
		return false;
	}

	@PostMapping("/delete")
	@ResponseBody
	public boolean deleteBook(Book book,String operator,String place) throws Exception{
		// 创建BookLog对象封装信息
		BookLog bookLog = new BookLog();
		bookLog.setType("出库");
		bookLog.setName(book.getName());
		bookLog.setNumber(book.getNumber());
		bookLog.setOperator(operator);
		bookLog.setPlace(place);
		// 如果出库的图书已存在，修改库存数量并且数量要大于出库的数量
		Book findBook = bookService.findBookByNo(book.getNo());
		if (findBook != null && findBook.getNumber()>book.getNumber()) {
			book.setNumber(findBook.getNumber()-book.getNumber());
			// 调用 bookService 修改图书信息，并且调用 bookLogService保存入库记录
			if (bookService.updateBook(book) && bookLogService.saveBookLog(bookLog)) {
				return true;
			}
		}
		// 没有图书信息，没有库存直接返回失败
		return false;
	}
}
