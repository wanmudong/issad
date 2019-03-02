package top.wanmudong.student.web;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import top.wanmudong.student.entity.Major;
import top.wanmudong.student.service.IMajorService;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author chenjiehao
 * @since 2019-03-02
 */
@RestController
@RequestMapping("/students/major")
public class MajorController {

    @Autowired
    private IMajorService iMajorService;

    @GetMapping("/{id}")
    public List<Major> getMajor(@PathVariable int id){

        EntityWrapper<Major> entityWrapper = new EntityWrapper<>();
        entityWrapper.eq("college_id",id);

        List<Major> majorList = iMajorService.selectList(entityWrapper);

        return majorList;
    }

}
