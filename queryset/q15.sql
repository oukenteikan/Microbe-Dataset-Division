SELECT ?goid
WHERE
{
	{
		?taxonid <http://gcm.wdcm.org/ontology/gcmAnnotation/v1/ancestorTaxid> <http://gcm.wdcm.org/data/gcmAnnotation1/taxonomy/1270>.
		?nameId <http://gcm.wdcm.org/ontology/gcmAnnotation/v1/taxid> ?taxonid;
		<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/nameclass> 'scientificName';
		<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/taxname> ?name.
		?proteinid a <http://gcm.wdcm.org/ontology/gcmAnnotation/v1/ProteinNode>;
		<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/x-taxon> ?taxonid;
		<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/x-go> ?goid.
		?goid <http://www.geneontology.org/formats/oboInOwl#hasOBONamespace> 'biological_process'^^<http://www.w3.org/2001/XMLSchema#string>.
	}
	UNION
	{
		?nameId <http://gcm.wdcm.org/ontology/gcmAnnotation/v1/taxid> <http://gcm.wdcm.org/data/gcmAnnotation1/taxonomy/1270>;
		<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/nameclass> 'scientificName';
		<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/taxname> ?name.
		?proteinid a <http://gcm.wdcm.org/ontology/gcmAnnotation/v1/ProteinNode>;
		<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/x-taxon> <http://gcm.wdcm.org/data/gcmAnnotation1/taxonomy/1270>;
		<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/x-go> ?goid.
		?goid <http://www.geneontology.org/formats/oboInOwl#hasOBONamespace> 'biological_process'^^<http://www.w3.org/2001/XMLSchema#string>.
	}
}
