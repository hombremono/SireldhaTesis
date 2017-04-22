package ar.com.iua.modulo.business;

import java.io.Serializable;
import java.util.List;

import org.apache.commons.dbutils.ResultSetHandler;

import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.exception.NotFoundException;

public interface IGenericService<Entity, PK extends Serializable> extends Serializable {

	public void delete(Entity entity) throws ServiceException, NotFoundException;

	public List<Entity> list() throws ServiceException;

	public Entity load(PK id) throws ServiceException, NotFoundException;

	public Entity save(Entity entity) throws ServiceException;

	public Entity saveOrUpdate(Entity entity) throws ServiceException;

	public Entity update(Entity entity) throws ServiceException, NotFoundException;

	public String selectToJson(String sql) throws ServiceException;

	public List<?> selectGeneric(String sql, ResultSetHandler<?> handler) throws ServiceException;

}
