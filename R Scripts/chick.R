#load packages

  library(tidyverse)
  library (warbleR)
  library (Rraven)
  library(rstudioapi)

#copy script into folder of csv files and audio files, set wd to source file location
  
  setwd(dirname(getActiveDocumentContext()$path)) 

#check if it worked
  
  getwd()  

  
#STEP 1 - turn csv files into raven scripts
  
#loadcsvfiles
files_to_read <- list.files(pattern = ".csv", full.names = T)
files_to_read <- files_to_read[sapply(files_to_read, file.size) > 35 ]

#test
files_to_read

#convert folder to raven .txt files

clean_data_fn <- function(input_files) {
  messyData <- 
    read.csv(input_files) %>%
    slice_head (n= -1) %>%  
    select(-name) %>%
    set_names(c("Selection", "Begin Time (s)", "End Time (s)")) %>%
    mutate(Selection = Selection + 1) %>%
    add_column(View = "Spectrogram 1",
               .after = "Selection") %>%
    add_column(Channel = "1",
               .after = "View") 
  
  write.table(messyData, quote = FALSE, sep = "\t", row.names = FALSE, str_replace(input_files,"csv", "txt"))
  
}

map(files_to_read, function(files_var) clean_data_fn(files_var))

#STEP 2 - remove _annotation suffix 

file.rename(list.files(pattern ='_annotations'),
            str_replace(list.files(pattern='_annotations'), pattern='_annotations', ''))


#STEP 3 - Generate Spectrograms

list.files (pattern = "\\.txt$")

data <- imp_raven(sound.file.col = "End.File", all.data = TRUE, name.from.file = TRUE, ext.case = "upper", warbler.format = TRUE)

str(data)

write.csv(data, "data.csv", row.names = FALSE)

spectrograms(data, wl = 2132, flim  = c(4, 6), it = "jpeg", res = 100, osci = FALSE, ovlp = 90, mar = 0.1, fast.spec = TRUE)
