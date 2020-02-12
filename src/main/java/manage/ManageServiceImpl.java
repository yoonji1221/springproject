package manage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManageServiceImpl implements ManageService {
	@Autowired
	ManageDAO dao;
}
