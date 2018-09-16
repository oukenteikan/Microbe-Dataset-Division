微生物
enzyme

select (count(?enzymeid) as ?num) where {	
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%?taxonid1%%. 
 ?geneid a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty> ?taxonid;<GeneOntology.objectXEnzymeProperty> ?enzymeid.}
union{?geneid a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty> %%taxonid%%;<GeneOntology.objectXEnzymeProperty> ?enzymeid.}
};

select (count(?enzymeid) as ?num) where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%. 
?geneid a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty> ?taxonid;<GeneOntology.objectXEnzymeProperty> ?enzymeid.
optional{?enzymeid <EnzymeOntology.nameProperty> ?enzymename.}
optional{?enzymeid <EnzymeOntology.classProperty> ?enzymeclass.}
bind(%%taxonid%% as ?taxonid) 
FILTER (regex(?taxonid,%%fname%%)||regex(?enzymeid,%%fname%%)||regex(?enzymename,%%fname%%)||regex(?enzymeclass,%%fname%%))}
union{?geneid a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty> %%taxonid%%;<GeneOntology.objectXEnzymeProperty> ?enzymeid.
optional{?enzymeid <EnzymeOntology.nameProperty> ?enzymename.}
optional{?enzymeid <EnzymeOntology.classProperty> ?enzymeclass.}
bind(%%taxonid%% as ?taxonid) 
FILTER (regex(?taxonid,%%fname%%)||regex(?enzymeid,%%fname%%)||regex(?enzymename,%%fname%%)||regex(?enzymeclass,%%fname%%))}
}

select ?taxonid ?enzymeid ?enzymeclass ?sysname ?enzymename where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%. 
?geneid a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty> ?taxonid;<GeneOntology.objectXEnzymeProperty> ?enzymeid.
optional{?enzymeid <EnzymeOntology.nameProperty> ?enzymename.}
optional{?enzymeid <EnzymeOntology.classProperty> ?enzymeclass.}
optional{?enzymeid <EnzymeOntology.sysnameProperty> ?sysname.}}
union{?geneid a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty> %%taxonid%%;<GeneOntology.objectXEnzymeProperty> ?enzymeid.
optional{?enzymeid <EnzymeOntology.nameProperty> ?enzymename.}
optional{?enzymeid <EnzymeOntology.classProperty> ?enzymeclass.}
optional{?enzymeid <EnzymeOntology.sysnameProperty> ?sysname.}}
} OFFSET start * pageSize Limit pageSize

select ?taxonid ?enzymeid ?enzymeclass ?sysname ?enzymename where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%. 
?geneid a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty> ?taxonid;<GeneOntology.objectXEnzymeProperty> ?enzymeid.
optional{?enzymeid <EnzymeOntology.nameProperty> ?enzymename.}
optional{?enzymeid <EnzymeOntology.classProperty> ?enzymeclass.}
optional{?enzymeid <EnzymeOntology.sysnameProperty> ?sysname.}
bind(%%taxonid%% as ?taxonid) 
FILTER (regex(?taxonid,%%fname%%)||regex(?enzymeid,%%fname%%)||regex(?enzymename,%%fname%%)||regex(?enzymeclass,%%fname%%))}
union{?geneid a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty> %%taxonid%%;<GeneOntology.objectXEnzymeProperty> ?enzymeid.
optional{?enzymeid <EnzymeOntology.nameProperty> ?enzymename.}
optional{?enzymeid <EnzymeOntology.classProperty> ?enzymeclass.}
optional{?enzymeid <EnzymeOntology.sysnameProperty> ?sysname.}
bind(%%taxonid%% as ?taxonid) 
FILTER (regex(?taxonid,%%fname%%)||regex(?enzymeid,%%fname%%)||regex(?enzymename,%%fname%%)||regex(?enzymeclass,%%fname%%))}
} OFFSET tart * pageSize Limit pageSize

select (count(distinct ?pathwayId) as ?num) where{ 
%%enzymeid%% <EnzymeOntology.objectX_pathwayProperty> ?pathwayId.
}

