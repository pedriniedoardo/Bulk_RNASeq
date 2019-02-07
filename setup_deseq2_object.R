################################################################################
################################################################################
#  READ IN THE DATA #
################################################################################
################################################################################
# load the raw table of counts
# define the reading function that will load the file and save the gene as rowname of the datatable.
# read_csv cannot support rownames therefore we will keep the read.csv() function

read_data <- function(inputfile){
  raw_counts <- read.csv(inputfile)%>%
    # set the name of the first column sa Gene
    dplyr::rename(Gene=X)
  # save the gene colmn as vector
  gene<-raw_counts[,1]
  # remove the first column
  raw_counts <- raw_counts[,-1]
  # make the rownames o the table as the genename
  rownames(raw_counts) <- gene 
  
  return(raw_counts)
}

# read the data
raw_counts <- read_data("data/dataset.csv")

################################################################################
################################################################################
#  DEFINE THE METADATA #
################################################################################
################################################################################

# the experiment has a multifactorual design (two different condition tested).
# define a metadata table that can correctly assign the sample to the treatmet
# make sure the order of the samples in the table of counts is the same of the one in the metadata

################################################################################
################################################################################
#  CREATE THE DESEQ2 OBJECT #
################################################################################
################################################################################

