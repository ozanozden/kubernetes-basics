package com.backend.k8sdemo.web;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.Serializable;
import java.time.Instant;
import java.util.Map;

@RestController
public class HelloController {

    // Inject environment variables with defaults
    @Value("${APP_NAME:K8s Demo}")
    private String appName;

    @Value("${LOG_LEVEL:INFO}")
    private String logLevel;

    @Value("${FEATURE_FLAG_ASYNC:false}")
    private boolean asyncEnabled;

    @Value("${DB_PASSWORD:default-password}")
    private String dbPassword;

    @Value("${API_KEY:default-key}")
    private String apiKey;

    @GetMapping("/secrets")
    public String secrets() {
        // NEVER log actual secrets in production!
        return String.format(
                "DB Password: %s | API Key: %s",
                maskSecret(dbPassword),
                maskSecret(apiKey)
        );
    }

    private String maskSecret(String secret) {
        if (secret.length() <= 4) return "****";
        return secret.substring(0, 2) + "****" + secret.substring(secret.length() - 2);
    }

    @GetMapping("/config")
    public String config() {
        return String.format(
                "App: %s | Log Level: %s | Async: %s",
                appName, logLevel, asyncEnabled
        );
    }

    @GetMapping("/hello")
    public ResponseEntity<Map<String, String>> sayHiToTheWorld(){
        Map<String, String> response = Map.of("message", "Hello from K8s Demo v2!",
                "version", "2.0",
                "timestamp", Instant.now().toString());
        return ResponseEntity.ok(response);
    }
}
