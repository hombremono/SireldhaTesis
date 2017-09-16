package ar.com.iua.modulo.business.impl;

import ar.com.iua.modulo.business.Interfaces.IInmuebleService;
import ar.com.iua.modulo.business.exception.ServiceException;
import ar.com.iua.modulo.business.model.InmuebleCombos;
import ar.com.iua.modulo.model.Inmueble;
import ar.com.iua.modulo.model.exception.NotFoundException;
import ar.com.iua.modulo.model.persistence.dao.*;
import ar.com.iua.modulo.persistence.dao.IGenericDAO;
import ar.com.iua.modulo.persistence.exception.PersistenceException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by mnicolas on 16/09/17.
 */
public class InmuebleService extends GenericService<Inmueble, Integer> implements IInmuebleService {
    private static final long serialVersionUID = 1206356050999505599L;
    private static Logger LOG = LoggerFactory.getLogger(InmuebleService.class);

    private IMotivoCarecimientoDAO motivoCarecimientoDAO;
    private IMaterialParedDAO materialParedDAO;
    private IMaterialTechoDAO materialTechoDAO;
    private IMaterialPisoDAO  materialPisoDAO;
    private IPoseeAguaDAO poseeAguaDAO;
    private IProcedenciaAguaDAO procedenciaAguaDAO;
    private ITipoBanoDAO tipoBanoDAO;
    private IPoseeLuzDAO poseeLuzDAO;
    private IPoseeCocinaDAO poseeCocinaDAO;
    private ILocalidadDAO localidadDAO;

    public InmuebleService(IInmuebleDAO dao, IMotivoCarecimientoDAO motivoCarecimientoDAO, IMaterialParedDAO materialParedDAO,
                           IMaterialTechoDAO materialTechoDAO, IMaterialPisoDAO materialPisoDAO, IPoseeAguaDAO poseeAguaDAO,
                           IProcedenciaAguaDAO procedenciaAguaDAO, ITipoBanoDAO tipoBanoDAO, IPoseeLuzDAO poseeLuzDAO,
                           IPoseeCocinaDAO poseeCocinaDAO, ILocalidadDAO localidadDAO) {
        super(dao);
        this.motivoCarecimientoDAO = motivoCarecimientoDAO;
        this.materialParedDAO = materialParedDAO;
        this.materialTechoDAO = materialTechoDAO;
        this.materialPisoDAO = materialPisoDAO;
        this.poseeAguaDAO = poseeAguaDAO;
        this.procedenciaAguaDAO = procedenciaAguaDAO;
        this.tipoBanoDAO = tipoBanoDAO;
        this.poseeLuzDAO = poseeLuzDAO;
        this.poseeCocinaDAO = poseeCocinaDAO;
        this.localidadDAO = localidadDAO;
    }

    @Override
    public Inmueble load(int id, boolean getInactive) throws ServiceException, NotFoundException {
        return null;
    }

    @Override
    public void setInactive(int id) throws ServiceException, NotFoundException {

    }

    @Override
    public InmuebleCombos getCombos() throws ServiceException {
        try {
            InmuebleCombos combos =
                    new InmuebleCombos(motivoCarecimientoDAO.list(),materialParedDAO.list(),materialTechoDAO.list(),
                            materialPisoDAO.list(),poseeAguaDAO.list(),procedenciaAguaDAO.list(),tipoBanoDAO.list(),
                            poseeLuzDAO.list(),poseeCocinaDAO.list(),localidadDAO.list());
            return combos;
        } catch (PersistenceException e){
            LOG.error(e.getMessage(),e);
            throw new ServiceException(e.getMessage(),e);
        }
    }
}
