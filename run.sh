fairseq-interactive --path checkpoints/fconv_period/checkpoint_best.pt data-bin/period \
    --beam 5 --source-lang src --target-lang tgt --tokenizer space --bpe subword_nmt \
    --bpe-codes period/period.code --nbest 1

# fairseq-interactive --path checkpoints/fconv_period/checkpoint_best.pt data-bin/period  \
#     --source-lang src --target-lang tgt --tokenizer space \
#     --bpe subword_nmt --bpe-codes period/period.code  \
#     --beam 5 --diverse-beam-strength 0.5 --diverse-beam-groups 5 \
#     --no-repeat-ngram-size 2 --prefix-size 5 --lenpen 3 --nbest 5