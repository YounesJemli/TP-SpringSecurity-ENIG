package tn.enig.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import tn.enig.dao.*;
import tn.enig.model.*;

@Controller
public class App {

	@Autowired
	IMateriel imat;
	@Autowired
	IDepartement idep;
	
	
	@GetMapping("/")
	public String getHome(Model model) {
		return "redirect:/ListeDepartements/";
	}
	@GetMapping("/listeDepartements")
	public String getDeps(Model model) {
		List<Departement> ld = idep.findAll();
		
		Materiel m =new Materiel("rj45", "reseau", 255, 11, true, ld.get(0));
		imat.save(m);
		model.addAttribute("listeDeps", ld);
		return "ListeDepartements";
	}

	@GetMapping("/materialList/{id}")
	public String getMatByDep(Model model, @PathVariable("id") int idDep) {
		List<Materiel> mat = imat.getMatByIdDep(idDep);
		Optional<Departement> dep = idep.findById(idDep);
		model.addAttribute("dep", dep.get());
		model.addAttribute("mat", mat);
		return "materialList";
	}
	
	
	@RequestMapping(value = "/addMaterial", method = RequestMethod.GET)
	public String addMateriel(Model model) {
		List<Departement> ld = idep.findAll();
		model.addAttribute("ld", ld);
		model.addAttribute("mat", new Materiel());
		return "addMaterial";
	}

	@RequestMapping(value = "/addMaterial", method = RequestMethod.POST)
	public String addEnseign(@ModelAttribute("m") Materiel m) {
		imat.save(m);
		return "redirect:/materialList/" + m.getDep().getId();
	}
	
	@RequestMapping(value = "/deleteMaterial/{iddep}/{id}", method = RequestMethod.GET)
	public String DeleteMateriel(@PathVariable("id") Integer id, @PathVariable("iddep") Integer iddep) {
		imat.deleteById(id);
		return "redirect:/materialList/" + iddep;
	}
	
	
	
	
}
