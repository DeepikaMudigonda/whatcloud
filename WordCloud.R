library(tm)
library(wordcloud)
dirPath<-"C:/Users/Deepika/Desktop/wordcloud/"
txt<-Corpus(DirSource(dirPath))
toSpace <- content_transformer(function(x, pattern) gsub(pattern, " ", x))
txt <- tm_map(txt, content_transformer(tolower))
txt<- tm_map(txt, toSpace, "[^a-zA-Z]")
rmv<-c("griet","mudigonda","media","omitted","haa","haaa","haaaa")
txt<-tm_map(txt,removeWords,rmv)

dtm<-TermDocumentMatrix(txt)
mtx<-as.matrix(dtm)
smtx<-sort(rowSums(mtx),decreasing=TRUE)

frm<-data.frame(word=names(smtx),freq=smtx)
head(frm,100)
wordcloud(frm$word,frm$freq,rot.per = .2,min.freq = 1,max.words = 300,random.color = TRUE,colors = brewer.pal(8,"Dark2"),random.order = FALSE)


