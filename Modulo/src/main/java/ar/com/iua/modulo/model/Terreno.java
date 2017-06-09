package ar.com.iua.modulo.model;

/**
 * Created by fran_ on 1/4/2017.
 */
import java.util.Date;
import java.util.Set;

import javax.persistence.*;

import org.hibernate.annotations.Proxy;
@Entity
@Proxy(lazy = false)
@Access(value = AccessType.FIELD)
@Table(name = "terreno")

public class Terreno {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id_Terreno;

    @Column(name="valorFiscal", nullable = false)
    private float valorFiscal;

    @Column(name="superficie", nullable = false)
    private float superficie;

    @ManyToOne
    @JoinColumn(name = "idFamilia")
    private Familia familia;


    @OneToOne
    @JoinColumn(name = "idDireccion")
    private Direccion direccion;

    @Column(name="edificacion", nullable = false)
    private boolean edificacion;

    @Column(name="isActive", nullable = false)
    private boolean isActive;
}
