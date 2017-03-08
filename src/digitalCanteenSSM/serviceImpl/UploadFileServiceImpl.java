package digitalCanteenSSM.serviceImpl;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import digitalCanteenSSM.service.UploadFileService;

@Service
public class UploadFileServiceImpl implements UploadFileService {

	//接收文件
	//picturePath：存储文件的物理路径
	//return：文件的路径名
	@Override
	public String uploadFile(MultipartFile file, String picturePath)
			throws IllegalStateException, IOException {

		//新的文件名称
		String newFileName = null;
		//原始文件名称
		String originalFileName = file.getOriginalFilename();	
		//上传文件
		if(file !=null && originalFileName != null && originalFileName.length() > 0){			
			//新的文件名称
			newFileName = UUID.randomUUID()+originalFileName.substring(originalFileName.lastIndexOf("."));		
			//新文件
			File newFile = new File(picturePath+newFileName);			
			//将内存中的数据写入磁盘
			file.transferTo(newFile);			
			return newFileName;					
		}else {
			return null;
		}
	}
		
}
