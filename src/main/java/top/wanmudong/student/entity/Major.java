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
public class Major extends Model<Major> {

    private static final long serialVersionUID = 1L;

    @TableId
    private  int id;
    /**
     * 专业名称
     */
    @TableField("major_name")
    private String majorName;

    /**
     * 专业所在学院id
     */
    @TableField("college_id")
    private Integer collegeId;


    @Override
    protected Serializable pkVal() {
        return null;
    }

}
