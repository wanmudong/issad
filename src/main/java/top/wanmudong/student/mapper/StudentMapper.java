package top.wanmudong.student.mapper;

import org.apache.ibatis.annotations.Mapper;
import top.wanmudong.student.entity.Student;
import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author chenjiehao
 * @since 2019-03-02
 */
@Mapper
public interface StudentMapper extends BaseMapper<Student> {

}
