package ar.com.iua.modulo.model;

import java.beans.Transient;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "archivos")
public class Archivo implements Serializable {

	private static final long serialVersionUID = -1262275932413466908L;

	@Lob
	private byte[] archivo;

	private Date fecha;

	@Id
	@GeneratedValue
	private int idArchivo;

	private String mimeType;

	private String name;

	private long size;

	@Override
	public boolean equals(Object obj) {
		return ((Archivo) obj).getIdArchivo() == getIdArchivo();
	}

	@JsonIgnore
	public byte[] getArchivo() {
		return archivo;
	}

	public Date getFecha() {
		return fecha;
	}

	public int getIdArchivo() {
		return idArchivo;
	}

	public String getMimeType() {
		return mimeType;
	}

	public String getName() {
		return name;
	}

	public long getSize() {
		return size;
	}

	@Override
	public int hashCode() {
		return getIdArchivo();
	}

	public void setArchivo(byte[] archivo) {
		this.archivo = archivo;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public void setIdArchivo(int idArchivo) {
		this.idArchivo = idArchivo;
	}

	public void setMimeType(String mimeType) {
		this.mimeType = mimeType;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setSize(long size) {
		this.size = size;
	}

	@Override
	public String toString() {
		return String.format("Archivo: %s [%d bytes] (id=%d), type=%s", getName(), getSize(), getIdArchivo(),
				getMimeType());
	}

	@Transient
	public String getFechaFormat() {
		return new SimpleDateFormat("dd/MM/yyyy HH:mm").format(getFecha());
	}

	@Transient
	public String getSizeFormat() {
		return toNumInUnits(getSize());
	}

	private static String toNumInUnits(long bytes) {
		int u = 0;
		for (; bytes > 1024 * 1024; bytes >>= 10) {
			u++;
		}
		if (bytes > 1024)
			u++;
		return String.format("%.1f %cB", bytes / 1024f, " kMGTPE".charAt(u));
	}

	@Transient
	public String getExt() {

		try {
			return getName().substring(getName().lastIndexOf("."));

		} catch (Exception e) {
			return "";
		}
	}

}