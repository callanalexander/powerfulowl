# Powerful Owl Classifers

## How to use

### Running the Models

To use Powerful Owl Automated Detection Models: 

* Download Anaconda and Install Deep Audio Segmenter: https://janclemenslab.org/das/installation.html

* Run DAS in GUI mode (see https://janclemenslab.org/das/quickstart.html) in the 'Predict' menu load either provided adult or chick .h5 models. Make sure the corresponding paramaters file is in the same folder as the .h5 model. For Adult detection we reccomend using Model B for minimal false positives as a starting point, and Model A if a more in-depth search is required. 

* In the 'Select Folder' direct to the data which you wish to run the models on. For annotation file format select 'csv'. 

* Ignore the settings under event detection. For the segment detection threshold we reccomend 0.90 as a starting point. 

**Important: **

* **Set 'Fill gaps shorter than' to 0.7s** 
* **Set 'Delete segments shorter than' to 0.5s.**
   * These values can be adjusted depended on the regional dialect of the Powerful Owls in your area. If you are experiencing a high number of short false positives you can increase the 'delete segments shorter than' value. 

### Generating Images and Raven files for Verification

* Download latest R and R Studio versions
* Place either Adult or Chick R script in the folder where you have run either the adult or chick recogniser
* Run the R Script in the folder - this will generate spectrogram image files for all detections and Raven scripts for each file. 
* The image files can then be rapidly browsed in file explorer

## Disclaimer

These Classifiers and Scripts have only been tested on Windows. However the models should also work on Mac and Linux

## Acknowledgements

These models were built using Deep Audio Segmenter: (https://github.com/janclemenslab/das)
