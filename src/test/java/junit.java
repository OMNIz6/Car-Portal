

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;

import com.rst.carportal.config.JpaConfig;
import com.rst.carportal.config.SecurityConfig;
import com.rst.carportal.config.WebMvcConfig;
import com.rst.carportal.entities.Appointment;
import com.rst.carportal.entities.Car;
import com.rst.carportal.entities.User;
import com.rst.carportal.service.UserService;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes={WebMvcConfig.class, JpaConfig.class, SecurityConfig.class})
@WebAppConfiguration

public class junit {
	
	private MockMvc mockMvc;
	 
	@Autowired private WebApplicationContext context;

	@Autowired
	private UserService uservice;

	@BeforeEach public void setup() { this.mockMvc =
			 MockMvcBuilders.webAppContextSetup(context).apply(springSecurity()).build();
	}
	 
	@Test
	public void fecthPassword() throws Exception {
		String test = uservice.getProfile(11).getPassword();
		System.out.println("The user password is : " + test);
		assertNotEquals("123",test);
	}
	
	@Test
	public void getAppointments() throws Exception {
		User user = new User(15);
		List<Appointment> test = uservice.findAllAppointment(user);
		for(Appointment app : test) {
			System.out.println(app.toString());
		}
		
		assertNotEquals("123",test);
	}
	@Test
	public void postCar() throws Exception {
		User user = new User(1);
		Car car = new Car( "das", "sadas", "qweqw", "asdaw", "asfqw", "dwqdw", "asdw", "asqw", "dasdqw", user);
		Boolean test = (uservice.postCar(car) == car);
		System.out.println("The user password is : " + test);
		assertEquals(true,test);
	}
	
	@Test
    @WithMockUser(username = "okp", authorities = {"admin"})
    public void testManageUsers() throws Exception {
        this.mockMvc.perform(MockMvcRequestBuilders.get("/users"))
                .andDo(print()).andExpect(status().isOk());
    }
	@Test
    @WithMockUser(username = "okp", authorities = {"user"})
    public void testGetCars() throws Exception {
        this.mockMvc.perform(MockMvcRequestBuilders.get("/users"))
                .andDo(print()).andExpect(status().isForbidden());
    }

}

	
	
