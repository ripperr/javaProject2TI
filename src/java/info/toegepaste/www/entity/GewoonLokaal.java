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
  @NamedQuery(name="GewoonLokalen.alle",query="select gl from GewoonLokaal gl ")
  
})
@Entity
@DiscriminatorValue("GewoonLokaal")
public class GewoonLokaal extends Lokaal implements Serializable {
 
    private boolean whiteBoard;

    public boolean isWhiteBoard() {
        return whiteBoard;
    }

    public void setWhiteBoard(boolean whiteBoard) {
        this.whiteBoard = whiteBoard;
    }

    public GewoonLokaal() {
        super();
    }
    

  
    
}
