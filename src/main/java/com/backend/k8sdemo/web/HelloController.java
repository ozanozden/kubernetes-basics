package com.backend.k8sdemo.web;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Instant;
import java.util.Map;

@RestController
public class HelloController {

    @GetMapping("/hello")
    public ResponseEntity<Map<String, String>> sayHiToTheWorld(){
        Map<String, String> response = Map.of(
                "message", "Hello from Kubernetes!",
                "version", "1.0",
                "timestamp", Instant.now().toString()
        );
        return ResponseEntity.ok(response);
    }
}
