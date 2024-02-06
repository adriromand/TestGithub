#06/02/2024
#ROMAND Adrien
#Faire un graphique

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

#Graphiquement, nous observons une corrélation positive à tendance linéaire entre
#le prix du diamant et les dimensions du diamant prises de manière individuelle.
#Cependant, la représentation graphoique de la profondeur totale du diamant ("depth"), 
#qui est la profondeur rapportée à la moyenne de la longueur de et de la largeur,
#ne montre pas de corrélation positive évidente. 
# Il est alors possible qu'un diamant aux dimensions soit valorisé par un prix plus élevé
# ou bien que d'autres facteurs associés influencent la définition de ce prix. 



## Price depending on Carat
ggplot (data = diamonds, mapping = aes(x= carat, y=price), main="Price = f(Caraty)") +
  labs(x="Diamond carat", y = "Price in US dollars") +
  geom_point(color="darkblue") +
  geom_density_2d(color="lightgrey")

#Graphiquement, il semble y avoir une corrélation positive à tendance linéaire entre 
# le nombre de carats du diamant et son prix. 
# De plus, avec l'indice de densité de l'échantillonnage, nous observons que l'apparition
#d'un nombre de carats croissant et inverssement proportionnel à la fréquence d'apparition
# de diamants. Autrement dit, il semble plus rare d'avoir un diamant avec un grand nombre de carats.


##Cut and Price - An artistic graph
ggplot (data = diamonds, mapping = aes(x= cut, y=price),main="Price = f(cut)") +
  labs(x="Diamond cut quality", y = "Price in US dollars") +
  geom_point() +
  geom_violin(position = "dodge",stat = "ydensity",fill = "purple", colour = "#3366FF",
              draw_quantiles = c(0.25, 0.5, 0.75), aes(fill = cyl), orientation= "x") +
  coord_trans(y = "log10")
      
 

