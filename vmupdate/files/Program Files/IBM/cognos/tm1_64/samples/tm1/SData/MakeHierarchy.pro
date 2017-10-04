601,100
602,"MakeHierarchy"
562,"CHARACTERDELIMITED"
586,"C:\Program Files\IBM\cognos\tm1_64\samples\tm1\SData\Cities2.csv"
585,"C:\Program Files\IBM\cognos\tm1_64\samples\tm1\SData\Cities2.csv"
564,
565,"ykGBS1ASKgdO0xq\pRB_q8pGXawDg2dLpB8`Xt06Q876l@;_^>tKfyTF1[rQckEXtZ\[Zz`m>`dK[jvIMb3@Y^rAh2rq]qgaE^t]WvX>^G__]v;@]?2ch<C^`NcUjH>p2t7_yPjaVrZ5BXUpzPb=YkVO:M;?gi>YulGcx8oZkA1A1[MJ>C`YNE<h18xRiGMqj^MhMAEJ"
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
572,12

#****Begin: Generated Statements***
#****End: Generated Statements****

if ( HierarchyExists( 'Cities', 'NorthSouth' ) > 0 );
  HierarchyDestroy( 'Cities', 'NorthSouth' );
endif;

HierarchyCreate( 'Cities', 'NorthSouth' );

HierarchySortOrder( 'Cities', 'NorthSouth', 'BYNAME', 'ASCENDING', 'BYHIERARCHY', '' );

573,19

#****Begin: Generated Statements***
#****End: Generated Statements****

# insert leaf
# Note that by default, even though hierarchies share leaf elements, hierarchies don't have
# any elements unless you insert them.
HierarchyElementInsert( 'Cities', 'NorthSouth', '',V1, 'n' );

# insert consolidations
HierarchyElementInsert( 'Cities', 'NorthSouth', '', V2, 'c' );
HierarchyElementInsert( 'Cities', 'NorthSouth', '', V3, 'c' );
HierarchyElementInsert( 'Cities', 'NorthSouth', '', V4, 'c' );

# connect components
HierarchyElementComponentAdd( 'Cities', 'NorthSouth', V2, V1, 1.000000 );
HierarchyElementComponentAdd( 'Cities', 'NorthSouth', V3, V2, 1.000000 );
HierarchyElementComponentAdd( 'Cities', 'NorthSouth', V4, V3, 1.000000 );

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
