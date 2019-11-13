package com.kh.letEatGo.common.encrypt;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;


//@Component
public class AESEncrypto implements MyEncrypt {
	//키암호화, 복호화 할 수 있는 키
	//javax.crypto패키지, java.security패키지에서 제공
	private SecretKey key;//생성한 키를 저장하는 객체
	
	public AESEncrypto() {
		String saveDir=this.getClass().getResource("/").getPath();
		saveDir=saveDir.substring(0,saveDir.lastIndexOf("/target"));
		File f=new File(saveDir+"/src/main/webapp/WEB-INF/securitykey.bs");
		if(f.exists()) {
			//저장된 파일에서 secretkey받오기
			try(ObjectInputStream ois=new ObjectInputStream(new FileInputStream(f))){
				key=(SecretKey)ois.readObject();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else {
			if(key==null) {
				try {
					getKey();
				} catch (NoSuchAlgorithmException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	
	private void getKey() throws NoSuchAlgorithmException{
		//key생성하는 메소드
		//1.특정한 랜덤값이 필요함, 정교해야함
		//Math.random() X SecureRandom O
		SecureRandom ser=new SecureRandom();
		//key를 생성하는 객체를 추가
		//keyGenerator -> key를 생성하는 객체(대칭키)
		KeyGenerator keygen;
		keygen=KeyGenerator.getInstance("AES");
		keygen.init(128,ser);
		key=keygen.generateKey();//대칭키생성완료!
		
		//key를 영원히 보관하기 위해 파일로 저장하겠음.
		//저장위치 : ~~/WEB-INF/securitykey.bs
		String saveDir=this.getClass().getResource("/").getPath();
		saveDir=saveDir.substring(0,saveDir.lastIndexOf("/target"));
		File f=new File(saveDir+"/src/main/webapp/WEB-INF/securitykey.bs");
		try(ObjectOutputStream oos=new ObjectOutputStream(new FileOutputStream(f))) {
			oos.writeObject(key);
		}catch(IOException e) {
			e.printStackTrace();
		}		
	}
	
	
	
	@Override
	public String encrypt(String msg)throws Exception{
		//암호화메소드
		//Cipher객체를 이용해서 암호화를 진행
		Cipher cipher=Cipher.getInstance("AES");
		cipher.init(Cipher.ENCRYPT_MODE, key);
		byte[] enc=cipher.doFinal(msg.getBytes());
		return Base64.getEncoder().encodeToString(enc);
	}

	@Override
	public String decrypt(String msg)throws Exception {
		Cipher cipher=Cipher.getInstance("AES");
		cipher.init(Cipher.DECRYPT_MODE, key);
		byte[] enc=Base64.getDecoder().decode(msg.getBytes());
		byte[] encResult=cipher.doFinal(enc);
		return new String(encResult,"UTF-8");
	}

}




