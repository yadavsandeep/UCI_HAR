==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The script works in this order:

- Read features and activities text files, to be used later as column names
- Read test data for x, y, and subjects and combine using cbind; set colnames
- Read train data for x, y, and subjects and combine using cbind; set colnames
- Combine test and training data using rbind
- Create a new data frame containing only mean and std dev
- Clean the column names 
- Use ddply to create a new data frame on subjects and activity and calcuating means
- Write to a new table
