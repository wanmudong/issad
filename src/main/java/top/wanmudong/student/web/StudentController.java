package top.wanmudong.student.web;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import top.wanmudong.student.entity.College;
import top.wanmudong.student.entity.Student;
import top.wanmudong.student.service.ICollegeService;
import top.wanmudong.student.service.IMajorService;
import top.wanmudong.student.service.IStudentService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Time;
import java.util.List;
import java.util.Timer;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author chenjiehao
 * @since 2019-03-02
 */
@Controller
@RequestMapping("/students/")
public class StudentController {

    @Autowired
    private IStudentService iStudentService;
    @Autowired
    private IMajorService iMajorService;
    @Autowired
    private ICollegeService iCollegeService;

    @GetMapping("/index")
    public String index(Model model){
        model.addAttribute("name","sissy");
        return "student_delete";
    }
    @GetMapping("/del/{id}")
    public String del(@PathVariable int id, Model model,HttpServletResponse response) throws IOException {
        iStudentService.deleteById(id);
        response.sendRedirect("/students/");
        return "index";
    }

//    @GetMapping("/del/{id}")
//    public String goDel(@PathVariable int id, Model model){
//        Student student = iStudentService.selectById(id);
//
//        student.setCollege(iCollegeService.selectById(student.getCollegeId()).getCollegeName());
//        student.setMajor(iMajorService.selectById(student.getMajorId()).getMajorName());
//
//        model.addAttribute("student",student);
//
//        List<College> listCollege = iCollegeService.selectList(new EntityWrapper<College>());
//        model.addAttribute("listCollege",listCollege);
//
//        return "student_delete";
//    }

    @GetMapping("/")
    public String get(Model model){
        List<College> listCollege = iCollegeService.selectList(new EntityWrapper<College>());
        List<Student> listStudent= iStudentService.selectList(new EntityWrapper<Student>());

        for(Student student: listStudent){
            student.setCollege(iCollegeService.selectById(student.getCollegeId()).getCollegeName());
            student.setMajor(iMajorService.selectById(student.getMajorId()).getMajorName());
        }

        model.addAttribute("listCollege",listCollege);
        model.addAttribute("listStudent",listStudent);

        return "student_infor";
    }
    @GetMapping("/update/{id}")
    public String goUpdate(@PathVariable int id, Model model){
        Student student = iStudentService.selectById(id);

        student.setCollege(iCollegeService.selectById(student.getCollegeId()).getCollegeName());
        student.setMajor(iMajorService.selectById(student.getMajorId()).getMajorName());

        model.addAttribute("student",student);

        List<College> listCollege = iCollegeService.selectList(new EntityWrapper<College>());
        model.addAttribute("listCollege",listCollege);

        return "student_update";
    }
    @PostMapping("/update")
    public String update(Student student, Model model, HttpServletResponse response) throws IOException {
        iStudentService.updateAllColumnById(student);

        model.addAttribute("student",student);
        response.sendRedirect("/students/");
        return "student_infor";
    }
    @PostMapping("/add")
    public String add(Student student, HttpServletResponse response) throws IOException {
        iStudentService.insert(student);

        response.sendRedirect("/students/");
        return "student_infor";
    }

}
