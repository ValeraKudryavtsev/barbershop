package com.example.barbershop.controller;

import com.example.barbershop.domain.User;
import com.example.barbershop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class RegistrationController {
//    не существует или ошибка в пароле: ничего не просходит

    @Autowired
    private UserService userService;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model) {
        if (!userService.addUser(user)) {
            model.put("message", "У вас уже есть аккаунт");
            return "registration";
        }

        return "redirect:/login";
    }

    @GetMapping("/login")
    public String alert(
            Map<String, Object> model,
            @RequestParam (name = "error", required = false, defaultValue = "") String message
    ) {
        if(message.contains("true")) {
            model.put("message", "Неверный логин или пароль");
        }

        return "login";
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code) {
        boolean isActivated = userService.activateUser(code);

        if (isActivated) {
            model.addAttribute("message", "Аккаунт успешно активирован");
        } else {
            model.addAttribute("message", "Код активации не найден");
        }

        return "login";
    }
}