select (count(distinct ?geneid) as ?num) where{
?geneid a <GeneOntology.geneClass>;<GeneOntology.objectXEnzymeProperty> %%enzymeid%%.
}

gene

SELECT (count(?geneid) as ?num) where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
?nameId <TaxonomyOntology.taxidProperty> ?taxonid;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName'; <TaxonomyOntology.taxNameProperty> ?name.
?geneid a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty> ?taxonid.
FILTER (regex(?name,%%fname%%))}
union{?geneid a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty> %%taxonid%%.
?nameId <TaxonomyOntology.taxidProperty> %%taxonid%%;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName'; <TaxonomyOntology.taxNameProperty> ?name.
FILTER (regex(?name,%%fname%%))}
}

SELECT (count(?geneid) as ?num) where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
?geneid a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty> ?taxonid.}
union{?geneid a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty> %%taxonid%%.}
}

SELECT ?taxonid ?name  ?genomeid  ?geneid ?locusTag  ?symbol  ?start ?end  ?strand ?proteinid ?description where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
?nameId <TaxonomyOntology.taxidProperty> ?taxonid;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName'; <TaxonomyOntology.taxNameProperty> ?name.
?gene a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty> ?taxonid.
optional{?gene <GeneOntology.objectXUniprotProperty> ?proteinid.}
optional{?gene <GeneOntology.geneidProperty> ?geneid. }
optional{?gene <GeneOntology.objectXGenomeProperty> ?genomeid.}
optional{?gene <GeneOntology.locusTagProperty> ?locusTag.}
optional{?gene <GeneOntology.symbolProperty> ?symbol.}
optional{?gene <GeneOntology.gstartProperty> ?start.}
optional{?gene <GeneOntology.gendProperty> ?end.}
optional{?gene <GeneOntology.gorientationProperty> ?strand.}
optional{?gene <GeneOntology.descriptionProperty> ?description.}
FILTER (regex(?name,%%fname%%))}
union{?nameId <TaxonomyOntology.taxidProperty> %%taxonid%%;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName'; <TaxonomyOntology.taxNameProperty> ?name.
?gene a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty> %%taxonid%%.
optional{?gene <GeneOntology.objectXUniprotProperty> ?proteinid.}
optional{?gene <GeneOntology.geneidProperty> ?geneid. }
optional{?gene <GeneOntology.objectXGenomeProperty> ?genomeid.}
optional{?gene <GeneOntology.locusTagProperty> ?locusTag.}
optional{?gene <GeneOntology.symbolProperty> ?symbol.}
optional{?gene <GeneOntology.gstartProperty> ?start.}
optional{?gene <GeneOntology.gendProperty> ?end.}
optional{?gene <GeneOntology.gorientationProperty> ?strand.}
optional{?gene <GeneOntology.descriptionProperty> ?description.}
bind(%%taxonid%% as ?taxonid) 
FILTER (regex(?name,%%fname%%))}
} 
OFFSET start * pageSize Limit pageSize

SELECT ?taxonid ?name  ?genomeid  ?geneid ?locusTag  ?symbol  ?start ?end  ?strand ?proteinid ?description where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
?nameId <TaxonomyOntology.taxidProperty> ?taxonid;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName'; <TaxonomyOntology.taxNameProperty> ?name.
?gene a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty> ?taxonid.
optional{?gene <GeneOntology.objectXUniprotProperty> ?proteinid.}
optional{?gene <GeneOntology.geneidProperty> ?geneid.}
optional{?gene <GeneOntology.objectXGenomeProperty> ?genomeid.}
optional{?gene <GeneOntology.locusTagProperty> ?locusTag.}
optional{?gene <GeneOntology.symbolProperty> ?symbol.}
optional{?gene <GeneOntology.gstartProperty> ?start.}
optional{?gene <GeneOntology.gendProperty> ?end.}
optional{?gene <GeneOntology.gorientationProperty> ?strand.}
optional{?gene <GeneOntology.descriptionProperty> ?description.}}
union{?nameId <TaxonomyOntology.taxidProperty> %%taxonid%%;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName'; <TaxonomyOntology.taxNameProperty> ?name.
?gene a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty> %%taxonid%%.
optional{?gene <GeneOntology.objectXUniprotProperty> ?proteinid.}
optional{?gene <GeneOntology.geneidProperty> ?geneid.}
optional{?gene <GeneOntology.objectXGenomeProperty> ?genomeid.}
optional{?gene <GeneOntology.locusTagProperty> ?locusTag.}
optional{?gene <GeneOntology.symbolProperty> ?symbol.}
optional{?gene <GeneOntology.gstartProperty> ?start.}
optional{?gene <GeneOntology.gendProperty> ?end.}
optional{?gene <GeneOntology.gorientationProperty> ?strand.}
optional{?gene <GeneOntology.descriptionProperty> ?description.}
bind(%%taxonid%% as ?taxonid) }
} 
OFFSET start * pageSize Limit pageSize

