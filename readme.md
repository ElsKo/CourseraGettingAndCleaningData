---
title: "Readme.md" 
output: html_document
variant: markdown_github
---

date: 23-05-2017

## Introduction
This assignment is part of the Coursera Data Science course Getting and Cleaning Data. The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

## Assignment
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##  Explanation of files and how to use them
1. Download the data from the website  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Store the data and the file `run_analysis.R` to your computer in the same folder.

3. Select the path where files are stored and copy this to the run_analysis.R file, where you can set the folderpath.

4. Use `source("run_analysis.R")` to run the script. A new file DatasetTidy.txt will be stored in the folder.

## Cookbook
The file cookbook.md contains the description of variables and summaries calculated in the new dataset, along with units and other relevant information.
