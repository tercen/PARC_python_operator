library(tercen)
library(dplyr)
library(reticulate)

reticulate::source_python("main.py")

df <- (ctx <- tercenCtx()) %>%
  select() %>% run_py_script()

df %>%
  ctx$addNamespace() %>%
  ctx$save()
