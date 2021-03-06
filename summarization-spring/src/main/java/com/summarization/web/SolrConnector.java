package com.summarization.web;

import com.summarization.web.ClientCommunication;

import java.io.InputStream;

import org.apache.solr.client.solrj.impl.HttpSolrServer;

public class SolrConnector implements Connector{
	
	@Override
	public InputStream query(String path, QueryString queryString) throws Exception {
		return new ClientCommunication("http://localhost:8983").httpGet(path + queryString.build()).getEntity().getContent();
	}
	
	public HttpSolrServer asUpdateClient(){
		return new HttpSolrServer("http://localhost:8983/solr/indexing");
	}
}
