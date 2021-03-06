package com.test.unit;

import static org.hamcrest.Matchers.equalTo;
import static org.junit.Assert.*;
import com.summarization.ontology.ConceptExtractor;
import com.summarization.ontology.Concepts;
import com.summarization.ontology.DomainRange;
import com.summarization.ontology.OntologyDomainRangeExtractor;
import com.summarization.ontology.Properties;
import com.summarization.ontology.PropertyExtractor;

import org.junit.Test;

import com.hp.hpl.jena.ontology.OntModel;
import com.hp.hpl.jena.vocabulary.RDFS;

public class OntologyDomainRangeExtractorTest {

	@Test
	public void shouldParseAnEmptyOntology() throws Exception {
		ToyOntology model = new ToyOntology().owl();

		patternsFrom(model.build());
	}
	
	@Test
	public void shouldParseASimpleOntology() throws Exception {
		
		ToyOntology model = new ToyOntology()
				.owl()
				.definingResource("http://livesIn")
					.thatHasProperty(RDFS.domain)
						.linkingTo("http://actor")
					.thatHasProperty(RDFS.range)
						.linkingTo("http://city");
		
		DomainRange patterns = patternsFrom(model.build());
		
		assertThat(patterns.getDRRelation().get("http://livesIn").get(0).getURI(), equalTo("http://actor"));
		assertThat(patterns.getDRRelation().get("http://livesIn").get(1).getURI(), equalTo("http://city"));
	}

	private DomainRange patternsFrom(OntModel model) {
		
		PropertyExtractor propertyExtractor = new PropertyExtractor();
		propertyExtractor.setProperty(model);
		Properties properties = new Properties();
		properties.setExtractedProperty(propertyExtractor.getExtractedProperty());
		
		ConceptExtractor conceptExtractor = new ConceptExtractor();
		conceptExtractor.setConcepts(model, true);
		
		Concepts concepts = new Concepts();
		concepts.setConcepts(conceptExtractor.getConcepts());
		concepts.setExtractedConcepts(conceptExtractor.getExtractedConcepts());
		concepts.setObtainedBy(conceptExtractor.getObtainedBy());
		OntologyDomainRangeExtractor extractor = new OntologyDomainRangeExtractor();
		extractor.setConceptsDomainRange(concepts, properties);
		
		return extractor.getPropertyDomainRange();
	}
}
