package me.sdragoon.students;

import me.sdragoon.commons.ErrorResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

import java.util.List;
import java.util.stream.Collectors;

import static org.springframework.web.bind.annotation.RequestMethod.*;

/**
 * @author syj on 16. 6. 15..
 */
@RestController
@EnableAutoConfiguration
public class StudentController {

    @Autowired
    private StudentService service;

    @Autowired
    private StudentRepository repository;

    @Autowired
    private ModelMapper modelMapper;

    @RequestMapping(value = "/studentjoin", method = GET)
    public String studentjoin() {
        return "/studentjoin";
    }

    @RequestMapping(value = "/students", method = POST)
    public ResponseEntity createStudent(@RequestBody @Valid Student student,
                                        BindingResult result) {

        if(result.hasErrors()) {
            ErrorResponse errorResponse = new ErrorResponse();
            errorResponse.setMessage("잘못된 요청입니다");
            errorResponse.setCode("bad.request");
            return new ResponseEntity(errorResponse, HttpStatus.BAD_REQUEST);
        }

        Student newStudent = service.createStudent(student);
        return new ResponseEntity<>(modelMapper.map(newStudent, Student.class), HttpStatus.CREATED);
    }

    @RequestMapping(value = "/students", method = GET)
    public ResponseEntity getStudents(@PageableDefault(sort = { "studentname" }, direction = Sort.Direction.ASC) Pageable pageable) {
        Page<Student> page = repository.findAll(pageable);
        List<Student> content = page.getContent().parallelStream()
                .map(student -> modelMapper.map(student, Student.class))
                .collect(Collectors.toList());

        PageImpl<Student> result = new PageImpl<>(content, pageable, page.getTotalElements());
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
}