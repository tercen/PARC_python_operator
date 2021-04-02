library(tercen)
library(dplyr)
library(reticulate)

reticulate::source_python("main.py")

labs <- (ctx = tercenCtx()) %>%
  as.matrix(fill = 0) %>%
  run_py_script() %>% 
  unlist

df <- data.frame(
  cluster = labs + 1,
  .ci = 0:(length(labs) - 1)
)

df %>%
  ctx$addNamespace() %>%
  ctx$save()
