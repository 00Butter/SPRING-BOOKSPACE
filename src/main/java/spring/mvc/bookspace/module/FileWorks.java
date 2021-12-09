package spring.mvc.bookspace.module;

import java.io.File;
import java.io.FileOutputStream;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileWorks {

	private String outpath;  // 압축해제경로
	private String savepath;
	private CompressionUtil com;

	public FileWorks() {
		// TODO Auto-generated constructor stub
		this.com=new CompressionUtil();
		this.outpath="C:/Users/young/Desktop/SpringWork/SpringWebWork/Bookspace/src/main/webapp/resources/book";
		this.savepath="C:/Download/";
	}



	public String getOutpath() {
		return outpath;
	}


	public void fileUpload(MultipartFile file, String bookname){
		try {
			com.unzip(file.getInputStream(), new File(outpath+"/"+bookname), "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String filename(String bookname){
		File file=new File(outpath+"/"+bookname);
		if(file.isDirectory()){
			String name= file.list()[0];
			System.out.println(name);
			return name;
		}
		return com.getFirstFile();
	}

	public String[] fileList(String bookname){
		File file=new File(outpath+"/"+bookname);
		if(file.isDirectory()){
			return file.list();
		}
		return null;
	}

	public void deleteBook(String bookname){
		File file=new File(outpath+"/"+bookname);
		if(file.isDirectory()){
			File[] files=file.listFiles();
			for(File f:files){
				f.delete();
			}
			file.delete();
		}
	}


	public String saveFileUp(String bookname){
		try {
			File zipfile=new File(savepath+bookname+".zip");
			com.zip(new File(outpath+"/"+bookname),new FileOutputStream(zipfile));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}




}