genome

SELECT (count(?genomeid) as ?num) where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
?nameId a <TaxonomyOntology.nameClass>;<TaxonomyOntology.taxidProperty> ?taxonid;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName'; <TaxonomyOntology.taxNameProperty> ?name.
?genomeid a <GenomeOntoloty.genomeClass>;<GenomeOntoloty.objectXtaxonProperty> ?taxonid;<GenomeOntoloty.definitionProperty> ?description.
FILTER ((regex(?name,%%fname%%)) || (regex(?genomeid,%%fname%%)) || (regex(?description,%%fname%%))).}
union{?nameId a <TaxonomyOntology.nameClass>;<TaxonomyOntology.taxidProperty>  %%taxonid%%;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName'; <TaxonomyOntology.taxNameProperty> ?name.
?genomeid a <GenomeOntoloty.genomeClass>;<GenomeOntoloty.objectXtaxonProperty> %%taxonid%%;<GenomeOntoloty.definitionProperty> ?description.
FILTER ((regex(?name,%%fname%%)) || (regex(?genomeid,%%fname%%)) || (regex(?description,%%fname%%))).}
}

SELECT (count(?genomeid) as ?num) where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
?genomeid a <GenomeOntoloty.genomeClass>;<GenomeOntoloty.objectXtaxonProperty> ?taxonid;<GenomeOntoloty.definitionProperty> ?description.}
union{?nameId a <TaxonomyOntology.nameClass>;<TaxonomyOntology.taxidProperty>  %%taxonid%%;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName'; <TaxonomyOntology.taxNameProperty> ?name.
?genomeid a <GenomeOntoloty.genomeClass>;<GenomeOntoloty.objectXtaxonProperty> %%taxonid%%;<GenomeOntoloty.definitionProperty> ?description.}
}

SELECT ?taxonid ?name ?genomeid ?description ?strain where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
?nameId a <TaxonomyOntology.nameClass>;<TaxonomyOntology.taxidProperty> ?taxonid;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName'; <TaxonomyOntology.taxNameProperty> ?name.
?genomeid a <GenomeOntoloty.genomeClass>;<GenomeOntoloty.objectXtaxonProperty> ?taxonid;<GenomeOntoloty.definitionProperty> ?description.
optional{?genomeid <GenomeOntoloty.strainProperty> ?strain.}
FILTER ((regex(?name,%%fname%%)) || (regex(?genomeid,%%fname%%)) || (regex(?description,%%fname%%))).}
union{?nameId a <TaxonomyOntology.nameClass>;<TaxonomyOntology.taxidProperty> %%taxonid%%;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName'; <TaxonomyOntology.taxNameProperty> ?name.
?genomeid a <GenomeOntoloty.genomeClass>;<GenomeOntoloty.objectXtaxonProperty> %%taxonid%%;<GenomeOntoloty.definitionProperty> ?description.
bind(%%taxonid%% as ?taxonid) 
optional{?genomeid <GenomeOntoloty.strainProperty> ?strain.}
FILTER ((regex(?name,%%fname%%)) || (regex(?genomeid,%%fname%%)) || (regex(?description,%%fname%%))).}
} 
OFFSET start * pageSize Limit pageSize

