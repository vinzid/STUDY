output_dir=output

python merge_peft_adapters.py \
        --base_model_name_or_path ../glm \
        --peft_model_path $output_dir/Epoch_1/  \
        --push_to_hub \
