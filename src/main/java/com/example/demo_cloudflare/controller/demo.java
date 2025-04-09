package com.example.demo_cloudflare.controller;

import com.example.demo_cloudflare.util.EncryptionUtil;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/demo")
public class demo {
    @GetMapping("/hello")
    public String hello() {
        try {
            // Mã hóa response trước khi gửi
            return EncryptionUtil.encrypt("Hello World");
        } catch (Exception e) {
            return "Error encrypting response";
        }
    }
}
