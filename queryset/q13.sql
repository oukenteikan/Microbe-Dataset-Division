SELECT ?genomeid
WHERE
{
	{
		?taxonid <http://gcm.wdcm.org/ontology/gcmAnnotation/v1/ancestorTaxid> <http://gcm.wdcm.org/data/gcmAnnotation1/taxonomy/1270>.
		?nameId a <http://gcm.wdcm.org/ontology/gcmAnnotation/v1/TaxonName>;
		<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/taxid> ?taxonid;
		<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/nameclass> 'scientificName';
		<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/taxname> ?name.
		?genomeid a <http://gcm.wdcm.org/ontology/gcmAnnotation/v1/GenomeNode>;
		<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/x-taxon> ?taxonid;
		<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/definition> ?description.
		FILTER ((regex(?name,'SK58')) || (regex(?genomeid,'SK58')) || (regex(?description,'SK58'))).
	}
	UNION
	{
		?nameId a <http://gcm.wdcm.org/ontology/gcmAnnotation/v1/TaxonName>;
		<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/taxid> <http://gcm.wdcm.org/data/gcmAnnotation1/taxonomy/1270>;
		<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/nameclass> 'scientificName';
		<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/taxname> ?name.
		?genomeid a <http://gcm.wdcm.org/ontology/gcmAnnotation/v1/GenomeNode>;
		<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/x-taxon> <http://gcm.wdcm.org/data/gcmAnnotation1/taxonomy/1270>;
		<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/definition> ?description.
		FILTER ((regex(?name,'SK58')) || (regex(?genomeid,'SK58')) || (regex(?description,'SK58'))).
	}
}
