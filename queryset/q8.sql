SELECT DISTINCT ?goid
WHERE
{
	?proteinid a <http://gcm.wdcm.org/ontology/gcmAnnotation/v1/ProteinNode>;
	<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/x-taxon> <http://gcm.wdcm.org/data/gcmAnnotation1/taxonomy/465515>;
	<http://gcm.wdcm.org/ontology/gcmAnnotation/v1/x-go> ?goid.
}
