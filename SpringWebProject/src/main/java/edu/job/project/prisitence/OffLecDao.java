package edu.job.project.prisitence;

import java.util.List;

import edu.job.project.domain.OffLec;

public interface OffLecDao {

	
	int insert(OffLec offLecture);
	
	int update(OffLec offLecture);
	
	OffLec select(int bno);
	
	List<OffLec> select();
	
}
