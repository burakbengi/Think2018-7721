601,100
602,"CreateTwoAttHierarchy"
562,"VIEW"
586,"}ElementAttributes_region"
585,"}ElementAttributes_region"
564,
565,"ywmQ5CX:Gr2ffozR@4qv\Hj`EaXweOqaZDkk;tXjtjT6`d<BySJ<;R1QHvX7<8MSVUwESRn`0V<Q;Fuvm3J`O?b6Xlu^yP8dZm?zTvda_vDoL\UXunGH=tW]@=Ae2m:I^Sxhni@EPWUFHa\Ko:TKZKKfrzjiO6Z7B8Pq:<41Id2m3B]BL3Z;hM?m[nY=r`@rqUagT4A2"
559,1
928,0
593,
594,
595,
597,
598,
596,
800,
801,
566,0
567,","
588,"."
589,
568,""""
570,Imports2015
571,
569,0
592,0
599,1000
560,0
561,0
590,0
637,0
577,6
region
Imports2015
Imports2015_Top
NVALUE
SVALUE
VALUE_IS_STRING
578,6
2
2
2
1
2
1
579,6
1
2
3
0
0
0
580,6
0
0
0
0
0
0
581,6
0
0
0
0
0
0
582,3
VarType=32ColType=825VarDimension=regionVarDimAction=As IsVarElemType=NumericVarDimElemSortType=BYINPUTVarDimElemSortSense=ASCENDING
VarType=32ColType=825VarDimension=}ElementAttributes_regionVarDimAction=As IsVarElemType=StringVarDimElemSortType=BYINPUTVarDimElemSortSense=ASCENDING
VarType=32ColType=825VarDimension=}ElementAttributes_regionVarDimAction=As IsVarElemType=StringVarDimElemSortType=BYINPUTVarDimElemSortSense=ASCENDING
603,3
VarDimActionCode=53VarElemTypeCode=33UIDataIndex=0
VarDimActionCode=53VarElemTypeCode=32UIDataIndex=1
VarDimActionCode=53VarElemTypeCode=32UIDataIndex=2
572,14

#****Begin: Generated Statements***
#****End: Generated Statements****

if (HierarchyExists( 'region', 'Imports2015' ) > 0);
  HierarchyDestroy( 'region', 'Imports2015' );
endif;

HierarchyCreate( 'region', 'Imports2015' );
HierarchyElementInsert( 'region', 'Imports2015', '', 'All Imports2015', 'c' );

HierarchySortOrder( 'region', 'Imports2015', 'BYNAME', 'ASCENDING', 'BYHIERARCHY', '' );


573,19

#****Begin: Generated Statements***
#****End: Generated Statements****

# insert leaf
HierarchyElementInsert( 'region', 'Imports2015', '', region, 'n' );

# insert consolidations
Imports2015 = AttrS( 'region', region, 'Imports2015' );
Imports2015_Top = AttrS( 'region', region, 'Imports2015_Top' );
HierarchyElementInsert( 'region', 'Imports2015', '', Imports2015, 'c' );
HierarchyElementInsert( 'region', 'Imports2015', '', Imports2015_Top, 'c' );

# add edges
HierarchyElementComponentAdd( 'region', 'Imports2015', Imports2015, region, 1.0 );
HierarchyElementComponentAdd( 'region', 'Imports2015', Imports2015_Top, Imports2015, 1.0 );
HierarchyElementComponentAdd( 'region', 'Imports2015', 'All Imports2015', Imports2015_Top, 1.0 );


574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,3

#****Begin: Generated Statements***
#****End: Generated Statements****
576,CubeAction=1511DataAction=1503CubeLogChanges=0
930,0
638,1
804,0
1217,0
900,
901,
902,
938,0
937,
936,
935,
934,
932,0
933,0
903,
906,
929,
907,
908,
904,0
905,0
909,0
911,
912,
913,
914,
915,
916,
917,0
918,1
919,0
920,50000
921,""
922,""
923,0
924,""
925,""
926,""
927,""
