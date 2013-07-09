/*
    This file is part of javaProject2TI.

    javaProject2TI is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    javaProject2TI is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with javaProject2TI.  If not, see <http://www.gnu.org/licenses/>.
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
    @NamedQuery(name = "Examen.alle", query = "select e from Examen e where e.datum >= CURRENT_DATE"),
    @NamedQuery(name = "Examen.zoekenOpDatum", query = "select e from Examen e where e.datum like :datum and e.datum >= CURRENT_DATE"),
    @NamedQuery(name = "Examen.zoekenOpDocent", query = "select e from Examen e where e.docent.id like :docentId and e.datum >= CURRENT_DATE"),
    @NamedQuery(name = "Examen.zoekenOpVak", query = "select e from Examen e where e.vak.id like :vakId and e.datum >= CURRENT_DATE"),
    @NamedQuery(name = "Examen.zoekenOpLokaal", query = "select e from Examen e where e.lokaal.id like :lokaalId and e.datum >= CURRENT_DATE"),
    @NamedQuery(name = "Examen.zoekenOpSoort", query = "select e from Examen e where e.soort like :soort and e.datum >= CURRENT_DATE")
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
