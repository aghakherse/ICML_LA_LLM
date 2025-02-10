#!/bin/bash -x
#SBATCH --mem=128G
#SBATCH --gres=gpu:rtxa6000:1
#SBATCH --time=1-00:00:00


module load Python3/3.11.2
# activate you virtual environment or conda
source .venv/bin/activate
# directory of the last checkpoint
litgpt evaluate out/pretrain/regular_pythia1.4b/final \
  --batch_size 4 \
  --tasks "mmlu" \ # choose the benchmark
  --num_fewshot 0\
  --out_dir evaluate_model_mmlu_1.4b_regular/
