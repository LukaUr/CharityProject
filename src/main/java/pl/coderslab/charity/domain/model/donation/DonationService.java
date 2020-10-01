package pl.coderslab.charity.domain.model.donation;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class DonationService {

    private final DonationRepository donationRepository;

    public long countAll() {
        return donationRepository.count();
    }

    public long countBags() {
        return donationRepository.getNumberOfBags();
    }
}
