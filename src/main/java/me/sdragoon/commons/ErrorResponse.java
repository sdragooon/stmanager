package me.sdragoon.commons;

import lombok.Data;
import org.springframework.validation.FieldError;

import java.io.Serializable;
import java.util.List;

/**
 * @author syj on 16. 6. 3..
 */
@Data
public class ErrorResponse {
    private String message;

    private String code;

    private List<FieldError> errors;

    //TODO 자세한 에러내용
    public static class FieldError {
        private String field;
        private String value;
        private String reason;
    }
}
