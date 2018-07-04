package edu.job.project.mappers;

import java.util.List;

import edu.job.project.domain.OffLec;



public interface UploadMapper {

	
//	int insert(OffLec offLecture);
	
	int updateWaitingId(OffLec offLecture);
	
	// 특정 컬럼검색
	OffLec selectWaitingList(int bno);
	
	List<OffLec> selectAll ();
	
	
}
