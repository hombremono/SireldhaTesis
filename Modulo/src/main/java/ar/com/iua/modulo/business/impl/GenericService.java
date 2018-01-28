package ar.com.iua.modulo.business.impl;

import java.io.Serializable;
import java.util.List;

import org.apache.commons.dbutils.ResultSetHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ar.com.iua.modulo.business.Interfaces.Generic.IGenericService;
import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.persistence.dao.IGenericDAO;
import ar.com.iua.modulo.persistence.exception.PersistenceException;

public class GenericService<Entity, PK extends Serializable> implements IGenericService<Entity, PK> {

	protected static final long serialVersionUID = 3544059594104153771L;
	protected static Logger LOG = LoggerFactory.getLogger(GenericService.class);
	protected IGenericDAO<Entity, PK> dao;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public GenericService(IGenericDAO dao) {
		this.dao = dao;
	}

	@Override
	public void delete(Entity entity) throws ServiceException, NotFoundException {
		try {
			dao.delete(entity);
		} catch (PersistenceException e) {
			LOG.error(e.getMessage(), e);
			throw new ServiceException(e.getMessage(), e);
		}

	}

	@Override
	public List<Entity> list() throws ServiceException {
		try {
			return dao.list();
		} catch (PersistenceException e) {
			LOG.error(e.getMessage(), e);
			throw new ServiceException(e.getMessage(), e);
		}
	}

	@Override
	public Entity load(PK id) throws ServiceException, NotFoundException {
		try {
			return dao.load(id);
		} catch (PersistenceException e) {
			LOG.error(e.getMessage(), e);
			throw new ServiceException(e.getMessage(), e);
		}
	}

	@Override
	public Entity save(Entity entity) throws ServiceException {
		try {
			return dao.save(entity);
		} catch (PersistenceException e) {
			LOG.error(e.getMessage(), e);
			throw new ServiceException(e.getMessage(), e);
		}
	}

	@Override
	public Entity saveOrUpdate(Entity entity) throws ServiceException {
		try {
			return dao.saveOrUpdate(entity);
		} catch (PersistenceException e) {
			LOG.error(e.getMessage(), e);
			throw new ServiceException(e.getMessage(), e);
		}
	}

	@Override
	public Entity update(Entity entity) throws ServiceException, NotFoundException {
		try {
			return dao.update(entity);
		} catch (PersistenceException e) {
			LOG.error(e.getMessage(), e);
			throw new ServiceException(e.getMessage(), e);
		}
	}

	@Override
	public String selectToJson(String sql) throws ServiceException {

		try {
			return dao.selectToJson(sql);
		} catch (PersistenceException e) {
			LOG.error(e.getMessage(), e);
			throw new ServiceException(e.getMessage(), e);
		}
	}

	@Override
	public List<?> selectGeneric(String sql, ResultSetHandler<?> handler) throws ServiceException {
		try {
			return dao.selectGeneric(sql, handler);
		} catch (PersistenceException e) {
			LOG.error(e.getMessage(), e);
			throw new ServiceException(e.getMessage(), e);
		}
	}

}
