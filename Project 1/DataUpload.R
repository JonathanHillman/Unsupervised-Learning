#check if file exists. If not, download it.
if(!file.exists("zip.test.gz"))
{
  download.file("https://web.stanford.edu/~hastie/ElemStatLearn/datasets/zip.test.gz", "zip.test.gz")
}

#read the data from the local file
data <- data.table::fread("zip.test.gz")

#convert that data to a matrix format, ignore the first column of data, which is the target variable
data.matrix <- matrix(unlist(data[,2:ncol(data)]), nrow = nrow(data))

#display structure of the data matrix
utils::str(data.matrix)
