#!/bin/bash
./sen2agri-ctl.py submit-job -s Ukraine composite -i \
/mnt/Sen2Agri_DataSets/L2A/Spot4-T5/Ukraine/SPOT4_HRVIR1_XS_20130318_N2A_EUkraineD0000B0000/ \
/mnt/Sen2Agri_DataSets/L2A/Spot4-T5/Ukraine/SPOT4_HRVIR1_XS_20130402_N2A_EUkraineD0000B0000/ \
--resolution 20 --synthesis-date 20130328 --half-synthesis 25 -p processor.l3a.synthesis_date 20130328 \
-p processor.l3a.half_synthesis 25 -p processor.l3a.bandsmapping /home/cudroiu/sen2agri/sen2agri-processors/Composite/TestScripts/bands_mapping_spot.txt


#/mnt/Sen2Agri_DataSets/L2A/Spot4-T5/Ukraine/SPOT4_HRVIR1_XS_20130412_N2A_EUkraineD0000B0000/ \
#/mnt/Sen2Agri_DataSets/L2A/Spot4-T5/Ukraine/SPOT4_HRVIR1_XS_20130417_N2A_EUkraineD0000B0000/ \
#/mnt/Sen2Agri_DataSets/L2A/Spot4-T5/Ukraine/SPOT4_HRVIR1_XS_20130422_N2A_EUkraineD0000B0000/ \
