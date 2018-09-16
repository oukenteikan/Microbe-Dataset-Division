SELECT ?name ?parentId
WHERE
{
	<http://gcm.wdcm.org/data/gcmAnnotation1/taxonomy/1270> <http://gcm.wdcm.org/ontology/gcmAnnotation/v1/parentTaxid> ?parentId.
	?nameId <http://gcm.wdcm.org/ontology/gcmAnnotation/v1/taxid> ?parentId;
	<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/nameclass> 'scientificName';
	<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/taxname> ?name.
}
