/*
기본 Util 선언
*/

package util;

public class CustomUtil {

	// 숫자의 길이를 반환한다.	
	static public int getLengthOfInteger(final int n) {
		return Integer.toString(n).length();
	}
	
/*	static public int getLengthOfInteger(final long n) {
		
		return Integer.toString(n).length();
	}*/
	
	// 숫자를 substring 한다.	
	static public int subinteger(final int number, final int start, final int end)
	{
		String str = new Integer(number).toString();
	    return Integer.parseInt(str.substring(start, Math.min(end, str.length())));
	}
	
}
