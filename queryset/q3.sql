SELECT DISTINCT ?name
WHERE
{
	?nameId <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://gcm.wdcm.org/ontology/gcmAnnotation/v1/TaxonName>;
	<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/nameclass> 'scientificName';
	<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/taxname> ?name.
	FILTER (regex(?name,'^Micrococcus luteus','i'))
}
