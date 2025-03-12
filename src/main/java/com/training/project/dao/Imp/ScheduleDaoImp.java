package com.training.project.dao.Imp;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.training.project.dao.GenericDao;
import com.training.project.model.Schedule;
import com.training.project.model.UserDetail;

public class ScheduleDaoImp implements GenericDao<Schedule, Integer> {
	private Session session;
	
	public ScheduleDaoImp() {
		super();
	}
	
	public ScheduleDaoImp(Session session) {
		super();
		this.session = session;
	}

	@Override
	public Schedule findById(Integer id) {
		Schedule schedule = session.get(Schedule.class, id);
	    System.out.println("Doctor role id: " + schedule);
		return schedule;

	}

	@Override
	public List<Schedule> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean create(Schedule schedule) {
		Transaction tx = null;
        try {
            tx = session.beginTransaction();
            System.out.println("123456 "+schedule);
            session.save(schedule);
            System.out.println("ins");
            tx.commit();
            return true;
        } catch (Exception e) {
        	System.out.println("jhj");
            if (tx != null) tx.rollback();
            e.printStackTrace();
            return false;
        }
	}

	@Override
	public boolean update(Schedule entity) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteById(Integer id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Schedule entity) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean exists(Integer id) {
		// TODO Auto-generated method stub
		return false;
	}
	
	public List<Schedule> findByDoctorId(int doctorId) {
        Query<Schedule> query = session.createQuery(
            "FROM Schedule WHERE doctor.id = :doctorId", Schedule.class);
        query.setParameter("doctorId", doctorId);
        return query.list();
    }
}
