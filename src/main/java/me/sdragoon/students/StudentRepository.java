package me.sdragoon.students;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

/**
 * @author syj on 16. 6. 15..
 */
@Service
public interface StudentRepository extends JpaRepository<Student, Long>{

}
