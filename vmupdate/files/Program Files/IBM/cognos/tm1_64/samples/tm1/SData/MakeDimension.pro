601,100
602,"MakeDimension"
562,"CHARACTERDELIMITED"
586,"C:\Program Files\IBM\cognos\tm1_64\samples\tm1\SData\Cities.csv"
585,"C:\Program Files\IBM\cognos\tm1_64\samples\tm1\SData\Cities.csv"
564,
565,"fx5SVGa_WLE5ua4sV_G>UqxPn0q2n1@_V3Ap;J\A`\7hu=syUU3;RRml7v]>8A]W[HzblfC55pEb1Od4LVDY`DkNNF2Ogk0G^vB`dbG8SqnWiC6Ld60VEq8SL3XVo^;41i@<lzO5_@h<Z2dG8EP5x97BZF>BVtEUHKzQf]r]VRLh^d]q0Vb<Dk61B<y`7jrM^q<[w`Lb"
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
589,","
568,""""
570,
571,
569,0
592,0
599,1000
560,0
561,0
590,0
637,0
577,4
V1
V2
V3
V4
578,4
2
2
2
2
579,4
1
2
3
4
580,4
0
0
0
0
581,4
0
0
0
0
582,4
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
VarType=32ColType=827
603,0
572,19

#****Begin: Generated Statements***
#****End: Generated Statements****

if (DimensionExists( 'Cities' ) > 0);
  DimensionDestroy( 'Cities' );
endif;

DimensionCreate( 'Cities' );

# In a world with alternate hierarchies one things of a dimension of a collection of dimensions and that
# the next thing to do would be to create the first hierarchy. However TI, for old times sake supposedly,
# implicitly creates that 'same named' hierarchy already so we don't have to explicitly create it. Had we
# wanted a different name for the first hierarchy, which one typically would but which we'll refrain from
# here because Architect, at it's core is oblivious to hierarchies, can only show the same named one.
#HierarchyCreate( 'Cities', 'Cities' );

HierarchySortOrder( 'Cities', 'Cities', 'BYNAME', 'ASCENDING', 'BYHIERARCHY', '' );

573,18

#****Begin: Generated Statements***
#****End: Generated Statements****


# insert leaf element
HierarchyElementInsert( 'Cities', 'Cities', '', V1, 'n' );

# insert consolidations
HierarchyElementInsert( 'Cities', 'Cities', '', V2, 'c' );
HierarchyElementInsert( 'Cities', 'Cities', '', V3, 'c' );
HierarchyElementInsert( 'Cities', 'Cities', '', V4, 'c' );

# connect components
HierarchyElementComponentAdd( 'Cities', 'Cities', V2, V1, 1.000000 );
HierarchyElementComponentAdd( 'Cities', 'Cities', V3, V2, 1.000000 );
HierarchyElementComponentAdd( 'Cities', 'Cities', V4, V3, 1.000000 );

574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,6

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
