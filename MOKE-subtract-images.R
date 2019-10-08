############################
# (c) 2018 Thomas Gredig
# Mar 11, 2018
#
# subtracts two MOKE images
############################

# Image Analysis
# https://dahtah.github.io/imager/imager.html
library(imager)

# locate images
source.path = 'images'
file.list = dir(source.path)


# load two images
raw.image = file.list[1]
q.raw = load.image(file.path(source.path,raw.image))
background.image = file.list[3]
q.background = load.image(file.path(source.path,background.image))

# do the math
# result image  = RAW - background
# plot all three next to each other
###################################
layout(matrix(1:3,1,3))
plot(q.raw, main=file.list[1])
plot(q.background, main=file.list[3])

q.diff = q.raw - q.background
plot(q.diff, main='diff')
dim(q.diff)

layout(matrix(1:1,1,1))

q2 = isoblur(q.diff, sigma=5)
plot(q2)
YUVtoRGB(q2) %>% plot

plot(isoblur(q.raw, sigma=5) - isoblur(q.background, sigma=5))

im <- grayscale(q2)
deriche(im,sigma=4,order=2,axis="y") %>% plot(main="2nd deriv of Gaussian along y")
