package ch.vaudoise.vaapi.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class HelloController {

    @GetMapping("/hello-world")
    public Map<String, String> helloWorld() {
        return Map.of("Hello", "World!");
    }
}
