# Code Book

### Original Data
The original dataset came from the UCI Machine Learning Repository: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Transformations
The run_analysis.R script:

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The final data is made available in the local environment as "summary", and is saved as "results.txt" in the working directory.  The unsummarized data (prior to last step) is available in the local environment as "descriptive_activities".

### Tidy Dataset
The final dataset (results.txt / summary) uses a consistent naming convention for the columns.  Since all measurements are means (potentially of a group already consisting of means), the measurement columns wrap the averaged field in "mean()" to avoid confusion with the underlying measurement name.  Names are prefixed "time" for time domain signals, and "frequency" for frequency domain signals.  Underscores replace spaces (a personal preference).  The dataset is considered tidy as each row captures information about a single subject/activity pair with no repeated values in the columns (see https://class.coursera.org/getdata-013/forum/thread?thread_id=31).

#### Column Names

- subject_id - numeric identifier of subject performing activity
- activity - name of the activity (WALKING/SITTING/etc)

The following columns are all means of either the means or standard deviations of raw measurements (modified by original researchers per notes in features_info.txt in original dataset).  While it may be difficult to ascribe an inherent meaning to such calculated values, the assignment called for them:

- mean(time_body_accelerometer_mean_x)
- mean(time_body_accelerometer_mean_y)
- mean(time_body_accelerometer_mean_z)
- mean(time_body_accelerometer_standard_deviation_x)
- mean(time_body_accelerometer_standard_deviation_y)
- mean(time_body_accelerometer_standard_deviation_z)
- mean(time_gravity_accelerometer_mean_x)
- mean(time_gravity_accelerometer_mean_y)
- mean(time_gravity_accelerometer_mean_z)
- mean(time_gravity_accelerometer_standard_deviation_x)
- mean(time_gravity_accelerometer_standard_deviation_y)
- mean(time_gravity_accelerometer_standard_deviation_z)
- mean(time_body_accelerometer_jerk_mean_x)
- mean(time_body_accelerometer_jerk_mean_y)
- mean(time_body_accelerometer_jerk_mean_z)
- mean(time_body_accelerometer_jerk_standard_deviation_x)
- mean(time_body_accelerometer_jerk_standard_deviation_y)
- mean(time_body_accelerometer_jerk_standard_deviation_z)
- mean(time_body_gyroscope_mean_x)
- mean(time_body_gyroscope_mean_y)
- mean(time_body_gyroscope_mean_z)
- mean(time_body_gyroscope_standard_deviation_x)
- mean(time_body_gyroscope_standard_deviation_y)
- mean(time_body_gyroscope_standard_deviation_z)
- mean(time_body_gyroscope_jerk_mean_x)
- mean(time_body_gyroscope_jerk_mean_y)
- mean(time_body_gyroscope_jerk_mean_z)
- mean(time_body_gyroscope_jerk_standard_deviation_x)
- mean(time_body_gyroscope_jerk_standard_deviation_y)
- mean(time_body_gyroscope_jerk_standard_deviation_z)
- mean(time_body_accelerometer_mag_mean)
- mean(time_body_accelerometer_mag_standard_deviation)
- mean(time_gravity_accelerometer_mag_mean)
- mean(time_gravity_accelerometer_mag_standard_deviation)
- mean(time_body_accelerometer_jerk_mag_mean)
- mean(time_body_accelerometer_jerk_mag_standard_deviation)
- mean(time_body_gyroscope_mag_mean)
- mean(time_body_gyroscope_mag_standard_deviation)
- mean(time_body_gyroscope_jerk_mag_mean)
- mean(time_body_gyroscope_jerk_mag_standard_deviation)
- mean(frequency_body_accelerometer_mean_x)
- mean(frequency_body_accelerometer_mean_y)
- mean(frequency_body_accelerometer_mean_z)
- mean(frequency_body_accelerometer_standard_deviation_x)
- mean(frequency_body_accelerometer_standard_deviation_y)
- mean(frequency_body_accelerometer_standard_deviation_z)
- mean(frequency_body_accelerometer_jerk_mean_x)
- mean(frequency_body_accelerometer_jerk_mean_y)
- mean(frequency_body_accelerometer_jerk_mean_z)
- mean(frequency_body_accelerometer_jerk_standard_deviation_x)
- mean(frequency_body_accelerometer_jerk_standard_deviation_y)
- mean(frequency_body_accelerometer_jerk_standard_deviation_z)
- mean(frequency_body_gyroscope_mean_x)
- mean(frequency_body_gyroscope_mean_y)
- mean(frequency_body_gyroscope_mean_z)
- mean(frequency_body_gyroscope_standard_deviation_x)
- mean(frequency_body_gyroscope_standard_deviation_y)
- mean(frequency_body_gyroscope_standard_deviation_z)
- mean(frequency_body_accelerometer_mag_mean)
- mean(frequency_body_accelerometer_mag_standard_deviation)
- mean(frequency_body_body_accelerometer_jerk_mag_mean)
- mean(frequency_body_body_accelerometer_jerk_mag_standard_deviation)
- mean(frequency_body_body_gyroscope_mag_mean)
- mean(frequency_body_body_gyroscope_mag_standard_deviation)
- mean(frequency_body_body_gyroscope_jerk_mag_mean)
- mean(frequency_body_body_gyroscope_jerk_mag_standard_deviation)