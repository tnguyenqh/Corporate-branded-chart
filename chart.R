library(ggplot2)
library(png)
library(gridExtra)
library(grid)

dev.off(dev.list()["RStudioGD"])
gg <- ggplot(mtcars, aes(x = mpg, y = wt)) + 
  theme_minimal() +
  geom_count() + 
  labs(title = "Title Goes Here", x = "", y = "")

img = readPNG("aia-logo.png")

gg = gg + 
  annotation_custom(rasterGrob(img), 
                    xmin=0.95*min(mtcars$mpg)-1, xmax=0.95*min(mtcars$mpg)+1, 
                    ymin=0.6*min(mtcars$wt)-0.7, ymax=0.6*min(mtcars$wt)+0.5) +
  theme(plot.margin=margin(5,10,40,5))

# Turn off clipping
gt <- ggplot_gtable(ggplot_build(gg))
gt$layout$clip[gt$layout$name=="panel"] <- "off"
grid.draw(gt)
