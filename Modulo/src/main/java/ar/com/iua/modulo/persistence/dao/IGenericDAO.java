package ar.com.iua.modulo.persistence.dao;

import java.io.Serializable;
import java.util.List;

import org.apache.commons.dbutils.ResultSetHandler;

import ar.com.iua.modulo.exception.NotFoundException;
import ar.com.iua.modulo.persistence.exception.PersistenceException;

public interface IGenericDAO<Entity, PK extends Serializable> extends Serializable {

	public Entity load(PK id) throws PersistenceException, NotFoundException;          

	public Entity save(Entity t) throws PersistenceException;        

	public Entity saveOrUpdate(Entity t) throws PersistenceException;

	public Entity update(Entity t) throws PersistenceException, NotFoundException;     

	public void delete(Entity t) throws PersistenceException, NotFoundException;   

	public List<Entity> list() throws PersistenceException;        

	public String selectToJson(String sql) throws PersistenceException;
	
	public List<?> selectGeneric(String sql, ResultSetHandler<?> handler) throws PersistenceException;
	
	

}
