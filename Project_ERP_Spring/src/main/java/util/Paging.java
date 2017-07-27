package util;
/*
        nowPage:����������
        rowTotal:��ü�����Ͱ���
        blockList:���������� �Խù���
        blockPage:��ȭ�鿡 ��Ÿ�� ������ ��ϼ�
 */
public class Paging {
	public static String getPaging(String pageURL,int nowPage, int rowTotal,int blockList, int blockPage){
		
		int totalPage/*��ü��������*/,
            startPage/*������������ȣ*/,
            endPage;/*��������������ȣ*/

		boolean  isPrevPage,isNextPage;
		StringBuffer sb; //��� ��Ȳ�� �Ǵ��Ͽ� HTML�ڵ带 ������ ��
		
		
		isPrevPage=isNextPage=false;
		//�Էµ� ��ü �ڿ��� ���� ��ü ������ ���� ���Ѵ�..
		totalPage = (int)(rowTotal/blockList);
		//rowTotal�� blockList�� �������� �������� 0�� �ƴϸ� �������� �ϳ��� �������־����
		if(rowTotal%blockList!=0)totalPage++;
		

		//���� �߸��� ����� ���������� ���Ͽ� ���� ������ ���� ��ü ������ ����
		//���� ��� ������ ���������� ���� ��ü ������ ������ ����
		if(nowPage > totalPage)nowPage = totalPage;
		

		//���� �������� ������ �������� ����.
		startPage = (int)(((nowPage-1)/blockPage)*blockPage+1);
		endPage = startPage + blockPage - 1; //
		
		//������ ������ ���� ��ü������������ ũ�� ������������ ���� ����
		if(endPage > totalPage)endPage = totalPage;
		
		//�������������� ��ü���������� ���� ��� ���� ����¡�� ������ �� �ֵ���
		//boolean�� ������ ���� ����
		if(endPage < totalPage) isNextPage = true;
		//������������ ���� 1���� ������ ��������¡ ������ �� �ֵ��� ������
		if(startPage > 1)isPrevPage = true;
		
		//HTML�ڵ带 ������ StringBuffer����=>�ڵ����
		sb = new StringBuffer();
//-----�׷�������ó�� ���� --------------------------------------------------------------------------------------------		
		sb.append("<ul class='pagination'>");
		if(isPrevPage){
			sb.append("<li><a href='"+pageURL+"?page=");
			sb.append(startPage - 1);
			sb.append("'>��</a></li>");
		}
		else
			sb.append("<li><a>��</a></li>");
		
//------������ ��� ��� -------------------------------------------------------------------------------------------------
		//sb.append("|");
		for(int i=startPage; i<= endPage ;i++){
			if(i>totalPage)break;

			if(i == nowPage){ //���� �ִ� ������
				//<b><font color='red'>[i]</font></b>
						sb.append("<li class='active'>");
							sb.append("<a>"+i+"</a>");
						sb.append("</li>");
			}
			else{//���� �������� �ƴϸ�
				//<a href='list.do?page=i>i</a>
				
						sb.append("<li>");
							sb.append("<a href='"+pageURL+"?page="+i+"'>"+i+"</a>");
						sb.append("</li>");
				
			}			
			
		}// end for
		
		//sb.append("|");
		
//-----�׷�������ó�� ���� ----------------------------------------------------------------------------------------------
		if(isNextPage){
			sb.append("<li><a href='"+pageURL+"?page=");
			sb.append(endPage + 1);
			sb.append("'>��</a></li>");
		}
		else
			sb.append("<li><a>��</a></li>");
//---------------------------------------------------------------------------------------------------------------------	    
		sb.append("</ul>");
		
		return sb.toString();
	}
	
public static String getPaging_popup(String pageURL, String search_str, int nowPage, int rowTotal,int blockList, int blockPage){
		
		int totalPage/*��ü��������*/,
            startPage/*������������ȣ*/,
            endPage;/*��������������ȣ*/

		boolean  isPrevPage,isNextPage;
		StringBuffer sb; //��� ��Ȳ�� �Ǵ��Ͽ� HTML�ڵ带 ������ ��
		
		
		isPrevPage=isNextPage=false;
		//�Էµ� ��ü �ڿ��� ���� ��ü ������ ���� ���Ѵ�..
		totalPage = (int)(rowTotal/blockList);
		//rowTotal�� blockList�� �������� �������� 0�� �ƴϸ� �������� �ϳ��� �������־����
		if(rowTotal%blockList!=0)totalPage++;
		

		//���� �߸��� ����� ���������� ���Ͽ� ���� ������ ���� ��ü ������ ����
		//���� ��� ������ ���������� ���� ��ü ������ ������ ����
		if(nowPage > totalPage)nowPage = totalPage;
		

		//���� �������� ������ �������� ����.
		startPage = (int)(((nowPage-1)/blockPage)*blockPage+1);
		endPage = startPage + blockPage - 1; //
		
		//������ ������ ���� ��ü������������ ũ�� ������������ ���� ����
		if(endPage > totalPage)endPage = totalPage;
		
		//�������������� ��ü���������� ���� ��� ���� ����¡�� ������ �� �ֵ���
		//boolean�� ������ ���� ����
		if(endPage < totalPage) isNextPage = true;
		//������������ ���� 1���� ������ ��������¡ ������ �� �ֵ��� ������
		if(startPage > 1)isPrevPage = true;
		
		//HTML�ڵ带 ������ StringBuffer����=>�ڵ����
		sb = new StringBuffer();
//-----�׷�������ó�� ���� --------------------------------------------------------------------------------------------		
		sb.append("<ul class='pagination'>");
		if(isPrevPage){
			sb.append("<li><a href='"+pageURL+"?page=");
			sb.append(startPage - 1);
			sb.append("&"+search_str);
			sb.append("'>��</a></li>");
		}
		else
			sb.append("<li><a>��</a></li>");
		
//------������ ��� ��� -------------------------------------------------------------------------------------------------
		//sb.append("|");
		for(int i=startPage; i<= endPage ;i++){
			if(i>totalPage)break;

			if(i == nowPage){ //���� �ִ� ������
				//<b><font color='red'>[i]</font></b>
						sb.append("<li class='active'>");
							sb.append("<a>"+i+"</a>");
						sb.append("</li>");
			}
			else{//���� �������� �ƴϸ�
				//<a href='list.do?page=i>i</a>
				
						sb.append("<li>");
							sb.append("<a href='"+pageURL+"?page="+i+"&"+search_str+"'>"+i+"</a>");
						sb.append("</li>");
				
			}			
			
		}// end for
		
		//sb.append("|");
		
//-----�׷�������ó�� ���� ----------------------------------------------------------------------------------------------
		if(isNextPage){
			sb.append("<li><a href='"+pageURL+"?page=");
			sb.append(endPage + 1);
			sb.append("&"+search_str);
			sb.append("'>��</a></li>");
		}
		else
			sb.append("<li><a>��</a></li>");
//---------------------------------------------------------------------------------------------------------------------	    
		sb.append("</ul>");
		
		return sb.toString();
	}

}