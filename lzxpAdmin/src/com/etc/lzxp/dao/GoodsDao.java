package com.etc.lzxp.dao;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.etc.lzxp.entity.Goods;
import com.etc.lzxp.entity.GoodsAndStype;
import com.etc.lzxp.entity.GoodsStypePicture;
import com.etc.lzxp.entity.Goods_picture;
import com.etc.lzxp.entity.Goods_stype;
import com.etc.util.BaseDao;

public class GoodsDao {
	/**
	 * ��ʾ��Ʒ������Ϣ
	 * 
	 * @return
	 */
	public List<GoodsStypePicture> getAllGoods() {
		return (List<GoodsStypePicture>) BaseDao.select(
				"select * from goods,goods_stype,goods_picture where goods.stypeid=goods_stype.stypeid and goods_picture.goodsid=goods.goodsid", GoodsStypePicture.class, null);
	}

	/**
	 * ͨ��ID����
	 * 
	 * @param goodsId
	 * @return
	 */
	public List<Goods> getGoodsBygoodsId(int goodsId) {
		return (List<Goods>) BaseDao.select("select * from Goods where goodsId like ?", Goods.class, goodsId);
	}

	/**
	 * ������ƷIDɾ��
	 * 
	 * @param goodsId
	 * @return
	 */
	public boolean deleteGoods(int goodsId) {
		//��ȡ����
		Connection conn = BaseDao.getConn();
		//�����ֶ��ύ
		try {
			conn.setAutoCommit(false);
			
			//��ȡͼƬ��ַ
			 List<Goods_picture> list= (List<Goods_picture>)BaseDao.select("select * from goods_picture where goodsid=?", conn, Goods_picture.class, goodsId);
		
			 if (list.size()>0) {
				//������ڸ���ƷͼƬ����ɾ��
				 //ɾ��ͼƬ
				File file = new File("D://Tomcat/apache-tomcat-9.0.0.M26-windows-x64/apache-tomcat-9.0.0.M26/webapps/lzxp/"+list.get(0).getPICTUREADDRESS());
				if (file.exists()) {
					//����ļ����ڣ���ɾ��
					file.delete();
				}
			}
			
			//ɾ����ƷͼƬ�� ͼƬ��ַ
			BaseDao.execute("delete from goods_picture where goodsId =?", conn, goodsId);
			//ɾ����Ʒ
			BaseDao.execute("delete from Goods where goodsId=?", conn, goodsId);
			
			
			
			//�ύ
			conn.commit();
			return true;
		} catch (SQLException e) {
			//����ع�
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			//�ر���Դ
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		return  false;
	}

	/**
	 * �޸���Ʒ��Ϣ
	 * 
	 * @param goods
	 * @return
	 */
	public boolean updateGoods(Goods goods, String goodsStypeName,String pictureAddress) {
			
			//��ȡԭʼͼƬ��ַ
			 List<Goods_picture> picAddressList= (List<Goods_picture>)BaseDao.select("select * from goods_picture where goodsid=?", Goods_picture.class, goods.getGOODSID());
		
			 if (picAddressList.size()>0) {
				//������ڸ���ƷͼƬ����ɾ��
				 //ɾ��ͼƬ
				File file = new File("D://Tomcat/apache-tomcat-9.0.0.M26-windows-x64/apache-tomcat-9.0.0.M26/webapps/lzxp/"+picAddressList.get(0).getPICTUREADDRESS());
				if (file.exists()) {
					//����ļ����ڣ���ɾ��
					file.delete();
				}
			}
			 
		Connection conn = BaseDao.getConn();
		//�ֶ��ύ
		try {
			conn.setAutoCommit(false);
			// ����С��������ȡС��id
			List<Goods_stype> list = (List<Goods_stype>) BaseDao.select("select * from goods_stype where stypename=?",conn,
					Goods_stype.class, goodsStypeName);
			int stypeId = list.get(0).getSTYPEID();
			
			if (pictureAddress!=null) {
				//����µĵ�ַ����
				//�޸ĵ�ַ
				BaseDao.execute("update goods_picture set pictureaddress=? where goodsid=?",conn,pictureAddress,goods.getGOODSID());
			}
			// �޸���Ʒ
			BaseDao.execute(
					"update Goods set goodsName=?,stypeId=?,goodsPrice=?,goodsContent=?,goodsStock=? where goodsId=?",conn,
					goods.getGOODSNAME(), stypeId, goods.getGOODSPRICE(), goods.getGOODSCONTENT(), goods.getGOODSSTOCK(),
					goods.getGOODSID());
			//�ֶ��ύ
			conn.commit();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//�ع�
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			//�ͷ���Դ
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
		
	}

	/**
	 * ��ȡ��ƷС��
	 * 
	 * @return
	 */
	public List<Goods_stype> getStype() {
		return (List<Goods_stype>) BaseDao.select("select * from goods_stype", Goods_stype.class, null);
	}

	/**
	 * ������Ʒ��ͨ����������ȡ��ȡС���ͣ�
	 * 
	 * @param stypeName
	 * @return
	 */
	public boolean addGoods(Goods goods, String stypeName,String pictureAddress) {
		
		//��ȡ����
		Connection conn = BaseDao.getConn();
		//�����ֶ��ύ
		try {
			conn.setAutoCommit(false);
			
			// ��ȡ��ƷС��id
			if (stypeName == null) {
				// �����Ʒ��Ϊ��
				//������Ʒ
				BaseDao.execute("insert into goods values(null,?,null,?,?,?,null)", conn,goods.getGOODSNAME(),
						goods.getGOODSPRICE(), goods.getGOODSCONTENT(), goods.getGOODSSTOCK()) ;
				
			}else{
				// ����
				
				List<Goods_stype> list = (List<Goods_stype>) BaseDao.select("select * from goods_stype where stypename=?",
						conn,Goods_stype.class, stypeName);
				int stypeId = list.get(0).getSTYPEID();
				// ������Ʒ
				BaseDao.execute("insert into goods values(null,?,?,?,?,?,null)",conn, goods.getGOODSNAME(), stypeId,
						goods.getGOODSPRICE(), goods.getGOODSCONTENT(), goods.getGOODSSTOCK());
			}
			//��ȡ����Ʒ��id
			List<Goods> goodsIdList = (List<Goods>) BaseDao.select("select * from goods where goodsName=?", conn, Goods.class, goods.getGOODSNAME());
			int goodsId = goodsIdList.get(0).getGOODSID();
			//���ӵ�ַ
			BaseDao.execute("insert into goods_picture values(null,?,?)", conn, goodsId,pictureAddress);
			//�ֶ��ύ
			conn.commit();
			return true;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//�ع�
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			//�ر���Դ
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}

	/**
	 * ��Ʒ�ϼ�
	 * @param goodsId
	 * @return
	 */
	public boolean upGoods(int goodsId) {
		return BaseDao.execute("update goods set goodsState=1 where goodsId=?", goodsId) > 0;
	}
	
	/**
	 * ��Ʒ�¼�
	 * @param goodsId
	 * @return
	 */
	public boolean downGoods(int goodsId) {
		return BaseDao.execute("update goods set goodsState=0 where goodsId=?", goodsId) > 0;
	}
	

}
