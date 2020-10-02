package pl.coderslab.charity.domain.model.donation;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Bean;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;
import static org.mockito.BDDMockito.given;

@RunWith(SpringRunner.class)
public class DonationServiceTest {

    @TestConfiguration
    public static class DonationServiceTestConfoguration {

        @Autowired
        private DonationRepository donationRepository;

        @Bean
        public DonationService donationService() {
            return new DonationService(donationRepository);
        }
    }

    @Autowired
    private DonationService donationService;

    @MockBean
    private DonationRepository donationRepository;

    @Before
    public void setUp() {
        given(donationRepository.count()).willReturn(45L);
        given(donationRepository.getNumberOfBags()).willReturn(12L);
    }

    @Test
    public void shouldReturnNumberOfDonations() {
        long donations = donationService.countAll();
        assertEquals(45L, donations);
    }

    @Test
    public void shouldReturnNumberOfBags() {
        long bags = donationService.countBags();
        assertEquals(12L, bags);
    }
}