SELECT ?taxonid ?name ?genomeid ?description ?strain where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
?nameId a <TaxonomyOntology.nameClass>;<TaxonomyOntology.taxidProperty> ?taxonid;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName'; <TaxonomyOntology.taxNameProperty> ?name.
?genomeid a <GenomeOntoloty.genomeClass>;<GenomeOntoloty.objectXtaxonProperty> ?taxonid;<GenomeOntoloty.definitionProperty> ?description.
optional{?genomeid <GenomeOntoloty.strainProperty> ?strain.}}
union{?nameId a <TaxonomyOntology.nameClass>;<TaxonomyOntology.taxidProperty> %%taxonid%%;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName'; <TaxonomyOntology.taxNameProperty> ?name.
?genomeid a <GenomeOntoloty.genomeClass>;<GenomeOntoloty.objectXtaxonProperty> %%taxonid%%;<GenomeOntoloty.definitionProperty> ?description.
bind(%%taxonid%% as ?taxonid) 
optional{?genomeid <GenomeOntoloty.strainProperty> ?strain.}}
} 
OFFSET start * pageSize Limit pageSize

GO

SELECT ?taxonid ?name ?goid ?definition ?goname where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
?nameId <TaxonomyOntology.taxidProperty> ?taxonid;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.
?proteinid a <ProteinOntology.proteinClass>;<ProteinOntology.objectXtaxonProperty> ?taxonid; <ProteinOntology.objectXgoProperty> ?goid.
?goid <GOOntology.hasOboNamespace> %%identifier%%.
optional{?goid <GOOntology.iaoProperty> ?definition.}
optional{?goid <GOOntology.labelProperty> ?goname.}
FILTER (regex(?name,%%fname%%))}
union{?nameId <TaxonomyOntology.taxidProperty> %%taxonid%%;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.
?proteinid a <ProteinOntology.proteinClass>;<ProteinOntology.objectXtaxonProperty> %%taxonid%%; <ProteinOntology.objectXgoProperty>  ?goid.
?goid <GOOntology.hasOboNamespace> %%identifier%%.
optional{?goid <GOOntology.iaoProperty> ?definition.}
optional{?goid <GOOntology.labelProperty> ?goname.} 
bind(%%taxonid%% as ?taxonid)  
FILTER (regex(?name,%%fname%%))} 
}
OFFSET pageStar * pageSize Limit pageSize

SELECT ?taxonid ?name ?goid ?definition ?goname where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
?nameId <TaxonomyOntology.taxidProperty> ?taxonid;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.
?proteinid a <ProteinOntology.proteinClass>;<ProteinOntology.objectXtaxonProperty> ?taxonid; <ProteinOntology.objectXgoProperty>  ?goid.
?goid <GOOntology.hasOboNamespace> %%identifier%%.
optional{?goid <GOOntology.iaoProperty> ?definition.}
optional{?goid <GOOntology.labelProperty> ?goname.}}
union{?nameId <TaxonomyOntology.taxidProperty> %%taxonid%%;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.
?proteinid a <ProteinOntology.proteinClass>;<ProteinOntology.objectXtaxonProperty> %%taxonid%%; <ProteinOntology.objectXgoProperty>  ?goid.
?goid <GOOntology.hasOboNamespace> %%identifier%%.
optional{?goid <GOOntology.iaoProperty> ?definition.}
optional{?goid <GOOntology.labelProperty> ?goname.
bind(%%taxonid%% as ?taxonid) }}
} 
OFFSET pageStar * pageSize Limit pageSize

SELECT (count(?proteinid) as ?num) where {
?proteinid a <ProteinOntology.proteinClass>;<ProteinOntology.objectXtaxonProperty> %%taxonIdchild%%; <ProteinOntology.objectXgoProperty>  %%goId%%.
}

