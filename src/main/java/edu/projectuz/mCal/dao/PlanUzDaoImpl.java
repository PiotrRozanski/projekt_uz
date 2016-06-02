package edu.projectuz.mCal.dao;

import edu.projectuz.mCal.importers.planuz.model.calendars.CalendarsList;
import org.springframework.stereotype.Repository;

@Repository("planUzDao")
public class PlanUzDaoImpl extends AbstractDao implements PlanUzDao  {

    public void saveCalendarsList(CalendarsList calendars) {
        persist(calendars);
    }
}
