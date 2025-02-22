package bada_shelter.SpringApplication.controllers;

import bada_shelter.SpringApplication.jpaRepositories.AuthorityRepository;
import bada_shelter.SpringApplication.services.AuthorityService;
import bada_shelter.SpringApplication.jpaRepositories.UserRepository;
import bada_shelter.SpringApplication.models.Authority;
import bada_shelter.SpringApplication.models.User;
import bada_shelter.SpringApplication.models.UserAddingModel;
import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class StaffController {
    private AuthorityService authorityService;
    private UserRepository userRepository;
    private AuthorityRepository authorityRepository;
    @Autowired
    public StaffController(UserRepository userRepository,AuthorityRepository authorityRepository,AuthorityService authorityService) {
        this.userRepository = userRepository;
        this.authorityRepository = authorityRepository;
        this.authorityService = authorityService;
    }

    @GetMapping("/addStaffMember")
    public String showUserAddingPanel(Model model){
        UserAddingModel userAddingModel = new UserAddingModel();
        model.addAttribute("addingModel",userAddingModel);
        return "/staff/admin/add_user_panel";
    }
    @PostMapping("/addStaffMember")
    public String addStaffMember(Model model, @ModelAttribute("addingModel") UserAddingModel userAddingModel) throws ParseException {
        User addedUser = userAddingModel.getUser();
        if(userRepository.findUserByUsername(addedUser.getUsername())!=null) return "redirect:/addStaffMember?errorExists";
        if(!EmailValidator.getInstance().isValid(addedUser.getEmail())) return "redirect:/addStaffMember?invalidEmail";
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        addedUser.setPassword(encoder.encode(addedUser.getPassword()));
        Authority addedAuthority = userAddingModel.getAuthority();
        addedAuthority.setUser(addedUser);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        if (userAddingModel.getBirthDateString() !="") {
            Date parsed = format.parse(userAddingModel.getBirthDateString());
            addedUser.setBirthDate(parsed);
        }
        userRepository.save(addedUser);
        authorityRepository.save(addedAuthority);
        model.addAttribute("successType","addUser");
        return "staff/successful_operation";
    }
    //TODO:TO BE IMPROVED
    @GetMapping("/searchUsers")
    public String searchUser(Model model,
                             @RequestParam(name = "username", required = false) String username,
                             @RequestParam(name = "firstName", required = false) String firstName,
                             @RequestParam(name = "lastName", required = false) String lastName,
                             @RequestParam(name = "pesel", required = false) String pesel,
                             @RequestParam(name = "gender", required = false) String gender,
                             @RequestParam(name = "email", required = false) String email,
                             @RequestParam(name = "phone", required = false) String phone
                             ){

        List<User> foundUsers = userRepository.searchUser(firstName, lastName, username, pesel,gender,email,phone);
        authorityService.assignCurrentAuthorties(foundUsers);
        model.addAttribute("foundUsers",foundUsers);
        return "/staff/admin/searchUserResult";
    }
    @GetMapping("/searchUsersPanel")
    public String showSearchUserPanel(Model model){
        return "/staff/admin/search_user";
    }

    @GetMapping("/userPage/{username}")
    public String showUserInfoPage(@PathVariable String username, Model model){
        User user = userRepository.findUserByUsername(username);
        authorityService.assignCurrentAuthority(user);
        model.addAttribute("user",user);
        return "/staff/admin/userPage";
    }
    @GetMapping("/changePassword")
    public String showChangePasswordPanel(Model model){
        return "/staff/changePassword";
    }
    @PostMapping("/changePassword")
    public String changePassword(HttpServletRequest request, Model model,
                                 @RequestParam("oldPassword") String oldPassword,
                                 @RequestParam("newPassword") String newPassword,
                                 @RequestParam("confirmPassword") String confirmPassword) {
        if(!newPassword.equals(confirmPassword)) return "redirect:/changePassword?errorMatchingPassword";
        String username = request.getRemoteUser();
        User user = userRepository.findUserByUsername(username);
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        if (!encoder.matches(oldPassword, user.getPassword())) {
            return "redirect:/changePassword?errorOldPassword";
        }
        String newPasswordHash = encoder.encode(newPassword);
        user.setPassword(newPasswordHash);
        userRepository.save(user);
        model.addAttribute("successType", "changePassword");
        return "/staff/successful_operation";
    }

    @PostMapping("/deleteUser/{username}")
    public String deleteUser(Model model, @PathVariable String username){
        User deletedUser = userRepository.findUserByUsername(username);
        Authority authority = authorityRepository.findAuthorityByUser(deletedUser);
        authorityRepository.delete(authority);
        userRepository.delete(deletedUser);
        model.addAttribute("successType","deleteUser");
        return "/staff/successful_operation";
    }

}