SELECT (count(?goid) as ?num) where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
?nameId <TaxonomyOntology.taxidProperty> ?taxonid;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.
?proteinid a <ProteinOntology.proteinClass>;<ProteinOntology.objectXtaxonProperty> ?taxonid; <ProteinOntology.objectXgoProperty>  ?goid.
?goid <GOOntology.hasOboNamespace> %%identify%%.
FILTER (regex(?name,%%fname%%))}
union{?nameId <TaxonomyOntology.taxidProperty> %%taxonid%%;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.
?proteinid a <ProteinOntology.proteinClass>;<ProteinOntology.objectXtaxonProperty> %%taxonid%%; <ProteinOntology.objectXgoProperty>  ?goid.
?goid <GOOntology.hasOboNamespace> %%identify%%.
FILTER (regex(?name,%%fname%%))}
}

SELECT (count(?goid) as ?num) 
where 
{
	{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
	?nameId <TaxonomyOntology.taxidProperty> ?taxonid;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.
	?proteinid a <ProteinOntology.proteinClass>;<ProteinOntology.objectXtaxonProperty> ?taxonid; <ProteinOntology.objectXgoProperty>  ?goid.
	?goid <GOOntology.hasOboNamespace> %%identify%%.}
	union
	{?nameId <TaxonomyOntology.taxidProperty> %%taxonid%%;
	<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';
	<TaxonomyOntology.taxNameProperty> ?name.
	?proteinid a <ProteinOntology.proteinClass>;
	<ProteinOntology.objectXtaxonProperty> %%taxonid%%; 
	<ProteinOntology.objectXgoProperty>  ?goid.
	?goid <GOOntology.hasOboNamespace> %%identify%%.}
}

SELECT (count(?goid) as ?num) where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
?nameId <TaxonomyOntology.taxidProperty> ?taxonid;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.
?proteinid a <ProteinOntology.proteinClass>;<ProteinOntology.objectXtaxonProperty> ?taxonid; <ProteinOntology.objectXgoProperty>  ?goid.}
union{?nameId <TaxonomyOntology.taxidProperty> %%taxonid%%;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.
?proteinid a <ProteinOntology.proteinClass>;<ProteinOntology.objectXtaxonProperty> %%taxonid%%; <ProteinOntology.objectXgoProperty>  ?goid.}
}

index

select distinct ?p ?t where {
?t a <TaxonomyOntology.taxonClass>;<TaxonomyOntology.parentTaxidProperty> <TaxonomyOntology.resourcePrefix%%taxonid%%>.
?nameId <TaxonomyOntology.taxidProperty> ?t;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?p.
}
order by ?p

select distinct ?p ?t where {
?t a <TaxonomyOntology.taxonClass>;<TaxonomyOntology.parentTaxidProperty> <TaxonomyOntology.resourcePrefix%%taxonid%%>.
?nameId <TaxonomyOntology.taxidProperty> ?t;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?p.
?temp <TaxonomyOntology.parentTaxidProperty> ?t.
}
order by ?p

pathway

select ?taxonid ?pathwayid ?pathwayclass ?pathwayname where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
 ?geneid a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty> ?taxonid;<GeneOntology.objectXPathwayProperty> ?pathwayid.
 optional{?pathwayid <PathwayOntology.nameProperty> ?pathwayname.}
 optional{?pathwayid <PathwayOntology.organismProperty>?pathwayclass.}}
 union{ ?geneid a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty> %%taxonid%%;<GeneOntology.objectXPathwayProperty> ?pathwayid.
 optional{?pathwayid <PathwayOntology.nameProperty> ?pathwayname.}
 optional{?pathwayid <PathwayOntology.organismProperty>?pathwayclass.}}
}
 OFFSET start * pageSize Limit pageSize

select ?taxonid ?pathwayid ?pathwayclass ?pathwayname where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
 ?geneid a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty> ?taxonid;<GeneOntology.objectXPathwayProperty> ?pathwayid.
 optional{?pathwayid <PathwayOntology.nameProperty> ?pathwayname.}
 optional{?pathwayid <PathwayOntology.organismProperty> ?pathwayclass.}
 FILTER (regex(?taxonid,%%fname%%)||regex(?pathwayid,%%fname%%)||regex(?pathwayname,%%fname%%)||regex(?pathwayclass,%%fname%%))}
 union{?geneid a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty> %%taxonid%%;<GeneOntology.objectXPathwayProperty> ?pathwayid.
 optional{?pathwayid <PathwayOntology.nameProperty> ?pathwayname.}
 optional{?pathwayid <PathwayOntology.organismProperty> ?pathwayclass.}
 bind(%%taxonid%% as ?taxonid) 
 FILTER (regex(?taxonid,%%fname%%)||regex(?pathwayid,%%fname%%)||regex(?pathwayname,%%fname%%)||regex(?pathwayclass,%%fname%%))}
} 
OFFSET start * pageSize Limit pageSize

