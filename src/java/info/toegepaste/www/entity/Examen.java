/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package info.toegepaste.www.entity;

import info.toepaste.www.enumeration.Soort;
import java.io.Serializable;
import java.util.GregorianCalendar;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author robin
 */
@NamedQueries({
    @NamedQuery(name = "Examen.alle", query = "select e from Examen e "),
    @NamedQuery(name = "Examen.zoekenOpDatum", query = "select e from Examen e where e.datum like :datum"),
    @NamedQuery(name = "Examen.zoekenOpDocent", query = "select e from Examen e where e.docent.id like :docentId"),
    @NamedQuery(name = "Examen.zoekenOpVak", query = "select e from Examen e where e.vak.id like :vakId"),
    @NamedQuery(name = "Examen.zoekenOpLokaal", query = "select e from Examen e where e.lokaal.id like :lokaalId"),
    @NamedQuery(name = "Examen.zoekenOpSoort", query = "select e from Examen e where e.soort like :soort")
})
@Entity
public class Examen implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @ManyToOne
    private Vak vak;
    @ManyToOne
    private Docent docent;
    @ManyToOne
    private Lokaal lokaal;
    @Temporal(TemporalType.DATE)
    private GregorianCalendar datum;
    @Enumerated(EnumType.STRING)
    private Soort soort;

    public Examen() {
    }

    public Vak getVak() {
        return vak;
    }

    public void setVak(Vak vak) {
        this.vak = vak;
    }

    public Docent getDocent() {
        return docent;
    }

    public void setDocent(Docent docent) {
        this.docent = docent;
    }

    public GregorianCalendar getDatum() {
        return datum;
    }

    public void setDatum(GregorianCalendar datum) {
        this.datum = datum;
    }

    public Soort getSoort() {
        return soort;
    }

    public void setSoort(Soort soort) {
        this.soort = soort;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Lokaal getLokaal() {
        return lokaal;
    }

    public void setLokaal(Lokaal lokaal) {
        this.lokaal = lokaal;
    }
}
