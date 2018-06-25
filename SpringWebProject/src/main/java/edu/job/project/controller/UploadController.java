package edu.job.project.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller("upload-chunkupload-controller")
public class UploadController {
    
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
    private class FileResult
    {
        public boolean uploaded;
        public String fileUid;
    }
    
    @RequestMapping(value = "/chunkupload", method = RequestMethod.GET)
    public String index() {
    	logger.info("index 들어옴");
        return "upload/chunkupload";
    }
    
    @RequestMapping(value = "/chunkSave", method = RequestMethod.POST)
    public @ResponseBody String chunksave(@RequestParam List<MultipartFile> files, String metadata, HttpSession session) throws JsonGenerationException, JsonMappingException, IOException {
    	logger.info("업로드 들어옴");
        ObjectMapper mapper = new ObjectMapper();
        long totalChunks = 0;
        long chunkIndex = 0;
        String userId = (String) session.getAttribute("userId");
        String uploadUid = "";
        String fileName = "";
        //map json to student
          
        if(metadata == null){
            return "";
        }
        
        JsonNode rootNode = mapper.readTree(metadata);
        totalChunks = rootNode.path("totalChunks").longValue();
        chunkIndex = rootNode.path("chunkIndex").longValue();
        uploadUid = rootNode.path("uploadUid").textValue();
        fileName = userId + rootNode.path("fileName").textValue();
        
        OutputStream output = null;
        // Save the files
        
         for (MultipartFile file : files) {
            byte[] bytes = file.getBytes();
             String rootPath = "C:\\Users\\stu\\git\\TeamJT-Web-\\SpringWebProject\\src\\main\\webapp\\resources\\video";
             File dir = new File(rootPath + File.separator + "tmpFiles");
             System.out.println(File.separator);
            if (!dir.exists())
                dir.mkdirs();

             // Create the file on server
              File serverFile = new File(dir.getAbsolutePath()
                    + File.separator + fileName);
             BufferedOutputStream stream = new BufferedOutputStream(
                     new FileOutputStream(serverFile,true));
             stream.write(bytes);
            stream.close();
         }
        
        FileResult fileBlob = new FileResult();
        fileBlob.uploaded = totalChunks - 1 <= chunkIndex;
        fileBlob.fileUid = uploadUid;

        return mapper.writeValueAsString(fileBlob);
    }
    
    
    @RequestMapping(value = "/chunkSaveImage", method = RequestMethod.POST)
    public @ResponseBody String chunksaveImage(@RequestParam List<MultipartFile> files, String metadata, HttpSession session) throws JsonGenerationException, JsonMappingException, IOException {
    	logger.info("업로드 들어옴");
        ObjectMapper mapper = new ObjectMapper();
        long totalChunks = 0;
        long chunkIndex = 0;
        String userId = (String) session.getAttribute("userId");
        String uploadUid = "";
        String fileName = "";
        //map json to student
          
        if(metadata == null){
            return "";
        }
        
        JsonNode rootNode = mapper.readTree(metadata);
        totalChunks = rootNode.path("totalChunks").longValue();
        chunkIndex = rootNode.path("chunkIndex").longValue();
        uploadUid = rootNode.path("uploadUid").textValue();
        fileName = userId + rootNode.path("fileName").textValue();
        
        OutputStream output = null;
        // Save the files
        
         for (MultipartFile file : files) {
            byte[] bytes = file.getBytes();
             String rootPath = "C:\\Users\\stu\\git\\TeamJT-Web-\\SpringWebProject\\src\\main\\webapp\\resources\\image";
             File dir = new File(rootPath + File.separator + "tmpFiles");
             System.out.println(File.separator);
            if (!dir.exists())
                dir.mkdirs();

             // Create the file on server
              File serverFile = new File(dir.getAbsolutePath()
                    + File.separator + fileName);
             BufferedOutputStream stream = new BufferedOutputStream(
                     new FileOutputStream(serverFile,true));
             stream.write(bytes);
            stream.close();
         }
        
        FileResult fileBlob = new FileResult();
        fileBlob.uploaded = totalChunks - 1 <= chunkIndex;
        fileBlob.fileUid = uploadUid;

        return mapper.writeValueAsString(fileBlob);
    }
    
    
   
}
