library(tercen)
library(dplyr)
library(reticulate)

# use virtualenv

# renv::init()
# renv::use_python()
# 
# reticulate:::py_install_method_detect()
# reticulate::py_install("pandas")
# reticulate::py_install("parc", pip = TRUE)
# renv::use_python()
# renv::snapshot()

options("tercen.workflowId" = "968e828a2d8eb509f7ccd060700068fe")
options("tercen.stepId"     = "bd9c55dd-d533-42ff-af36-9c6f10d837db")

getOption("tercen.workflowId")
getOption("tercen.stepId")

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
