package com.ch.util;

import java.text.DecimalFormat;
import java.util.Calendar;

public class Utlz {
	/**
	 * 숫자체크
	 * @param sStr
	 * @return boolean
	 */
	public static boolean hasOnlyDigit(String sStr){
		for(int i = 0; i < sStr.length(); i ++){
			if(sStr.charAt(i) < '0' || sStr.charAt(i) > '9'){
				return false;
			}
		}
		
		return true;
	}
	
	/**
	 * NULL을 체크한다
	 * @param sStr
	 * @return boolean
	 */
	public static boolean isBlank(String sStr){
		if(sStr == null){
			return true;
		}else if(sStr.trim().length() == 0){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * 10 이하의 값의 포멧을 01 02 03으로 맞춰준다.
	 * @param lStr
	 * @return String
	 */
	public static String getMakeDigitFormat(long lStr){
		String sStr = "";
		if(lStr < 10){
			sStr = sStr + "0" + lStr;
		}else{
			sStr = sStr + lStr;
		}
		
		return sStr;
	}
	
	/**
	 * Prints a String and then terminate the line.
	 * @param sMsg
	 */
	public static void print(String sMsg){
		System.out.println(sMsg);
	}
	
	/**
	 * 현재 시스템 날짜를 반환한다.
	 * @return String
	 */
	public static String getToday(){
		DecimalFormat df = new DecimalFormat("00");
		Calendar currentCalendar = Calendar.getInstance();
		String sYear = Integer.toString(currentCalendar.get(Calendar.YEAR));
		String sMonth = df.format(currentCalendar.get(Calendar.MONTH) + 1);
		String sDay = df.format(currentCalendar.get(Calendar.DATE));
		
		return sYear + sMonth + sDay;
	}
}
