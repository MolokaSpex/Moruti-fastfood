 
package za.ac.tut.model.entities;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

 
@Entity
public class OrderItem implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long item_id;

    public Long getId() {
        return item_id;
    }

    public void setId(Long id) {
        this.item_id= item_id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (item_id != null ? item_id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderItem)) {
            return false;
        }
        OrderItem other = (OrderItem) object;
        if ((this.item_id== null && other.item_id != null) || (this.item_id != null && !this.item_id.equals(other.item_id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.model.entities.OrderItem[ id=" + item_id + " ]";
    }
    
}
