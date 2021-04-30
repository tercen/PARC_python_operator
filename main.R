library(tercen)
library(dplyr)
library(reticulate)

reticulate::source_python("main.py")

ctx = tercenCtx()
ctx %>%
  as.matrix(fill = 0) %>%
  t() %>%
  run_py_script() %>% 
  unlist

df <- data.frame(
  cluster = labs + 1,
  .ci = 0:(length(labs) - 1)
)

df %>%
  ctx$addNamespace() %>%
  ctx$save()
