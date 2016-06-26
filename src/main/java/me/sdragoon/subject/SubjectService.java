package me.sdragoon.subject;

import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.security.auth.login.AccountNotFoundException;

/**
 * @author syj on 16. 6. 16..
 */
@Service
@Transactional
@Slf4j
public class SubjectService {

    @Autowired
    private SubjectRepository repository;

    @Autowired
    private ModelMapper modelMapper;

    public Subject createSubject(Subject dto) {

        Subject subject = modelMapper.map(dto, Subject.class);

        String classname = dto.getClassname();
        int price = dto.getPrice();

        subject.setClassname(classname);
        subject.setPrice(price);

        return repository.save(subject);
    }

    public void deleteSubject(Long id) {
        repository.delete(id);
    }
}
