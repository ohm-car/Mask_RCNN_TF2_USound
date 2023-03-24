#!/bin/bash

#SBATCH --job-name=imrecon
#SBATCH --mail-user=omkark1@umbc.edu
#SBATCH --mem=32G
#SBATCH --gres=gpu:1
#SBATCH --time=10-12:00:00
#SBATCH --constraint=rtx_6000
#SBATCH --output=/nfs/ada/oates/users/omkark1/ArteryProj/Mask_RCNN_TF2_USound/outfiles/r50_run_1.out
#SBATCH --error=/nfs/ada/oates/users/omkark1/ArteryProj/Mask_RCNN_TF2_USound/outfiles/r50_run_1.err


export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/

source activate mrcnn2

python python train_artery_all.py train --weights=imagenet --dataset='../../../data/Img_All_Squared/' --logs='/nfs/ada/oates/users/omkark1/ArteryProj/checkpointsR50'
