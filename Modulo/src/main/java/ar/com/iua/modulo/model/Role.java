package ar.com.iua.modulo.model;

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

import org.hibernate.annotations.Proxy;

@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "roles")
public class Role implements IDto {

	private static final long serialVersionUID = -3762160433302391028L;
	@Id
	@GeneratedValue
	private int id;
	@Column(unique = true, nullable = false)
	private String name;
	
	@ManyToMany( fetch = FetchType.EAGER)
	@JoinTable(name="roleprivileges", joinColumns = {
			@JoinColumn(name = "idRole", referencedColumnName = "id") }, inverseJoinColumns = {
					@JoinColumn(name = "idPrivilege", referencedColumnName = "id") })
	private Set<Privilege> privileges;

	public Set<Privilege> getPrivileges() {
		return privileges;
	}

	public void setPrivileges(Set<Privilege> privileges) {
		this.privileges = privileges;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public boolean equals(Object obj) {
		return ((Role) obj).getId() == getId() || ((Role) obj).getName().equals(getName());
	}

	@Override
	public int hashCode() {
		return getId();
	}

	@Override
	public String toString() {
		return String.format("Role: [%d] %s", getId(), getName());
	}

}
