#!/bin/bash
#SBATCH --job-name=roberta_hyperparameter_search
#SBATCH --open-mode=append
#SBATCH --output=/scratch/wz2164/%j_%x.out
#SBATCH --error=/scratch/wz2164/%j_%x.err
#SBATCH --export=ALL
#SBATCH --account=ds_ga_1012_2022sp
#SBATCH --partition=n1s8-t4-1
#SBATCH --time=04:00:00
#SBATCH --gres=gpu:1
#SBATCH --mem=20G
#SBATCH -c 4

## TODO: Run your hyperparameter search in a singularity container. Remember to 
## activate your Conda environment in the container before running your Python script.
singularity exec --nv --bind /scratch/wz2164/ --overlay /scratch/wz2164/overlay-25GB-500K.ext3:rw /scratch/wz2164/cuda11.4.2-cudnn8.2.4-devel-ubuntu20.04.3.sif /bin/bash
cd /ext3/
source /ext3/env.sh
conda activate
python /scratch/wz2164/run_hyperparameter_search.py /scratch/wz2164/BoolQ