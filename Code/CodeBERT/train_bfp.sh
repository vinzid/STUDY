# data_dir=/SS970evo/datasets/VulRepair_dataset/preprocess/mark2
# output_dir=/SS970evo/datasets/VulRepair_dataset/result_CodeBERT/mark2/model_set1
size=${1:-50}
code_rep=${2:-mark2_src}
data_dir=/SS970evo/datasets/Tufano_dataset/datasets/preprocess/$size/$code_rep
output_dir=/SS970evo/datasets/Tufano_dataset/result_CodeBERT/$size/$code_rep/model_set1

mkdir -p $output_dir

python run.py \
        --do_train \
        --do_eval \
        --model_type roberta \
        --model_name_or_path microsoft/codebert-base \
        --train_filename $data_dir/src-train.txt,$data_dir/tgt-train.txt \
        --dev_filename $data_dir/src-val.txt,$data_dir/tgt-val.txt \
        --output_dir $output_dir \
        --max_source_length 512 \
        --max_target_length 256 \
        --beam_size 5 \
        --train_batch_size 8 \
        --eval_batch_size 8 \
        --learning_rate 5e-5 \
        --num_train_epochs 30 \
        2>&1 | tee $output_dir/train.log
