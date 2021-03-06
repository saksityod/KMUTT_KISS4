package th.ac.kmutt.chart.domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import java.io.Serializable;

/**
 * Created by imake on 27/10/2015.
 */
@Embeddable
public class ChartFilterInstanceEntityPK  implements Serializable {
    @Column(name = "INSTANCE_ID")
    private String instanceId;

    @Column(name = "FILTER_ID")
    private Integer filterId;

    public Integer getFilterId() {
        return filterId;
    }

    public void setFilterId(Integer filterId) {
        this.filterId = filterId;
    }

    public String getInstanceId() {
        return instanceId;
    }

    public void setInstanceId(String instanceId) {
        this.instanceId = instanceId;
    }

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((filterId == null) ? 0 : filterId.hashCode());
		result = prime * result
				+ ((instanceId == null) ? 0 : instanceId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ChartFilterInstanceEntityPK other = (ChartFilterInstanceEntityPK) obj;
		if (filterId == null) {
			if (other.filterId != null)
				return false;
		} else if (!filterId.equals(other.filterId))
			return false;
		if (instanceId == null) {
			if (other.instanceId != null)
				return false;
		} else if (!instanceId.equals(other.instanceId))
			return false;
		return true;
	}
    
}
