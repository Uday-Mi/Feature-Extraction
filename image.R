# Various Libraries have been imported. 
# library(imager) helps in importing the data set of images in RStudio
library(imager)
library(raster)
library(rgdal)

# The following lines of code will load the images in RStudio
# The value of Folder is specific to the system on which the code is written
# Update the value of Folder with the path where the folder has been saved
# Folder can be interpreted as
# Folder <- "Path"

Folder <- "D:/3-1/Foundations of data Science/ Assignment 1/fruit"
files <- list.files(path = Folder, pattern = "*.jpg", full.names = TRUE)
all_images <- lapply(files, load.image)

rgb <- matrix(nrow = length(files), ncol = 3)

x <- 1
for (i in files)
{
  rgb[x, 1] <- raster(i, band = 1)
  rgb[x, 2] <- raster(i, band = 2)
  rgb[x, 3] <- raster(i, band = 3)
  x <- x + 1
}


# rgb contains the spectrum of each of the image present in the data set.
# The spectrum can be used to seperate the images using various techniques