select (count(distinct ?enzymeid) as ?num) where{
?enzymeid a <EnzymeOntology.enzymeClass>;<EnzymeOntology.objectX_pathwayProperty> %%pathwayid%%.
}

select (count(distinct ?geneid) as ?num) where{
?geneid a <GeneOntology.geneClass>;<GeneOntology.objectXPathwayProperty> %%pathwayid%%.
}

select (count(?pathwayid) as ?num) where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%. 
 ?geneid a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty> ?taxonid;<GeneOntology.objectXPathwayProperty> ?pathwayid.}
 union{?geneid a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty> %%taxonid%%;<GeneOntology.objectXPathwayProperty> ?pathwayid.}
 }

select (count(?pathwayid) as ?num) where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
 ?geneid a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty> ?taxonid;<GeneOntology.objectXPathwayProperty> ?pathwayid.
 optional{?pathwayid <PathwayOntology.nameProperty> ?pathwayname.}
 optional{?pathwayid <PathwayOntology.organismProperty> ?pathwayclass.}
 FILTER (regex(?taxonid,%%fname%%)||regex(?pathwayid,%%fname%%)||regex(?pathwayname,%%fname%%)||regex(?pathwayclass,%%fname%%))}
 union{?geneid a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty>  %%taxonid%%;<GeneOntology.objectXPathwayProperty> ?pathwayid.
 optional{?pathwayid <PathwayOntology.nameProperty> ?pathwayname.}
 optional{?pathwayid <PathwayOntology.organismProperty> ?pathwayclass.}
 bind(%%taxonid%% as ?taxonid) 
 FILTER (regex(?taxonid,%%fname%%)||regex(?pathwayid,%%fname%%)||regex(?pathwayname,%%fname%%)||regex(?pathwayclass,%%fname%%))}
 }

 protein

SELECT distinct ?name ?proteinid ?description ?accession ?function ?molecularWeight (count(?go) as ?goCount) (count(?pfam) as ?pfamCount) (count(?pdb) as ?pdbCount) where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
 ?nameId <TaxonomyOntology.taxidProperty> ?taxonid;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.
 ?proteinid a <ProteinOntology.proteinClass>;<ProteinOntology.objectXtaxonProperty> ?taxonid. 
 optional{?proteinid <ProteinOntology.descriptionProperty> ?description.}
 optional{?proteinid <ProteinOntology.accessionProperty> ?accession.}
 optional{?proteinid <ProteinOntology.functionProperty> ?function.}
 optional{?proteinid <ProteinOntology.molecularWeightProperty> ?molecularWeight.}
 optional{?proteinid <ProteinOntology.molecularWeightProperty> ?molecularWeight.}
 optional{?proteinid <ProteinOntology.objectXgoProperty> ?go.}
 optional{?proteinid <ProteinOntology.objectXPdbPropert> ?pdb.}
 optional{?proteinid <ProteinOntology.objectXPfamPropert> ?pfam.}
 FILTER (regex(?name,%%fname%%))}
 union{?nameId <TaxonomyOntology.taxidProperty> %%taxonid%%;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.
 ?proteinid a <ProteinOntology.proteinClass>;<ProteinOntology.objectXtaxonProperty> %%taxonid%%.
 optional{?proteinid <ProteinOntology.descriptionProperty> ?description.}
 optional{?proteinid <ProteinOntology.accessionProperty> ?accession.}
 optional{?proteinid <ProteinOntology.functionProperty> ?function.}
 optional{?proteinid <ProteinOntology.molecularWeightProperty> ?molecularWeight.}
 optional{?proteinid <ProteinOntology.objectXgoProperty> ?go.}
 optional{?proteinid <ProteinOntology.objectXPdbPropert> ?pdb.}
 optional{?proteinid <ProteinOntology.objectXPfamPropert> ?pfam.} 
 FILTER (regex(?name,%%fname%%))} 
}
OFFSET pageStar * pageSize Limit pageSize

