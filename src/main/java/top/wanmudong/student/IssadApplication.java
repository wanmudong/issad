package top.wanmudong.student;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;

@SpringBootApplication
@MapperScan("top.wanmudong.images.mapper")
@Configuration
public class IssadApplication {

    public static void main(String[] args) {
        SpringApplication.run(IssadApplication.class, args);
    }

}
