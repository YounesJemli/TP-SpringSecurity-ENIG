package tn.enig.config;

import javax.activation.DataSource;

import org.springframework.beans.factory.annotation.*;
import org.springframework.context.annotation.*;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class Security extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		PasswordEncoder encoder = new BCryptPasswordEncoder();

		auth.inMemoryAuthentication().withUser("admin").password(encoder.encode("admin")).roles("ADMIN").and()
				.withUser("agent").password(encoder.encode("agent")).roles("AGENT").and().withUser("user")
				.password(encoder.encode("user")).roles("USER");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.formLogin().defaultSuccessUrl("/listeDepartements").and().formLogin();;

		http.authorizeRequests().antMatchers("/listeDepartements", "/logout").hasAnyRole("USER", "AGENT", "ADMIN");

		http.authorizeRequests().antMatchers("/materialList/*", "/addMaterial").hasAnyRole("AGENT", "ADMIN");

		http.authorizeRequests().antMatchers("/deleteMaterial/*").hasRole("ADMIN");

		http.authorizeRequests().anyRequest().authenticated();

		http.csrf().disable();
	}

}