SELECT  distinct ?name ?proteinid ?description ?accession ?function ?molecularWeight (count(?go) as ?goCount) (count(?pfam) as ?pfamCount) (count(?pdb) as ?pdbCount) where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
 ?nameId <TaxonomyOntology.taxidProperty> ?taxonid;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.
 ?proteinid a <ProteinOntology.proteinClass>;<ProteinOntology.objectXtaxonProperty> ?taxonid. 
 optional{?proteinid <ProteinOntology.descriptionProperty> ?description.}
 optional{?proteinid <ProteinOntology.accessionProperty> ?accession.}
 optional{?proteinid <ProteinOntology.functionProperty> ?function.}
 optional{?proteinid <ProteinOntology.molecularWeightProperty> ?molecularWeight.}
 optional{?proteinid <ProteinOntology.objectXgoProperty> ?go.}
 optional{?proteinid <ProteinOntology.objectXPdbPropert> ?pdb.}
 optional{?proteinid <ProteinOntology.objectXPfamPropert> ?pfam.}}
 union{?nameId <TaxonomyOntology.taxidProperty> %%taxonid%%;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.
 ?proteinid a <ProteinOntology.proteinClass>;<ProteinOntology.objectXtaxonProperty> %%taxonid%%. 
 optional{?proteinid <ProteinOntology.descriptionProperty> ?description.}
 optional{?proteinid <ProteinOntology.accessionProperty> ?accession.}
 optional{?proteinid <ProteinOntology.functionProperty> ?function.}
 optional{?proteinid <ProteinOntology.molecularWeightProperty> ?molecularWeight.}
 optional{?proteinid <ProteinOntology.objectXgoProperty> ?go.}
 optional{?proteinid <ProteinOntology.objectXPdbPropert> ?pdb.}
 optional{?proteinid <ProteinOntology.objectXPfamPropert> ?pfam.}}
} 
OFFSET pageStar * pageSize Limit pageSize

SELECT (count(?proteinid) as ?num) where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
 ?nameId <TaxonomyOntology.taxidProperty> ?taxonid;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.
 ?proteinid a <ProteinOntology.proteinClass>;<ProteinOntology.objectXtaxonProperty> ?taxonid.
 FILTER (regex(?name,%%fname%%))}
 union{?nameId <TaxonomyOntology.taxidProperty> %%taxonid%%;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.
 ?proteinid a <ProteinOntology.proteinClass>;<ProteinOntology.objectXtaxonProperty> %%taxonid%%.
 FILTER (regex(?name,%%fname%%))}
}

SELECT (count(?proteinid) as ?num) where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
 ?nameId <TaxonomyOntology.taxidProperty> ?taxonid;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.
 ?proteinid a <ProteinOntology.proteinClass>;<ProteinOntology.objectXtaxonProperty> ?taxonid.}
 union{?nameId <TaxonomyOntology.taxidProperty> %%taxonid%%;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.
 ?proteinid a <ProteinOntology.proteinClass>;<ProteinOntology.objectXtaxonProperty> %%taxonid%%.}
}

SELECT (count(distinct ?pdbid) as ?num) where {
?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
{?proteinid a <ProteinOntology.proteinClass>;<ProteinOntology.objectXtaxonProperty> ?taxonid;<ProteinOntology.objectXPdbPropert> ?pdbid.}
union{?proteinid a <ProteinOntology.proteinClass>;<ProteinOntology.objectXtaxonProperty> %%taxonid%%;<ProteinOntology.objectXPdbPropert> ?pdbid.}
}

SELECT (count(distinct ?pfam) as ?num) where {
?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
{?proteinid a <ProteinOntology.proteinClass>;<ProteinOntology.objectXtaxonProperty> ?taxonid;<ProteinOntology.objectXPdbPropert> ?pdbid.}
union{?proteinid a <ProteinOntology.proteinClass>;<ProteinOntology.objectXtaxonProperty> %%taxonid%%;<ProteinOntology.objectXPfamPropert> ?pfam.}
}

