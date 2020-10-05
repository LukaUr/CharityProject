package pl.coderslab.charity.domain.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import pl.coderslab.charity.domain.model.donation.DonationService;
import pl.coderslab.charity.domain.model.institution.Institution;
import pl.coderslab.charity.domain.model.institution.InstitutionService;

import java.util.List;


@Controller
@RequiredArgsConstructor
public class HomeController {

    private final InstitutionService institutionService;
    private final DonationService donationService;

    @ModelAttribute("institutions")
    private List<Institution> institutions() {
        return institutionService.findAll();
    }

    @ModelAttribute("donationsNumber")
    private long donationsNumber() {
        return donationService.countAll();
    }

    @ModelAttribute("bagsNumber")
    private long bagsNumber() {
        return donationService.countBags();
    }

    @GetMapping("/")
    public String homeAction(){
        return "index";
    }
}
