if(!file.exists("zip.test.gz"))
{
  download.file("https://web.stanford.edu/~hastie/ElemStatLearn/datasets/zip.test.gz", "zip.test.gz")
}

data <- data.table::fread("zip.test.gz")

data.matrix <- matrix(unlist(data[,2:ncol(data)]), nrow = nrow(data))

utils::str(data.matrix)
