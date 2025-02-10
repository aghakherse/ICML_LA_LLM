#!/bin/bash -x
#SBATCH --mem=128G
#SBATCH --gres=gpu:rtxa6000:8
#SBATCH --time=1-00:00:00


module load Python3/3.11.2
# activate you virtual environment or conda
source .venv/bin/activate
# the next 3 lines install the fastmax library
module load gcc
module load cuda
python linear_attention/setup_fastmax.py install
# directory of the last checkpoint
litgpt evaluate out/pretrain/linear_pythia1.4b/final \
  --batch_size 4 \
  --tasks "mmlu" \
  --num_fewshot 0\
  --out_dir evaluate_model_mmlu_1.4b_linear/
