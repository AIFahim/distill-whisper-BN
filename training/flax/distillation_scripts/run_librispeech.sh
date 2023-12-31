#!/usr/bin/env bash

TCMALLOC_LARGE_ALLOC_REPORT_THRESHOLD=10000000000 python run_distillation.py \
  --model_name_or_path "distil-whisper/large-32-2" \
  --teacher_model_name_or_path "openai/whisper-large-v2" \
  --dataset_name "distil-whisper/librispeech_asr" \
  --dataset_config_name "all" \
  --train_split_name "train.clean.100+train.clean.360+train.other.500" \
  --eval_split_name "validation.clean" \
  --text_column_name "whisper_transcript" \
  --cache_dir "/home/sanchitgandhi/cache" \
  --dataset_cache_dir "/home/sanchitgandhi/cache" \
  --output_dir "./" \
  --wandb_name "large-32-2-ts-librispeech" \
  --wandb_dir "/home/sanchitgandhi/.cache" \
  --wandb_project "distil-whisper-librispeech" \
  --per_device_train_batch_size 32 \
  --per_device_eval_batch_size 16 \
  --dtype "bfloat16" \
  --learning_rate 1e-4 \
  --warmup_steps 500 \
  --temperature 2.0 \
  --do_train \
  --do_eval \
  --num_train_epochs 10 \
  --preprocessing_num_workers 16 \
  --dataloader_num_workers 8 \
  --logging_steps 25 \
  --use_scan \
  --gradient_checkpointing \
  --overwrite_output_dir \
  --predict_with_generate \
  --push_to_hub
