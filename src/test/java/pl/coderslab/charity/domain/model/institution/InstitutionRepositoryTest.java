package pl.coderslab.charity.domain.model.institution;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@DataJpaTest
public class InstitutionRepositoryTest {

    @Autowired
    private TestEntityManager testEntityManager;

    @Autowired
    private InstitutionRepository institutionRepository;

    private Institution institution1 = new Institution();
    private Institution institution2 = new Institution();

    @Before
    public void setUp() {
        institution1.setName("Fundacja");
        institution1 = testEntityManager.persist(institution1);
        institution2.setName("Stowarzyszenie");
        institution2 = testEntityManager.persist(institution2);
        testEntityManager.flush();
    }

    @Test
    public void shouldReadAllInstitutions() {
        List<Institution> institutions = institutionRepository.findAll();
        assertEquals(institutions.size(), 2);
        assertTrue(institutions.contains(institution1));
        assertTrue(institutions.contains(institution2));

    }
}