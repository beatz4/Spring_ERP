/*
�⺻ Util ����
*/

package util;

public class CustomUtil {

	// ������ ���̸� ��ȯ�Ѵ�.	
	static public int getLengthOfInteger(final int n) {
		return Integer.toString(n).length();
	}
	
/*	static public int getLengthOfInteger(final long n) {
		
		return Integer.toString(n).length();
	}*/
	
	// ���ڸ� substring �Ѵ�.	
	static public int subinteger(final int number, final int start, final int end)
	{
		String str = new Integer(number).toString();
	    return Integer.parseInt(str.substring(start, Math.min(end, str.length())));
	}
	
}
