
The script works in this order:

- Read features and activities text files, to be used later as column names
        -       features
        -       activities
        
- Read test data for x, y, and subjects and combine using cbind; set colnames
        -       xTestDF
        -       yTestDF
        -       subjectTestDF

- Read train data for x, y, and subjects and combine using cbind; set colnames
        -       xTrainDF
        -       yTrainDF
        -       subjectTrainDF

- Combine test and training data using rbind
        - fullData

- Create a new data frame containing only mean and std dev
        -       filteredData
- Clean the column names 

- Use ddply to create a new data frame on subjects and activity and calcuating means
        -       meanTidyData
- Write to a new table
