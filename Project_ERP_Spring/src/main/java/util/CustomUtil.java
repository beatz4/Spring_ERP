/*
기본 Util 선언
*/

package util;

import static java.lang.Math.toIntExact;

public class CustomUtil {

	// 숫자의 길이를 반환한다.	
	static public int getLengthOfInteger(final int n) {
		return Integer.toString(n).length();
	}
	
	// long type 변수의 숫자 길이를 반환.
	static public int getLengthOfLong(final long n) {
		
		return getLengthOfInteger(toIntegerFromLong(n));
	}
	
	// 숫자를 substring 한다.	
	static public int subinteger(final int number, final int start, final int end)
	{
		String str = new Integer(number).toString();
	    return Integer.parseInt(str.substring(start, Math.min(end, str.length())));
	}

	// long -> int : cast
	static public int toIntegerFromLong( long n ) {
		return toIntExact(n);
	}
	
}
