package pl.coderslab.charity.domain.model.donation;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@DataJpaTest
public class DonationRepositoryTest {

    @Autowired
    private TestEntityManager testEntityManager;

    @Autowired
    private DonationRepository donationRepository;

    @Before
    public void setUp() {
        Donation donation1 = new Donation();
        donation1.setQuantity(6);
        testEntityManager.persist(donation1);
        Donation donation2 = new Donation();
        donation2.setQuantity(3);
        testEntityManager.persist(donation2);
        testEntityManager.flush();
    }

    @Test
    public void shouldReturnSumOfBags() {
        long numberOfBags = donationRepository.getNumberOfBags();
        assertEquals(9L, numberOfBags);
    }
}