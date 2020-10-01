package pl.coderslab.charity.domain.controllers;

import lombok.RequiredArgsConstructor;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import pl.coderslab.charity.domain.model.donation.DonationService;
import pl.coderslab.charity.domain.model.institution.Institution;
import pl.coderslab.charity.domain.model.institution.InstitutionService;

import java.util.ArrayList;
import java.util.List;

import static org.hamcrest.Matchers.empty;
import static org.mockito.BDDMockito.given;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@AutoConfigureMockMvc
@WebMvcTest(HomeController.class)
@ContextConfiguration(classes = {HomeController.class})
@RequiredArgsConstructor
class HomeControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    InstitutionService institutionService;

    @MockBean
    DonationService donationService;


    @Test
    void shouldReturnStatusOkOnHomeAction() throws Exception {

        List<Institution> institutions = new ArrayList<>();
        given(institutionService.findAll()).willReturn(institutions);
        given(donationService.countAll()).willReturn(5L);
        given(donationService.countBags()).willReturn(12L);

        mockMvc
                .perform(MockMvcRequestBuilders.get("/"))
                .andExpect(forwardedUrl("/WEB-INF/views/index.jsp"))
                .andExpect(model().attribute("donationsNumber", 5L))
                .andExpect(model().attribute("bagsNumber", 12L))
                .andExpect(model().attribute("institutions", empty()))
                .andExpect(status().isOk());
    }
}