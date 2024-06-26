package com.chtrembl.petstoreapp.controller;

import com.chtrembl.petstoreapp.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

/**
 * REST controller to facilitate REST calls such as session keep alives
 * (progressive web apps)
 */
@RestController
public class RestAPIController {

    public static final String SESSION_ID = "session-id";

    @Autowired
    private User sessionUser;

    @GetMapping("/api/contactus")
    public String contactus() {

        this.sessionUser.getTelemetryClient().trackEvent(
                String.format("PetStoreApp user %s requesting Contact Us", this.sessionUser.getName()),
                this.sessionUser.getCustomEventProperties(), null);

        return "Please contact Azure PetStore at 401-555-5555. Thank you. Demo 6/13";
    }

    @GetMapping("/api/sessionid")
    public String sessionid() {

        return this.sessionUser.getSessionId();
    }

    @GetMapping(value = "/introspectionSimulation", produces = MediaType.APPLICATION_JSON_VALUE)
    public String introspectionSimulation(Model model, HttpServletRequest request,
                                          @RequestParam(name = "sessionIdToIntrospect") Optional<String> sessionIdToIntrospect) {
        boolean active = (sessionIdToIntrospect.isPresent()
                && sessionIdToIntrospect.get().equals(request.getHeader(SESSION_ID)));

        return "{\n" +
                "  \"active\": " + active + ",\n" +
                "  \"scope\": \"read write email\",\n" +
                "  \"client_id\": \"" + request.getHeader(SESSION_ID) + "\",\n" +
                "  \"username\": \"" + request.getHeader(SESSION_ID) + "\",\n" +
                "  \"exp\": 1911221039\n" +
                "}";
    }
}
