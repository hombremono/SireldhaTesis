package ar.com.iua.modulo.model;



import java.io.Serializable;
import java.util.Set;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import ar.com.iua.modulo.model.interfaces.*;
import org.hibernate.annotations.Proxy;
@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "users")
public class User implements IWithId, IWithName, Serializable {

	private static final long serialVersionUID = 8951432881307933647L;
	
	private boolean accountEnabled = true;
	private boolean accountExpired = false;
	private boolean accountLocked = false;
	private boolean credentialsExpired = false;
	@Column(unique = true, nullable = false)
	private String email;
	private String fistName;
	@Id
	@GeneratedValue
	private int id;
	private String lastName;
	@Column(unique = true, nullable = false)
	private String name;
	private String password;
	
	@ManyToMany( fetch = FetchType.EAGER)
	@JoinTable(name="userroles", joinColumns = {
			@JoinColumn(name = "idUser", referencedColumnName = "id") }, inverseJoinColumns = {
					@JoinColumn(name = "idRole", referencedColumnName = "id") })
	private Set<Role> roles;
	
	@ManyToMany( fetch = FetchType.EAGER)
	@JoinTable(name="userprivileges", joinColumns = {
			@JoinColumn(name = "idUser", referencedColumnName = "id") }, inverseJoinColumns = {
					@JoinColumn(name = "idPrivilege", referencedColumnName = "id") })
	private Set<Privilege> privileges;

	public Set<Privilege> getPrivileges() {
		return privileges;
	}

	public void setPrivileges(Set<Privilege> privileges) {
		this.privileges = privileges;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	
	@Override
	public boolean equals(Object obj) {
		return ((User) obj).getId() == getId() || ((User) obj).getName().equals(getName());
	}
	public String getEmail() {
		return email;
	}
	public String getFistName() {
		return fistName;
	}
	public int getId() {
		return id;
	}
	public String getLastName() {
		return lastName;
	}
	public String getName() {
		return name;
	}
	public String getPassword() {
		return password;
	}
	@Override
	public int hashCode() {
		return getId();
	}
	public boolean isAccountEnabled() {
		return accountEnabled;
	}
	public boolean isAccountExpired() {
		return accountExpired;
	}
	public boolean isAccountLocked() {
		return accountLocked;
	}
	public boolean isCredentialsExpired() {
		return credentialsExpired;
	}
	public void setAccountEnabled(boolean accountEnabled) {
		this.accountEnabled = accountEnabled;
	}
	public void setAccountExpired(boolean accountExpired) {
		this.accountExpired = accountExpired;
	}
	public void setAccountLocked(boolean accountLocked) {
		this.accountLocked = accountLocked;
	}
	public void setCredentialsExpired(boolean credentialsExpired) {
		this.credentialsExpired = credentialsExpired;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	public void setFistName(String fistName) {
		this.fistName = fistName;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	
	public void setName(String name) {
		this.name = name;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
	@Override
	public String toString() {
		return String.format("User: [%d] %s {enabled:%s, expired:%s, locked:%s, credentialsExpired:%s}", getId(),
				getName(), isAccountEnabled(), isAccountExpired(), isAccountLocked(), isCredentialsExpired());
	}

}
