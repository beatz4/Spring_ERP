/*
�⺻ Util ����
*/

package util;

import static java.lang.Math.toIntExact;

public class CustomUtil {

	// ������ ���̸� ��ȯ�Ѵ�.	
	static public int getLengthOfInteger(final int n) {
		return Integer.toString(n).length();
	}
	
	// long type ������ ���� ���̸� ��ȯ.
	static public int getLengthOfLong(final long n) {
		
		return getLengthOfInteger(toIntegerFromLong(n));
	}
	
	// ���ڸ� substring �Ѵ�.	
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
