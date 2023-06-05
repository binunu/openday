package com.kosta.openday.teacher.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.openday.adm.dto.AnnouncementDTO;
import com.kosta.openday.teacher.dao.TeacherDAO;
import com.kosta.openday.teacher.dto.ClassScdUserDTO;
import com.kosta.openday.teacher.dto.ClassScheduleDTO;
import com.kosta.openday.teacher.dto.TeacherScheduleDTO;
import com.kosta.openday.user.dto.ClsInquiryDTO;
import com.kosta.openday.user.dto.OClassDTO;

@Service
public class TeacherServiceImpl implements TeacherService {
	
	@Autowired
	private TeacherDAO teacherDAO;
	
	@Override
	public List<AnnouncementDTO> tcAnnouncementList() throws Exception {
		return teacherDAO.tcAnnouncementList();
	}
	@Override
	public List<OClassDTO> tcClassList(HashMap<String, Object> map) throws Exception {
		return teacherDAO.tcClassList(map);
	}
	@Override
	public int tcClassListCount(HashMap<String, Object> map) throws Exception {
		return teacherDAO.tcClassListCount(map);
	}
	@Override
	public List<ClassScheduleDTO> tcClassScheduleList(HashMap<String, Object> map) throws Exception {
		return teacherDAO.tcClassScheduleList(map);
	}
	@Override
	public List<ClassScdUserDTO> tcClassUserList(Integer scdNum) throws Exception {
		return teacherDAO.tcClassUserList(scdNum);
	}
	@Override
	public int tcClassScheduleListCount(HashMap<String, Object> map) throws Exception {
		return teacherDAO.tcClassScheduleListCount(map);
	}
	@Override
	public List<ClsInquiryDTO> tcClassInquiryList(Integer clsId) throws Exception {
		return teacherDAO.tcClassInquiryList(clsId);
	}
	@Override
	public List<TeacherScheduleDTO> tcScheduleList(HashMap<String, Object> map) throws Exception {
		return teacherDAO.tcScheduleList(map);
	}

}
