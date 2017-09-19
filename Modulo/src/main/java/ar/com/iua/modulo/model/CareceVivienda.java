package ar.com.iua.modulo.model;

/**
 * Created by fran_ on 1/4/2017.
 */

import javax.persistence.*;

import org.hibernate.annotations.Proxy;
@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "carecevivienda")
public class CareceVivienda implements IModel{

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_CareceVivienda;

    @OneToOne
    @JoinColumn(name = "idFamilia")
    private Familia familia;

    @OneToOne
    @JoinColumn(name = "idMotivoCarecimiento")
    private MotivoCarecimiento motivoCarecimiento;

    @Column(name="isActive", nullable = false)
    private boolean isActive;

    public int getId_CareceVivienda() {
        return id_CareceVivienda;
    }

    public void setId_CareceVivienda(int id_CareceVivienda) {
        this.id_CareceVivienda = id_CareceVivienda;
    }

    public Familia getFamilia() {
        return familia;
    }

    public void setFamilia(Familia familia) {
        this.familia = familia;
    }

    public MotivoCarecimiento getMotivoCarecimiento() {
        return motivoCarecimiento;
    }

    public void setMotivoCarecimiento(MotivoCarecimiento motivoCarecimiento) {
        this.motivoCarecimiento = motivoCarecimiento;
    }

    public boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(boolean active) {
        isActive = active;
    }

    @Override
    public int getId() {
        return id_CareceVivienda;
    }
}
