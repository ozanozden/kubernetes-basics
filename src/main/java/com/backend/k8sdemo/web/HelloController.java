package com.backend.k8sdemo.web;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.Serializable;
import java.time.Instant;
import java.util.Map;

@RestController
public class HelloController {

    @GetMapping("/hello")
    public ResponseEntity<String> sayHiToTheWorld(){
        Map<String, String> response = Map.of("message", "Hello from K8s Demo!",
                "timestamp", Instant.now().toString());
        return ResponseEntity.ok(response.toString());
    }
}
