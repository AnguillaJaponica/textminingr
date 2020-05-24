library(RMeCab)
library(dplyr)
library(magrittr)
library(stringr)

sample <- RMeCabFreq("sample.txt")

#改行の削除
sample$Term <- str_remove_all(sample$Term, "\n")

#品詞の抽出（名詞と形容詞のみ）、数字・不要列の削除、出現頻度の集約、降順で並べ替え
sample_r1 <- sample %>% filter(Info1 %in% c("名詞", "形容詞")) %>% filter(Info2 != "数") %>% select(Term, Freq) %>% group_by(Term) %>% summarise(count = sum(Freq)) %>% ungroup() %>% arrange(desc(count))
