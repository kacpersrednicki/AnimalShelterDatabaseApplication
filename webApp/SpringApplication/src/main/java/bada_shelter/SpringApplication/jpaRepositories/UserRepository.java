package bada_shelter.SpringApplication.jpaRepositories;

import bada_shelter.SpringApplication.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserRepository extends JpaRepository<User, String> {
    @Query("SELECT u FROM User u " +
            "WHERE (:firstName IS NULL OR LOWER(u.firstName) LIKE LOWER(CONCAT('%', :firstName, '%'))) " +
            "AND (:lastName IS NULL OR LOWER(u.lastName) LIKE LOWER(CONCAT('%', :lastName, '%'))) " +
            "AND (:username IS NULL OR LOWER(u.username) LIKE LOWER(CONCAT('%', :username, '%'))) " +
            "AND (:pesel IS NULL OR LOWER(u.pesel) LIKE LOWER(CONCAT('%', :pesel, '%'))) " +
            "AND (:gender IS NULL OR u.gender = :gender) " +
            "AND (:email IS NULL OR u.email = :email) " +
            "AND (:phone IS NULL OR u.phone = :phone)")
    List<User> searchUser(@Param("firstName") String firstName,
                          @Param("lastName") String lastName,
                          @Param("username") String username,
                          @Param("pesel") String pesel,
                          @Param("gender") String gender,
                          @Param("email") String email,
                          @Param("phone") String phone);
    User findUserByUsername(String username);

}