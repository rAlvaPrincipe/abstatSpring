package com.summarization.export;

import com.summarization.web.SolrConnector;

import org.apache.solr.client.solrj.impl.HttpSolrServer;

public class DeleteAllDocumentsFromIndex
{
	public static void main (String[] args) throws Exception
	{
		HttpSolrServer client = new SolrConnector().asUpdateClient();
		client.deleteByQuery("dataset:" + args[0]);
		client.commit();
	}
}
