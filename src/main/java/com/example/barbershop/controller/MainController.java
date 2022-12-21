package com.example.barbershop.controller;

import com.example.barbershop.domain.Message;
import com.example.barbershop.domain.Service;
import com.example.barbershop.domain.User;
import com.example.barbershop.repos.MessageRepo;
import com.example.barbershop.repos.ServiceRepo;
import com.example.barbershop.service.MailSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class MainController {
    @Autowired
    private MessageRepo messageRepo;

    @Autowired
    private ServiceRepo serviceRepo;

    @Autowired
    private MailSender mailSender;

    @GetMapping("/")
    public String greeting() {
        return "index";
    }

    @PostMapping("/")
    public String promo(@RequestParam String promo) {
        int randNum = (int) ((Math.random()*60)*10000);
        if (!StringUtils.isEmpty(promo)) {
            String message = String.format(
                    "Hello, man! \n" +
                            "Your promo code is BARBER%s",
                    randNum
            );

            mailSender.send(promo, "Barbershop Promo Code", message);
        }

        return "index";
    }

    @GetMapping("/booking")
    public String booking(Map<String, Object> model) {
        Iterable<Message> messages = messageRepo.findAll();

        model.put("messages", messages);

        return "booking";
    }

    @PostMapping("promo")
    public String sellPromo(
            @RequestParam String promo,
            Map<String, Object> model
    ) {
        int randNum = (int) ((Math.random()*60)*10000);

        if (!StringUtils.isEmpty(promo)) {
            String message = String.format(
                    "Hello, man! \n" +
                            "Your promo code is BARBER%s",
                    randNum
            );

            mailSender.send(promo, "Barbershop Promo Code", message);
        }

        Iterable<Message> messages = messageRepo.findAll();

        model.put("messages", messages);

        return "booking";
    }

    @PostMapping("/booking")
    public String services(
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String date,
            @RequestParam String time,
            @RequestParam String comment,
            Map<String, Object> model
    ) {
        Service service = new Service(name, email, date, time, comment);

        serviceRepo.save(service);

        if (!StringUtils.isEmpty(email)) {
            String message = String.format(
                    "Hello, %s! \n" +
                            "You are booked for a haircut at our Barbershop.\n" +
                            "Date: %s.\n" + "Time: %s.\n" + "Your comment: %s.",
                    name,
                    date,
                    time,
                    comment
            );

            mailSender.send(email, "Barbershop Booking", message);
        }

        Iterable<Message> messages = messageRepo.findAll();

        model.put("messages", messages);

        return "booking";
    }

    @GetMapping("/notes")
    public String notes(Map<String, Object> model) {
        Iterable<Service> services = serviceRepo.findAll();

        model.put("services", services);

        return "notes";
    }

    @GetMapping("/services")
    public String getNewNotes(Map<String, Object> model) {
        Iterable<Message> messages = messageRepo.findAll();

        model.put("messages", messages);

        return "services";
    }

    @PostMapping("/services")
    public String add(
            @RequestParam String text,
            @RequestParam String price,
            Map<String, Object> model
    ) {
        Message message = new Message(text, price);

        messageRepo.save(message);

        Iterable<Message> messages = messageRepo.findAll();

        model.put("messages", messages);

        return "services";
    }

    @PostMapping("/services/delete")
    public String remove(
            @RequestParam("messageId") Message message
    ) {
        messageRepo.delete(message);

        return "redirect:/services";
    }
}
