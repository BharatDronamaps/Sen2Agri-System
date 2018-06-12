#!/bin/bash

source set_build_folder.sh

./CropType.py -ref /mnt/Sen2Agri_DataSets/In-Situ_TDS/France/LC/SudmipyS2A_LandCoverDecoupe_dissolvedGeometry.shp -ratio 0.75 -input \
/mnt/Satellite_Imagery/S2-QR/CSudmipy-O-for-crop_LEVEL2A/SPOT4_HRVIR_XS_20130216_N2A_CSudmipy-OD0000B0000/SPOT4_HRVIR_XS_20130216_N2A_CSudmipy-OD0000B0000.xml \
/mnt/Satellite_Imagery/S2-QR/CSudmipy-O-for-crop_LEVEL2A/SPOT4_HRVIR_XS_20130303_N2A_CSudmipy-OD0000B0000/SPOT4_HRVIR_XS_20130303_N2A_CSudmipy-OD0000B0000.xml \
/mnt/Satellite_Imagery/S2-QR/CSudmipy-O-for-crop_LEVEL2A/SPOT4_HRVIR_XS_20130318_N2A_CSudmipy-OD0000B0000/SPOT4_HRVIR_XS_20130318_N2A_CSudmipy-OD0000B0000.xml \
/mnt/Satellite_Imagery/S2-QR/CSudmipy-O-for-crop_LEVEL2A/SPOT4_HRVIR_XS_20130323_N2A_CSudmipy-OD0000B0000/SPOT4_HRVIR_XS_20130323_N2A_CSudmipy-OD0000B0000.xml \
/mnt/Satellite_Imagery/S2-QR/CSudmipy-O-for-crop_LEVEL2A/SPOT4_HRVIR_XS_20130412_N2A_CSudmipy-OD0000B0000/SPOT4_HRVIR_XS_20130412_N2A_CSudmipy-OD0000B0000.xml \
/mnt/Satellite_Imagery/S2-QR/CSudmipy-O-for-crop_LEVEL2A/SPOT4_HRVIR_XS_20130417_N2A_CSudmipy-OD0000B0000/SPOT4_HRVIR_XS_20130417_N2A_CSudmipy-OD0000B0000.xml \
/mnt/Satellite_Imagery/S2-QR/CSudmipy-O-for-crop_LEVEL2A/SPOT4_HRVIR_XS_20130422_N2A_CSudmipy-OD0000B0000/SPOT4_HRVIR_XS_20130422_N2A_CSudmipy-OD0000B0000.xml \
/mnt/Satellite_Imagery/S2-QR/CSudmipy-O-for-crop_LEVEL2A/SPOT4_HRVIR_XS_20130517_N2A_CSudmipy-OD0000B0000/SPOT4_HRVIR_XS_20130517_N2A_CSudmipy-OD0000B0000.xml \
/mnt/Satellite_Imagery/S2-QR/CSudmipy-O-for-crop_LEVEL2A/SPOT4_HRVIR_XS_20130527_N2A_CSudmipy-OD0000B0000/SPOT4_HRVIR_XS_20130527_N2A_CSudmipy-OD0000B0000.xml \
/mnt/Satellite_Imagery/S2-QR/CSudmipy-O-for-crop_LEVEL2A/SPOT4_HRVIR_XS_20130606_N2A_CSudmipy-OD0000B0000/SPOT4_HRVIR_XS_20130606_N2A_CSudmipy-OD0000B0000.xml \
/mnt/Satellite_Imagery/S2-QR/CSudmipy-O-for-crop_LEVEL2A/SPOT4_HRVIR_XS_20130611_N2A_CSudmipy-OD0000B0000/SPOT4_HRVIR_XS_20130611_N2A_CSudmipy-OD0000B0000.xml \
/mnt/Satellite_Imagery/S2-QR/CSudmipy-O-for-crop_LEVEL2A/SPOT4_HRVIR_XS_20130616_N2A_CSudmipy-OD0000B0000/SPOT4_HRVIR_XS_20130616_N2A_CSudmipy-OD0000B0000.xml \
-t0 20130216 -tend 20130616 -rate 5 -radius 100 -classifier rf -rseed 0 -mask /mnt/data/QR_scripts/CropMask_CSudmipy_O/crop_mask.tif -pixsize 20 \
-outdir "/mnt/data/QR_Results/CropType_CSudmipy_O/" -buildfolder $BUILD_FOLDER