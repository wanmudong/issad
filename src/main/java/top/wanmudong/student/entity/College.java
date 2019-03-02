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
public class College extends Model<College> {

    private static final long serialVersionUID = 1L;
    @TableId
    private  int id;
    /**
     * 学院名称
     */
    @TableField("college_name")
    private String collegeName;


    @Override
    protected Serializable pkVal() {
        return null;
    }

}
