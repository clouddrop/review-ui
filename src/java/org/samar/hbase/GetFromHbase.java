package org.samar.hbase;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.HBaseAdmin;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.util.Bytes;



public class GetFromHbase {
	private static Configuration conf;
	HTable table;
	String tableName="review";
	String[] colFams ={"data"};

	public GetFromHbase() throws IOException {
		conf = HBaseConfiguration.create();
		// conf.set("hbase.master","cloudera-vm:6000");
		//conf.set("hbase.zookeeper.quorum", "cloudera-vm");
		// conf.addResource(new
		// Path("/path_to_your_hbase/hbase-0.20.6/conf/hbase-site.xml"));
		 //createTable( tableName, colFams);
		table = new HTable(conf, tableName);
	}

	void createTable(String tableName, String[] colFams) throws IOException {
		HBaseAdmin hbase = new HBaseAdmin(conf);
		HTableDescriptor desc = new HTableDescriptor(tableName);
		for (String eachColFam : colFams) {
			HColumnDescriptor meta = new HColumnDescriptor(eachColFam.getBytes());
			desc.addFamily(meta);
		}

		hbase.createTable(desc);

		hbase.close();
	}

	public void addAColumnEntry(String tableName, String row, String colFamilyName, String colName, byte[] data) throws IOException {

		byte[] rowKey = Bytes.toBytes(row);
		Put putdata = new Put(rowKey);
		putdata.add(Bytes.toBytes(colFamilyName), Bytes.toBytes(colName), data);
		table.put(putdata);

	}

	public static void main(String args[]) throws IOException {
		String tableName = "review";
		String[] colFamilyNames = { "data" };

		

		
	}
	
	
	public byte[] getColEntry( String rowName) {
		 String colName ="dump";
		System.out.println("HBase Get for " + " rowName: " +rowName +" column " + colFams[0] +":" +colName);
		byte[] result = null;
		try {
			byte[] rowKey = Bytes.toBytes(rowName);
			Get getRowData = new Get(rowKey);
			Result res = table.get(getRowData);
			byte[] obtainedRow = res.getValue(Bytes.toBytes(colFams[0] ), Bytes.toBytes(colName));
			//res.getValue(Bytes.toBytes(colFamilyName), Bytes.toBytes("));
			result = obtainedRow;
		} catch (IOException e) {
			System.out.println("Exception occured in retrieving data");
		}
		return result;
	}
	
	
	
	public void addData(String tableName ) throws IOException
	{
		List<File> listOfFiles = this.getAllFiles("/Users/samar.kumar/Downloads/data/reviews/social-odp-2k9_documents");
		for (File eachFile : listOfFiles) {
			
			this.addAColumnEntry(tableName, eachFile.getName(), "data", "dump", FileUtils.readFileToByteArray(eachFile));
		}
	}

	public List<File> getAllFiles(String path) {

		
		File folder = new File(path);
		File[] listOfFiles = folder.listFiles();
		List<File> returnList = new ArrayList<File>();
		for (int i = 0; i < listOfFiles.length; i++) {

			if (listOfFiles[i].isFile()) {
				returnList.add(listOfFiles[i]);
			}
		}

		return returnList;
	}

}
