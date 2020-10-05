package pl.coderslab.charity.domain.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.domain.model.category.Category;
import pl.coderslab.charity.domain.model.category.CategoryService;
import pl.coderslab.charity.domain.model.donation.Donation;
import pl.coderslab.charity.domain.model.donation.DonationService;
import pl.coderslab.charity.domain.model.institution.Institution;
import pl.coderslab.charity.domain.model.institution.InstitutionService;

import java.util.List;

@Controller
@RequestMapping("/donation")
@RequiredArgsConstructor
public class DonationController {

    private final InstitutionService institutionService;
    private final CategoryService categoryService;
    private final DonationService donationService;

    @ModelAttribute("institutions")
    private List<Institution> institutions() {
        return institutionService.findAll();
    }

    @ModelAttribute("categories")
    private List<Category> categories() {
        return categoryService.findAll();
    }

    @GetMapping
    public String showForm(Model model) {
        model.addAttribute("donation", new Donation());
        return "form";
    }

    @PostMapping
    public String processForm(@ModelAttribute Donation donation) {
        donationService.createDonation(donation);
        return "redirect:/";
    }
}
