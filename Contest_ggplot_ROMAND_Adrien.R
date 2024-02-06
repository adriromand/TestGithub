#Faire un graphique avec la cheatsheet#
library(tidyverse)
library(dplyr)
data("diamonds")
diamonds

#install.packages("patchwork")
library(patchwork) #superposition de graphiques

##  Le prix en fonction des dimensions du diamant

plot1 = ggplot (data = diamonds, mapping = aes(x= x, y=price)) +
  labs(x="Length in mm (x)", y = "Price in US dollars") +
  geom_point(color = "darkblue")


plot2 =  ggplot (data = diamonds, mapping = aes(x= y, y=price) ) +
  labs(x="Width in mm (y)", y = "Price in US dollars") +
  geom_point(color = "darkblue")


plot3 = ggplot (data = diamonds, mapping = aes(x= z, y=price)) +
  labs(x="Depth in mm (z)", y = "Price in US dollars") +
  geom_point(color = "darkblue")

plot4 = ggplot (data = diamonds, mapping = aes(x= depth, y=price)) +
  labs(x="Total depth % 
       (z / mean(x, y) = 2 * z / (x + y) (43–79))", y = "Price in US dollars") +
  geom_point(color = "darkred") +
  geom_density_2d(color="white")
  
(plot1 + plot2 + plot3) / plot4


## Le prix en fonction de la clareté
ggplot (data = diamonds, mapping = aes(x= carat, y=price), main="Price = f(Clarity)") +
  labs(x="Diamond carat", y = "Price in US dollars") +
  geom_point(color="darkblue") +
  geom_density_2d(color="lightgrey")


##Cut and Price - An artistic graph
ggplot (data = diamonds, mapping = aes(x= cut, y=price),main="Price = f(cut)") +
  labs(x="Diamond cut quality", y = "Price in US dollars") +
  geom_point() +
  geom_violin(position = "dodge",stat = "ydensity",fill = "purple", colour = "#3366FF",
              draw_quantiles = c(0.25, 0.5, 0.75), aes(fill = cyl), orientation= "x") +
  coord_trans(y = "log10")
      
 

