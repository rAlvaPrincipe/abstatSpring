package com.summarization.dataset;

import org.apache.commons.io.IOUtils;

import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.rdf.model.ModelFactory;
import com.hp.hpl.jena.rdf.model.Statement;
import com.summarization.export.Events;

public class NTripleFile {

	private NTripleAnalysis[] analyzers;

	public NTripleFile(NTripleAnalysis... analyzers) {
		this.analyzers = analyzers;
	}

	public void process(InputFile file) throws Exception {
		while(file.hasNextLine()){
			String line = file.nextLine();
			try{
				String[] splitted = line.split("##");
				String subject = splitted[0];
				String property = splitted[1];
				String object = splitted[2];
				String datatype = "";
				
				if(splitted.length > 3){
					datatype = "^^<" + splitted[3] + ">";
				}
	
				if(!object.startsWith("\"")){
					object = "<" + object + ">";
				}
				
				line = "<" + subject + "> <" + property + "> " + object + datatype + " .";  
				
				Model model = ModelFactory.createDefaultModel();
				model.read(IOUtils.toInputStream(line) ,null, "N-TRIPLES");
				Statement statement = model.listStatements().next();
				
				
				NTriple triple = new NTriple(statement);
				for(NTripleAnalysis analysis : analyzers){
					analysis.track(triple);
				}	
			}catch(Exception e){
				Events.summarization().error("error processing " + line + " from " + file.name(), e);
			}
		}
	}

}
