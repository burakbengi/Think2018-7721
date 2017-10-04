601,100
602,"CreateRegionAtts"
562,"CHARACTERDELIMITED"
586,"C:\Program Files\IBM\cognos\tm1_64\samples\tm1\SData\Countries.csv"
585,"C:\Program Files\IBM\cognos\tm1_64\samples\tm1\SData\Countries.csv"
564,
565,"qOORqtGjsoq^qkD4vaV0=Qhrwm;GDXkEep;ivb^@g4GNeKIp>t\AY\Cxu58MZ=d2s<Rzpg;5dPg7I4xZhhLOmcC3<h<B5HCbkNZzjJ9quX:nXNW5x0ADLLdKZ:EChDNL0X2];OBbO<w_u8ig89v@lW9HF:HCS8fSZ>plPVVfrV@VR8yL1U33Q=DGCwlfBIiTB5@hUZFL"
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
577,3
Country
Imports2015
Imports2015_Top
578,3
2
2
2
579,3
1
2
3
580,3
0
0
0
581,3
0
0
0
582,3
VarType=32ColType=825VarDimension=regionVarDimAction=As IsVarElemType=NumericVarDimElemSortType=BYINPUTVarDimElemSortSense=ASCENDING
VarType=32ColType=841AttributeDim=regionAttributeElemVar=CountryAttributeAction=CreateAttributeName=Imports2015AttributeType=Text
VarType=32ColType=841AttributeDim=regionAttributeElemVar=CountryAttributeAction=CreateAttributeName=Imports2015_TopAttributeType=Text
603,3
VarDimActionCode=53VarElemTypeCode=33UIDataIndex=0
AttributeActionCode=50AttributeTypeCode=25UIDataIndex=1
AttributeActionCode=50AttributeTypeCode=25UIDataIndex=2
572,8

#****Begin: Generated Statements***
ATTRDELETE('region','Imports2015');
ATTRINSERT('region','','Imports2015','S');
ATTRDELETE('region','Imports2015_Top');
ATTRINSERT('region','','Imports2015_Top','S');
#****End: Generated Statements****

573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,7

#****Begin: Generated Statements***
ATTRPUTS(Imports2015,'region',Country,'Imports2015');
ATTRPUTS(Imports2015_Top,'region',Country,'Imports2015_Top');
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
