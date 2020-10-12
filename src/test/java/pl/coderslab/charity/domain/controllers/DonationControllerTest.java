package pl.coderslab.charity.domain.controllers;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Spy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import pl.coderslab.charity.domain.model.category.Category;
import pl.coderslab.charity.domain.model.category.CategoryService;
import pl.coderslab.charity.domain.model.donation.DonationService;
import pl.coderslab.charity.domain.model.institution.Institution;
import pl.coderslab.charity.domain.model.institution.InstitutionService;

import java.util.ArrayList;
import java.util.List;

import static org.mockito.BDDMockito.given;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringRunner.class)
@WebMvcTest(DonationController.class)
public class DonationControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private InstitutionService institutionService;

    @MockBean
    private CategoryService categoryService;

    @MockBean
    private DonationService donationService;

    @Spy
    List<Institution> institutionList = new ArrayList<>();

    @Spy
    List<Category> categoryList = new ArrayList<>();

    @Before
    public void setUp(){
        institutionList.add(new Institution());
        institutionList.add(new Institution());
        institutionList.add(new Institution());
        given(institutionService.findAll()).willReturn(institutionList);
        categoryList.add(new Category());
        categoryList.add(new Category());
        categoryList.add(new Category());
        given(categoryService.findAll()).willReturn(categoryList);

    }

    @Test
    public void shouldAddInstitutionsToForm() throws Exception {
        mockMvc.perform(get("/donation"))
                .andExpect(status().isOk())
                .andExpect((model().attribute("institutions", institutionList)));
    }

    @Test
    public void shouldAddCategoriesToForm() throws Exception {
        mockMvc.perform(get("/donation"))
                .andExpect(status().isOk())
                .andExpect((model().attribute("categories", categoryList)));
    }


}