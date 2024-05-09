package tn.enig.dao;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tn.enig.model.Departement;
@Transactional
@Repository
public interface IDepartement extends JpaRepository<Departement, Integer>{
	
}
