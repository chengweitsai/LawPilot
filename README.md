# LawPilot

```bash
.
├── README.md
├── data-bin
│   └── period －> 經過fairseq-preprocess 預處理好的, 二進位的資料
│
├── checkpoints
│   └── fconv_period （模型取名）
│       └── checkpoint_best.pt -> 目前訓練好的模型
│
├── period -> 純文字的檔的資料，處理的script 不在這個folder裡
│   ├── period.code
│   ├── readme.md
│   ├── te_bpe.src
│   ├── te_bpe.tgt
│   ├── tr_bpe.src
│   ├── tr_bpe.tgt
│   ├── va_bpe.src
│   └── va_bpe.tgt
├── requirements.txt
└── run.sh
```



基本上只要 安裝好寫在 reuqirements.txt 的兩個pacakge 後
就可以

```bash
bash run.sh
```

接著互動式的輸入句子



# run.sh

```bash
fairseq-interactive --path checkpoints/fconv_period/checkpoint_best.pt data-bin/period \
    --beam 5 --source-lang src --target-lang tgt --tokenizer space --bpe subword_nmt \
    --bpe-codes period/period.code --nbest 1
```

會產生一個回應

```bash
fairseq-interactive --path checkpoints/fconv_period/checkpoint_best.pt data-bin/period  \
    --source-lang src --target-lang tgt --tokenizer space \
    --bpe subword_nmt --bpe-codes period/period.code  \
    --beam 5 --diverse-beam-strength 0.5 --diverse-beam-groups 5 \
    --no-repeat-ngram-size 2 --prefix-size 5 --lenpen 3 --nbest 5
```

會產生5個回應

參數可以參考：https://fairseq.readthedocs.io/en/latest/command_line_tools.html?highlight=fconv_self_att#fairseq-interactive



# 可嘗試的句子

因為上面tokenizer 我是用space, 所以要先透過其他方式斷詞 (要用耘志之前寫的另一份中文斷詞script)

手動輸入的話 暫時用人工斷詞



自 起訴 狀 繕本 送達 翌日 起 至 清償 日 止

上訴人 辯稱 ： 該 僱傭 關係 業經 被上訴人 終止 云云 ， 已 無 可取

雇主 可以 資遣 勞工 但 應 預告 並 發給 資遣 費 之 情形

約定 試用 期間 之 目的 ， 既 在 於 試驗 、 審查 勞工 是 否 具備 勝任 工作 之 能力

基於 保護 勞工 之 立場 
