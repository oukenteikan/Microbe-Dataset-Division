SELECT ?taxonId
WHERE
{
	?nameId <http://gcm.wdcm.org/ontology/gcmAnnotation/v1/taxname> 'Micrococcus luteus'.
	?nameId <http://gcm.wdcm.org/ontology/gcmAnnotation/v1/taxid> ?taxonId
}
