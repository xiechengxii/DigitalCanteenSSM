package digitalCanteenSSM.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface UploadFileService {
	
	public String uploadFile(MultipartFile file, String picturePath)
			throws IllegalStateException, IOException ;
}
