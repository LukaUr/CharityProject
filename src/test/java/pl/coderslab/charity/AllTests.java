package pl.coderslab.charity;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;
import pl.coderslab.charity.domain.controllers.DonationControllerTest;
import pl.coderslab.charity.domain.controllers.HomeControllerTest;
import pl.coderslab.charity.domain.model.donation.DonationRepositoryTest;
import pl.coderslab.charity.domain.model.donation.DonationServiceTest;
import pl.coderslab.charity.domain.model.institution.InstitutionRepositoryTest;

@RunWith(Suite.class)
@SuiteClasses({
        HomeControllerTest.class,
        DonationRepositoryTest.class,
        InstitutionRepositoryTest.class,
        DonationServiceTest.class,
        DonationControllerTest.class
})
public class AllTests {

}
