SELECT DISTINCT ?p ?t
WHERE
{
	?t a <http://gcm.wdcm.org/ontology/gcmAnnotation/v1/TaxonNode>;
	<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/parentTaxid> <http://gcm.wdcm.org/data/gcmAnnotation1/taxonomy/1078830>.
	?nameId <http://gcm.wdcm.org/ontology/gcmAnnotation/v1/taxid> ?t;
	<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/nameclass> 'scientificName';
	<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/taxname> ?p.
	?temp <http://gcm.wdcm.org/ontology/gcmAnnotation/v1/parentTaxid> ?t.
}
