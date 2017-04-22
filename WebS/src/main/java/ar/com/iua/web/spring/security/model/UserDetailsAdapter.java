package ar.com.iua.web.spring.security.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;

import ar.com.iua.modulo.model.Privilege;
import ar.com.iua.modulo.model.Role;
import ar.com.iua.modulo.model.User;

public class UserDetailsAdapter extends User implements org.springframework.security.core.userdetails.UserDetails {


	private static final long serialVersionUID = 6191672415032217806L;

	public UserDetailsAdapter() {
		
	}
	public UserDetailsAdapter(User user) {
		setName(user.getName());
		setAccountEnabled(user.isAccountEnabled());
		setAccountExpired(user.isAccountExpired());
		setAccountLocked(user.isAccountLocked());
		setCredentialsExpired(user.isCredentialsExpired());
		setEmail(user.getEmail());
		setFistName(user.getFistName());
		setLastName(user.getLastName());
		setId(user.getId());
		setPassword(user.getPassword());
		setPrivileges(user.getPrivileges());
		setRoles(user.getRoles());
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<String> l = new ArrayList<String>();
		for (Role r : getRoles()) {
			l.add(r.getName());
			for (Privilege p : r.getPrivileges())
				l.add(p.getName());
		}
		for (Privilege p : getPrivileges())
			l.add(p.getName());

		return AuthorityUtils.createAuthorityList(l.toArray(new String[0]));
	}

	@Override
	public String getUsername() {
		
		return getName();
	}

	@Override
	public boolean isAccountNonExpired() {
		
		return !isAccountExpired();
	}

	@Override
	public boolean isAccountNonLocked() {
		return !isAccountLocked();
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return !isCredentialsExpired();
	}
	@Override
	public boolean isEnabled() {
		return isAccountEnabled();
	}

	

}
