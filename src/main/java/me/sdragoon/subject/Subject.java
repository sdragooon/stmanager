package me.sdragoon.subject;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * @author syj on 16. 6. 16..
 */
@Entity
@Setter
@Getter
@Table(name = "classprice")
public class Subject {

    @Id @GeneratedValue
    private Long id;

    private String classname;

    private int price;
}
