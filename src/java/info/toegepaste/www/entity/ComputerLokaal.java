/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package info.toegepaste.www.entity;

import java.io.Serializable;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

/**
 *
 * @author robin
 */
@NamedQueries({
  @NamedQuery(name="ComputerLokalen.alle",query="select cl from ComputerLokaal cl ")  
})
@Entity
@DiscriminatorValue("ComputerLokaal")
public class ComputerLokaal extends Lokaal implements Serializable {

    private boolean laptop;
    private String info;

    public ComputerLokaal() {
        super();
    }

    public boolean isLaptop() {
        return laptop;
    }

    public void setLaptop(boolean laptop) {
        this.laptop = laptop;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }
}