taxonomy

SELECT distinct ?name where {
?nameId <TaxonomyOntology.typeProperty> <TaxonomyOntology.nameClass>;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.
FILTER (regex(?name,%%prefix%%,'i'))
}
limit Constant.HINTNAMENUM

SELECT ?taxonId ?name where { 
?taxonId <TaxonomyOntology.parentTaxidProperty> %%taxonid%%.
?nameId <TaxonomyOntology.taxidProperty> ?taxonId;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.
}
ORDER BY ASC(?name)

select ?name ?parentId where {
%%taxonid%% <TaxonomyOntology.parentTaxidProperty> ?parentId.
?nameId <TaxonomyOntology.taxidProperty> ?parentId;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName'; <TaxonomyOntology.taxNameProperty> ?name.
}
limit 1

select ?taxonId where {
?nameId <TaxonomyOntology.taxNameProperty> %%name.trim()%%. 
?nameId <TaxonomyOntology.taxidProperty> ?taxonId.
}
limit 1

SELECT (count(?name) as ?num) where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
 ?nameId <TaxonomyOntology.taxidProperty> ?taxonid;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.}
 union{?nameId <TaxonomyOntology.taxidProperty> <taxonid>;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.}
 FILTER (regex(?name,%%fname%%))
}

SELECT (count(?name) as ?num) where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
 ?nameId <TaxonomyOntology.taxidProperty> ?taxonid;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.}
 union{?nameId <TaxonomyOntology.taxidProperty> %%taxonid%%;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.}
}

SELECT ?taxonid ?name ?rank where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
 ?nameId <TaxonomyOntology.taxidProperty> ?taxonid;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.
 ?taxonid <TaxonomyOntology.rankProperty> ?rank.}
 union{?nameId <TaxonomyOntology.taxidProperty> %%taxonid%%;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.
 %%taxonid%% <TaxonomyOntology.rankProperty> ?rank.
 bind(%%taxonid%% as ?taxonid) }
} 
OFFSET start * pageSize Limit pageSize

SELECT ?taxonid ?name ?rank where {
{?taxonid <TaxonomyOntology.ancestorTaxidProperty> %%taxonid%%.
 ?nameId <TaxonomyOntology.taxidProperty> ?taxonid;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.
 ?taxonid <TaxonomyOntology.rankProperty> ?rank.
 FILTER (regex(?name,%%fname%%)||regex(?rank,%%fname%%)).}
 union{?nameId <TaxonomyOntology.taxidProperty> %%taxonid%%;<TaxonomyOntology.nameClassProperty> 'TaxonomyOntology.scientificName';<TaxonomyOntology.taxNameProperty> ?name.
 %%taxonid%% <TaxonomyOntology.rankProperty> ?rank.
 bind(%%taxonid%% as ?taxonid) 
 FILTER (regex(?name,%%fname%%)).}
} 
OFFSET start * pageSize Limit pageSize

SELECT (count(distinct ?genomeid) as ?num) where {
?genomeid a <GenomeOntoloty.genomeClass>;<GenomeOntoloty.objectXtaxonProperty> %%taxonId%%.
}

SELECT (count(distinct ?geneid) as ?num) where {
?geneid a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty> %%taxonId%%.
}

SELECT (count(distinct ?proteinid) as ?num) where {
?proteinid a <ProteinOntology.proteinClass>;<ProteinOntology.objectXtaxonProperty> %%taxonId%%.
}

SELECT (count(distinct ?pathid) as ?num) where {
?gene a <GeneOntology.geneClass>;<GeneOntology.objectXTaxonProperty> %%taxonId%%;<GeneOntology.objectXPathwayProperty> ?pathid.
}

SELECT(count(distinct ?goid) as ?num) where {
?proteinid a <ProteinOntology.proteinClass>;<ProteinOntology.objectXtaxonProperty> %%taxonId%%;<ProteinOntology.objectXgoProperty> ?goid.
}
