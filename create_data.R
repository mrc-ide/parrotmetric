stopifnot(file.exists("DESCRIPTION"))

set.seed(1)
mydata <- data.frame(a = runif(10),
                     b = sample(10),
                     c = sample(letters, 10),
                     stringsAsFactors = FALSE)

save(list = "mydata", file = "data/mydata.rda")

write.table(mydata, "data/a_table.csv", sep = ";", row.names = FALSE)

code <- c("generated <-",
          "  data.frame(a = stats::runif(10),",
          "             b = sample(10),",
          "             c = sample(letters, 10),",
          "             stringsAsFactors = FALSE)")
writeLines(code, "data/generated.R")

library(parrotmetric)
data("generated")

library(parrotmetric)
data("old_data")
