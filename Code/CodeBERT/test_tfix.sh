data_dir=/SS970evo/datasets/TFix_dataset/mark2
output_dir=/SS970evo/datasets/TFix_dataset/result_CodeBERT/mark2_src/model_set2
test_model_type=${1:-best-bleu}

mkdir -p $output_dir

python run.py \
        --do_test \
        --model_type roberta \
        --model_name_or_path microsoft/codebert-base \
        --load_model_path $output_dir/checkpoint-$test_model_type/pytorch_model.bin \
        --test_filename $data_dir/src-test.txt,$data_dir/tgt-test.txt \
        --output_dir $output_dir \
        --max_source_length 512 \
        --max_target_length 128 \
        --beam_size 5 \
        --eval_batch_size 8 \
        --learning_rate 2e-5 \
        2>&1 | tee $output_dir/test_$test_model_type.log