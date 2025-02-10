#!/bin/bash -x

#SBATCH --mem=128G
#SBATCH --gres=gpu:rtxa6000:8
#SBATCH --time=3-00:00:00


module load Python3/3.11.2
# activate you virtual environment or conda
source ./.venv/bin/activate
# the next 3 lines install the fastmax library
module load gcc
module load cuda
python linear_attention/setup_fastmax.py install
# your commands
litgpt download EleutherAI/pythia-1.4b
litgpt pretrain pythia-1.4b \
   --config train_regular.yaml  # location of the "train_regular.yaml" file
