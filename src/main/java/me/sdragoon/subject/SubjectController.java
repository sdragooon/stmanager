package me.sdragoon.subject;

import me.sdragoon.commons.ErrorResponse;
import me.sdragoon.students.Student;
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
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

import java.util.List;
import java.util.stream.Collectors;

import static org.springframework.web.bind.annotation.RequestMethod.*;
/**
 * @author syj on 16. 6. 16..
 */
@RestController
@EnableAutoConfiguration
public class SubjectController {

    @Autowired
    private SubjectService service;

    @Autowired
    private SubjectRepository repository;

    @Autowired
    private ModelMapper modelMapper;

    @RequestMapping(value = "/subject", method = POST)
    public ResponseEntity createSubject(@RequestBody @Valid Subject subject,
                                        BindingResult result) {
        if(result.hasErrors()) {
            ErrorResponse errorResponse = new ErrorResponse();
            errorResponse.setMessage("잘못된 요청입니다.");
            errorResponse.setCode("bad.request");
            return new ResponseEntity(errorResponse, HttpStatus.BAD_REQUEST);
        }

        Subject newSubject = service.createSubject(subject);
        return new ResponseEntity<>(modelMapper.map(newSubject, Subject.class), HttpStatus.CREATED);
    }

    @RequestMapping(value = "/subject", method = GET)
    public ResponseEntity getStudents(@PageableDefault(sort = { "price" }, direction = Sort.Direction.ASC) Pageable pageable) {
        Page<Subject> page = repository.findAll(pageable);
        List<Subject> content = page.getContent().parallelStream()
                .map(subject -> modelMapper.map(subject, Subject.class))
                .collect(Collectors.toList());

        PageImpl<Subject> result = new PageImpl<>(content, pageable, page.getTotalElements());
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @RequestMapping(value = "/subject/{id}", method = DELETE)
    public ResponseEntity deleteSubject(@PathVariable Long id) {
        service.deleteSubject(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}