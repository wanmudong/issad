package top.wanmudong.student.service.impl;

import top.wanmudong.student.entity.Student;
import top.wanmudong.student.mapper.StudentMapper;
import top.wanmudong.student.service.IStudentService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author chenjiehao
 * @since 2019-03-02
 */
@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper, Student> implements IStudentService {

}
