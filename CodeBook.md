#CodeBook

##Scripts
The run_analysis.R script does all the needed work.
It was tested in Rstudio, by doing 
source('run_analysis.R')

##Input

The script assumes that the dataset was previousdly downloaded from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and unziped into the current working directory

The data set is separated in 2 distinct directories called 'test' and 'train'.
Each directory further separates the dataset in a subject vector file, a y vector file  (which contains and activity index), and a X table file with several features. A complete description of the features can be read in the file features_info.txt, and shall not be replicated here

##Transformations

The training and test vectors (and table), were first merged into to one, and then combined into a single data frame.
The appropriate data labels were added, as described in the file features.txt
The activity index was translated into an activity name, as described in the file activity_labels.txt.
The data was subset, retaining only features which had either 'mean' or 'std' in their name.
The data was then aggregated by subject and activity and it's mean calculated

##Output

A data table is written into 'tidy_data.txt', without row names, which contains the means for each subsetted variable, grouped by subject and activity, as described in the last step of transformation.

