					                           DATA DICTIONARY - TIDYDATASET

SUMMARY
--------

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details

VARIABLE TRANSFORMATIONS
-------------------------
For the tidydataset: 
1.  we combined the test and training data into one dataset
2.  extracted only the measurments on the mean and the standard deviation and 
3.  we subsetted the means for each subject and for each activity. 

VARIABLES
----------

subject				2
	Subject identification code
		1..30 Each person of 30 volunteers that performed the six activities of the experiment

activity			17
	Activity factor with 6 levels: the 6 activities of the experiment
		"walking"
	        "walkingupstairs"
		"walkingdownstairs"
		"sitting"
		"standing"
	        "laying"
 	
FEATURE	VARIABLES		9
------------------		 
		Means of the feature measurements for each subject, for each activity performed during the experiment.
		The following strings in the names denote:

		BodyAccelaration:	linear accelaration component
		BodyGyroscope: 		angular velocity measurement
		FFT:			frequency domain variable (Fast Fourier Transform)
		Freq:			frequency
		GravityAccelaration:	gravity accelation component
		Jerk:			jerk signal
		Magnitute:		magnitude
		Mean:			mean	
		StdDev:			standard deviation	
		time :			time domain variable
		X,Y,Z:  		3-axial signals in the X, Y and Z directions
		
timeBodyAccelarationMeanX	
timeBodyAccelarationMeanY
timeBodyAccelarationMeanZ
timeBodyAccelarationStdDevX
timeBodyAccelarationStdDevY
timeBodyAccelarationStdDevZ
timeGravityAccelarationMeanX
timeGravityAccelarationMeanY
timeGravityAccelarationMeanZ
timeGravityAccelarationStdDevX
timeGravityAccelarationStdDevY
timeGravityAccelarationStdDevZ
timeBodyAccelarationJerkMeanX
timeBodyAccelarationJerkMeanY
timeBodyAccelarationJerkMeanZ
timeBodyAccelarationJerkStdDevX
timeBodyAccelarationJerkStdDevY
timeBodyAccelarationJerkStdDevZ
timeBodyGyroscopeMeanX
timeBodyGyroscopeMeanY
timeBodyGyroscopeMeanZ
timeBodyGyroscopeStdDevX
timeBodyGyroscopeStdDevY
timeBodyGyroscopeStdDevZ
timeBodyGyroscopeJerkMeanX
timeBodyGyroscopeJerkMeanY
timeBodyGyroscopeJerkMeanZ
timeBodyGyroscopeJerkStdDevX
timeBodyGyroscopeJerkStdDevY
timeBodyGyroscopeJerkStdDevZ
timeBodyAccelarationMagnitudeMean
timeBodyAccelarationMagnitudeStdDev
timeGravityAccelarationMagnitudeMean
timeGravityAccelarationMagnitudeStdDev
timeBodyAccelarationJerkMagnitudeMean
timeBodyAccelarationJerkMagnitudeStdDev
timeBodyGyroscopeMagnitudeMean
timeBodyGyroscopeMagnitudeStdDev
timeBodyGyroscopeJerkMagnitudeMean
timeBodyGyroscopeJerkMagnitudeStdDev
FFTBodyAccelarationMeanX
FFTBodyAccelarationMeanY
FFTBodyAccelarationMeanZ
FFTBodyAccelarationStdDevX
FFTBodyAccelarationStdDevY
FFTBodyAccelarationStdDevZ
FFTBodyAccelarationMeanFreqX
FFTBodyAccelarationMeanFreqY
FFTBodyAccelarationMeanFreqZ
FFTBodyAccelarationJerkMeanX
FFTBodyAccelarationJerkMeanY
FFTBodyAccelarationJerkMeanZ
FFTBodyAccelarationJerkStdDevX
FFTBodyAccelarationJerkStdDevY
FFTBodyAccelarationJerkStdDevZ
FFTBodyAccelarationJerkMeanFreqX
FFTBodyAccelarationJerkMeanFreqY
FFTBodyAccelarationJerkMeanFreqZ
FFTBodyGyroscopeMeanX
FFTBodyGyroscopeMeanY
FFTBodyGyroscopeMeanZ
FFTBodyGyroscopeStdDevX
FFTBodyGyroscopeStdDevY
FFTBodyGyroscopeStdDevZ
FFTBodyGyroscopeMeanFreqX
FFTBodyGyroscopeMeanFreqY
FFTBodyGyroscopeMeanFreqZ
FFTBodyAccelarationMagnitudeMean
FFTBodyAccelarationMagnitudeStdDev
FFTBodyAccelarationMagnitudeMeanFreq
FFTBodyAccelarationJerkMagnitudeMean
FFTBodyAccelarationJerkMagnitudeStdDev
FFTBodyAccelarationJerkMagnitudeMeanFreq
FFTBodyGyroscopeMagnitudeMean
FFTBodyGyroscopeMagnitudeStdDev
FFTBodyGyroscopeMagnitudeMeanFreq
FFTBodyGyroscopeJerkMagnitudeMean
FFTBodyGyroscopeJerkMagnitudeStdDev
FFTBodyGyroscopeJerkMagnitudeMeanFreq

Reference:
----------- 
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Note on original data:
-----------------------
		      info url: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
	    download url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip   
