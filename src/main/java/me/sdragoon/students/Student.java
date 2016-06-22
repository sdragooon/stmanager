package me.sdragoon.students;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * @author syj on 16. 6. 15..
 */
@Entity
@Getter
@Setter
@Table(name = "students")
public class Student {

    @Id @GeneratedValue
    private Long id;

    private String studentname;

    private String gender;

    private String contact;

    private String since;

    private String studentstatus;
}
