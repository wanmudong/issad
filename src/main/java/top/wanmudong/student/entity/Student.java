package top.wanmudong.student.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import java.io.Serializable;


import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.Version;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author chenjiehao
 * @since 2019-03-02
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Student extends Model<Student> {

    private static final long serialVersionUID = 1L;

    @TableId
    private  int id;

    /**
     * 姓名
     */
    private String name;

    /**
     * 年龄
     */
    private Integer age;

    /**
     * 性别
     */
    private String sex;

    /**
     * 爱好
     */
    private String hobby;

    /**
     * 学院
     */
    @TableField("college_id")
    private String collegeId;

    /**
     * 专业
     */
    @TableField("major_id")
    private String majorId;

    /**
     * 学院
     */
    @TableField(exist = false)
    private String college;

    /**
     * 专业
     */
    @TableField(exist = false)
    private String major;


    @Override
    protected Serializable pkVal() {
        return null;
    }

}
