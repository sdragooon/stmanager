package me.sdragoon.students;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.modelmapper.ModelMapper;

/**
 * @author syj on 16. 6. 15..
 */
@Service
@Transactional
@Slf4j
public class StudentService {

    @Autowired
    private StudentRepository repository;

    @Autowired
    private ModelMapper modelMapper;

    public Student createStudent(Student dto) {

        Student student = modelMapper.map(dto, Student.class);

        String contact = dto.getContact();
        String gender = dto.getGender();
        String since = dto.getSince();
        String studentname = dto.getStudentname();
        String studentstatus = dto.getStudentstatus();

        student.setContact(contact);
        student.setGender(gender);
        student.setSince(since);
        student.setStudentname(studentname);
        student.setStudentstatus(studentstatus);

        return repository.save(student);
    }
}
