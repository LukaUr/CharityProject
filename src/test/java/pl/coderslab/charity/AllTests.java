package pl.coderslab.charity;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;
import pl.coderslab.charity.domain.controllers.HomeControllerTest;
import pl.coderslab.charity.domain.model.donation.DonationRepositoryTest;
import pl.coderslab.charity.domain.model.institution.InstitutionRepositoryTest;

@RunWith(Suite.class)
@SuiteClasses({
        HomeControllerTest.class,
        DonationRepositoryTest.class,
        InstitutionRepositoryTest.class
//        DonationService.class   -> here results in initializationError; if run separately, everything is ok
})
public class AllTests {

}
