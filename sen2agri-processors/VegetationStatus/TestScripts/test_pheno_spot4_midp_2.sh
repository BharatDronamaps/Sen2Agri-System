#! /bin/bash

if [ $# -lt 1 ]
then
  echo "Usage: $0 <folder name>"
  echo "The output directory should be given" 1>&2  
  exit
fi

function try {
    echo
    echo
    echo "$@"
    "$@"
    code=$?
    if [ $code -ne 0 ]
    then
        echo "$1 did not work: exit status $code"
        exit 1
    fi
}

#USER modif
#add directories where SPOT products are to be found
inputXML[0]='/mnt/Imagery_S2A/L2A/Spot4-T5/CSudmipy-E_LEVEL2A/SPOT4_HRVIR1_XS_20130217_N2A_CSudmipy-ED0000B0000/SPOT4_HRVIR1_XS_20130217_N2A_CSudmipy-ED0000B0000.xml'
inputXML[1]='/mnt/Imagery_S2A/L2A/Spot4-T5/CSudmipy-E_LEVEL2A/SPOT4_HRVIR1_XS_20130222_N2A_CSudmipy-ED0000B0000/SPOT4_HRVIR1_XS_20130222_N2A_CSudmipy-ED0000B0000.xml'
inputXML[2]='/mnt/Imagery_S2A/L2A/Spot4-T5/CSudmipy-E_LEVEL2A/SPOT4_HRVIR1_XS_20130227_N2A_CSudmipy-ED0000B0000/SPOT4_HRVIR1_XS_20130227_N2A_CSudmipy-ED0000B0000.xml'
inputXML[3]='/mnt/Imagery_S2A/L2A/Spot4-T5/CSudmipy-E_LEVEL2A/SPOT4_HRVIR1_XS_20130304_N2A_CSudmipy-ED0000B0000/SPOT4_HRVIR1_XS_20130304_N2A_CSudmipy-ED0000B0000.xml'
inputXML[4]='/mnt/Imagery_S2A/L2A/Spot4-T5/CSudmipy-E_LEVEL2A/SPOT4_HRVIR1_XS_20130319_N2A_CSudmipy-ED0000B0000/SPOT4_HRVIR1_XS_20130319_N2A_CSudmipy-ED0000B0000.xml'
inputXML[5]='/mnt/Imagery_S2A/L2A/Spot4-T5/CSudmipy-E_LEVEL2A/SPOT4_HRVIR1_XS_20130324_N2A_CSudmipy-ED0000B0000/SPOT4_HRVIR1_XS_20130324_N2A_CSudmipy-ED0000B0000.xml'
inputXML[6]='/mnt/Imagery_S2A/L2A/Spot4-T5/CSudmipy-E_LEVEL2A/SPOT4_HRVIR1_XS_20130329_N2A_CSudmipy-ED0000B0000/SPOT4_HRVIR1_XS_20130329_N2A_CSudmipy-ED0000B0000.xml'
inputXML[7]='/mnt/Imagery_S2A/L2A/Spot4-T5/CSudmipy-E_LEVEL2A/SPOT4_HRVIR1_XS_20130403_N2A_CSudmipy-ED0000B0000/SPOT4_HRVIR1_XS_20130403_N2A_CSudmipy-ED0000B0000.xml'
inputXML[8]='/mnt/Imagery_S2A/L2A/Spot4-T5/CSudmipy-E_LEVEL2A/SPOT4_HRVIR1_XS_20130413_N2A_CSudmipy-ED0000B0000/SPOT4_HRVIR1_XS_20130413_N2A_CSudmipy-ED0000B0000.xml'
inputXML[9]='/mnt/Imagery_S2A/L2A/Spot4-T5/CSudmipy-E_LEVEL2A/SPOT4_HRVIR1_XS_20130418_N2A_CSudmipy-ED0000B0000/SPOT4_HRVIR1_XS_20130418_N2A_CSudmipy-ED0000B0000.xml'
inputXML[10]='/mnt/Imagery_S2A/L2A/Spot4-T5/CSudmipy-E_LEVEL2A/SPOT4_HRVIR1_XS_20130423_N2A_CSudmipy-ED0000B0000/SPOT4_HRVIR1_XS_20130423_N2A_CSudmipy-ED0000B0000.xml'
inputXML[11]='/mnt/Imagery_S2A/L2A/Spot4-T5/CSudmipy-E_LEVEL2A/SPOT4_HRVIR1_XS_20130503_N2A_CSudmipy-ED0000B0000/SPOT4_HRVIR1_XS_20130503_N2A_CSudmipy-ED0000B0000.xml'
inputXML[12]='/mnt/Imagery_S2A/L2A/Spot4-T5/CSudmipy-E_LEVEL2A/SPOT4_HRVIR1_XS_20130513_N2A_CSudmipy-ED0000B0000/SPOT4_HRVIR1_XS_20130513_N2A_CSudmipy-ED0000B0000.xml'
inputXML[13]='/mnt/Imagery_S2A/L2A/Spot4-T5/CSudmipy-E_LEVEL2A/SPOT4_HRVIR1_XS_20130518_N2A_CSudmipy-ED0000B0000/SPOT4_HRVIR1_XS_20130518_N2A_CSudmipy-ED0000B0000.xml'
inputXML[14]='/mnt/Imagery_S2A/L2A/Spot4-T5/CSudmipy-E_LEVEL2A/SPOT4_HRVIR1_XS_20130523_N2A_CSudmipy-ED0000B0000/SPOT4_HRVIR1_XS_20130523_N2A_CSudmipy-ED0000B0000.xml'
inputXML[15]='/mnt/Imagery_S2A/L2A/Spot4-T5/CSudmipy-E_LEVEL2A/SPOT4_HRVIR1_XS_20130602_N2A_CSudmipy-ED0000B0000/SPOT4_HRVIR1_XS_20130602_N2A_CSudmipy-ED0000B0000.xml'
inputXML[16]='/mnt/Imagery_S2A/L2A/Spot4-T5/CSudmipy-E_LEVEL2A/SPOT4_HRVIR1_XS_20130607_N2A_CSudmipy-ED0000B0000/SPOT4_HRVIR1_XS_20130607_N2A_CSudmipy-ED0000B0000.xml'
inputXML[17]='/mnt/Imagery_S2A/L2A/Spot4-T5/CSudmipy-E_LEVEL2A/SPOT4_HRVIR1_XS_20130612_N2A_CSudmipy-ED0000B0000/SPOT4_HRVIR1_XS_20130612_N2A_CSudmipy-ED0000B0000.xml'
inputXML[18]='/mnt/Imagery_S2A/L2A/Spot4-T5/CSudmipy-E_LEVEL2A/SPOT4_HRVIR1_XS_20130617_N2A_CSudmipy-ED0000B0000/SPOT4_HRVIR1_XS_20130617_N2A_CSudmipy-ED0000B0000.xml'
#end of USER modif

#RESOLUTION=$1
OUT_FOLDER=$1

CROPTTYPE_OTB_LIBS_ROOT="~/sen2agri-processors-build/CropType"
VEGETATIONSTATUS_OTB_LIBS_ROOT="~/sen2agri-processors-build/VegetationStatus/phenotb/src/Applications/"
OUT_BANDS="$OUT_FOLDER/spot_bands.TIF"
OUT_MASKS="$OUT_FOLDER/spot_masks.TIF"
OUT_DATES="$OUT_FOLDER/spot_dates.txt"
OUT_SHAPE="$OUT_FOLDER/spot_shapes.shp"
OUT_NDVI="$OUT_FOLDER/spot_ndvi.TIF"
OUT_SIGMO="$OUT_FOLDER/spot_sigmo.TIF"
OUT_METRIC="$OUT_FOLDER/metric_estimation.TIF?&gdal:co:COMPRESS=DEFLATE"

MY_PWD=`pwd`

echo "Executing from $MY_PWD"

i=0
TIME_SERIES_XMLS=""
for xml in "${inputXML[@]}"
do

TIME_SERIES_XMLS+=$xml
TIME_SERIES_XMLS+=" "

done
echo "time_series = $TIME_SERIES_XMLS"
try otbcli BandsExtractor $CROPTTYPE_OTB_LIBS_ROOT/BandsExtractor/ -il $TIME_SERIES_XMLS -out $OUT_BANDS -allmasks $OUT_MASKS -outdate $OUT_DATES
try otbcli FeatureExtraction $CROPTTYPE_OTB_LIBS_ROOT/FeatureExtraction -rtocr $OUT_BANDS -ndvi $OUT_NDVI
try otbcli SigmoFitting $VEGETATIONSTATUS_OTB_LIBS_ROOT -in $OUT_NDVI -mask $OUT_MASKS -dates $OUT_DATES -out $OUT_SIGMO
try otbcli MetricsEstimation $VEGETATIONSTATUS_OTB_LIBS_ROOT -ipf $OUT_SIGMO -indates $OUT_DATES -opf $OUT_METRIC

rm -fr $OUT_MASKS $OUT_BANDS $OUT_DATES $OUT_NDVI $OUT_SIGMO
