package com.iliyass;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@SpringBootApplication
@RestController
public class BackendApplication {

	public static void main(String[] args) {
		SpringApplication.run(BackendApplication.class, args);
	}

	/**
	 * @return JsonResponse
	 */
	@GetMapping("/records")
	public JsonResponse records() {
		return new JsonResponse(200, "success", Map.of("records", List.of("Record 1", "Record 2", "Record 3")));
	}

	record JsonResponse(int statusCode, String message, Object response) {}

}
