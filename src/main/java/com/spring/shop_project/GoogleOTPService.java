package com.spring.shop_project;


import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base32;
import org.springframework.stereotype.Repository;

@Repository
public class GoogleOTPService {
	
	public static void main(String[] args) {
		GoogleOTPService otp = new GoogleOTPService();
				
		// �Ʒ��� ����� �翬�� �е����� Ȯ���� false�� ���´�.
		// �켱 ���� �������� ������ Ű/url�� otp�ۿ� ����ϰ��� ǥ�õǴ� ��ȣ�� ������ Ű�� �־��ָ� true�� ���� ���̴�.
		//boolean check = otp.checkCode("123456", otpkey);
		boolean check = otp.checkCode("938425", "QRWSYW7XY7L7BUG7");
		System.out.println(check);
	}

	public String generate() {
		HashMap<String, String> map = new HashMap<String, String>();
		byte[] buffer = new byte[5 + 5 * 5];
		new Random().nextBytes(buffer);
		Base32 codec = new Base32();
		byte[] secretKey = Arrays.copyOf(buffer, 10);
		byte[] bEncodedKey = codec.encode(secretKey);

		String encodedKey = new String(bEncodedKey);
		// Google OTP �ۿ� userName@hostName ���� �����
		// key�� �Է��ϰų� ������ QR�ڵ带 ���ڵ� ��ĵ�Ͽ� ���

		return encodedKey;
	}

	public boolean checkCode(String userCode, String otpkey) {
		long otpnum = Integer.parseInt(userCode); // Google OTP �ۿ� ǥ�õǴ� 6�ڸ� ����
		long wave = new Date().getTime() / 30000; // Google OTP�� �ֱ�� 30��
		boolean result = false;
		try {
			Base32 codec = new Base32();
			byte[] decodedKey = codec.decode(otpkey);
			int window = 3;
			for (int i = -window; i <= window; ++i) {
				long hash = verify_code(decodedKey, wave + i);
				if (hash == otpnum) result = true;
			}
		} catch (InvalidKeyException | NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static int verify_code(byte[] key, long t) throws NoSuchAlgorithmException, InvalidKeyException {
		byte[] data = new byte[8];
		long value = t;
		for (int i = 8; i-- > 0; value >>>= 8) {
			data[i] = (byte) value;
		}

		SecretKeySpec signKey = new SecretKeySpec(key, "HmacSHA1");
		Mac mac = Mac.getInstance("HmacSHA1");
		mac.init(signKey);
		byte[] hash = mac.doFinal(data);

		int offset = hash[20 - 1] & 0xF;

		// We're using a long because Java hasn't got unsigned int.
		long truncatedHash = 0;
		for (int i = 0; i < 4; ++i) {
			truncatedHash <<= 8;
			// We are dealing with signed bytes:
			// we just keep the first byte.
			truncatedHash |= (hash[offset + i] & 0xFF);
		}

		truncatedHash &= 0x7FFFFFFF;
		truncatedHash %= 1000000;

		return (int) truncatedHash;
	}

	public static String getQRBarcodeURL(String user, String host, String secret) {
		// QR�ڵ� �ּ� ����
		String format2 = "http://chart.apis.google.com/chart?cht=qr&chs=200x200&chl=otpauth://totp/%s(%s)%%3Fsecret%%3D%s&chld=H|0";
		return String.format(format2, user, host, secret);
	}
}