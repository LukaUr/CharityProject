package pl.coderslab.charity.domain.controllers;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import pl.coderslab.charity.domain.model.donation.DonationService;
import pl.coderslab.charity.domain.model.institution.Institution;
import pl.coderslab.charity.domain.model.institution.InstitutionService;

import java.util.Arrays;
import java.util.List;

import static org.mockito.BDDMockito.given;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

@RunWith(SpringRunner.class)
@WebMvcTest(HomeController.class)
public class HomeControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private InstitutionService institutionService;

    @MockBean
    private DonationService donationService;

    @Before
    public void setUp(){
        given(donationService.countBags()).willReturn(12L);
        given(donationService.countAll()).willReturn(5L);
        List<Institution> institutions = Arrays.asList(new Institution(), new Institution());
        given(institutionService.findAll()).willReturn(institutions);
    }

    @Test
    public void shouldReturnStatusOkOnHomeAction() throws Exception {
        mockMvc .perform(get("/"))
                .andExpect(forwardedUrl("/WEB-INF/views/index.jsp"))
                .andExpect(status().isOk());
    }

    @Test
    public void shouldExpectAttributeDonationsNumber() throws Exception {
        mockMvc .perform(get("/"))
                .andExpect(model().attribute("donationsNumber", 5L));
    }

    @Test
    public void shouldExpectAttributeInstitutions() throws Exception {
        mockMvc .perform(get("/"))
                .andExpect(model().attribute("institutions", Arrays.asList(new Institution(), new Institution())));
    }

    @Test
    public void shouldExpectAttributeBagsNumber() throws Exception {
        mockMvc .perform(get("/"))
                .andExpect(model().attribute("bagsNumber", 12L));
    }
}