package org.example.myboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class MybootApplication {

    // 8080 -> 9090
    @GetMapping
    public String welcome() {
        return "Hello World";
    }
    public static void main(String[] args) {
        SpringApplication.run(MybootApplication.class, args);
    }

}
