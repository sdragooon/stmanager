package me.sdragoon;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author syj on 16. 6. 22..
 */
@Controller
public class MainController {

    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping("/sj")
    public String studentjoin() {
        return "studentjoin";
    }

    @RequestMapping("/cj")
    public String classjoin() {
        return "classjoin";
    }
}