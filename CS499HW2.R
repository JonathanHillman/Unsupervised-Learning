
###############################################################################
###############################################################################
############################## Question 1 #####################################
###############################################################################
###############################################################################

if(!requireNamespace("animint2"))install.packages("animint2")
library(animint2)

data(WorldBank, package="animint2")
WorldBank1975 <- subset(WorldBank, year==1975)
WorldBankBefore1975 <- subset(WorldBank, 1970 <= year & year <= 1975)

#change the order of the factor to change the order of the graphs
add.x.var <- function(df, x.var){
  data.frame(df, x.var=factor(x.var, c("year", "life expectancy")))
}


scatter=ggplot()+
  geom_point(aes(x=life.expectancy, y=fertility.rate, color=region),
             data=add.x.var(WorldBank1975, "life expectancy"))+
  geom_path(aes(x=life.expectancy, y=fertility.rate, color=region,
                group=country),
            data=add.x.var(WorldBankBefore1975, "life expectancy"))+
  geom_line(aes(x=year, y=fertility.rate, color=region, group=country),
            data=add.x.var(WorldBank, "year"))+
  
  xlab("")+
  facet_grid(. ~ x.var, scales="free")+
  theme_bw()+
  theme(panel.margin=grid::unit(0, "lines"))

scatter



###############################################################################
###############################################################################
############################## Question 2 #####################################
###############################################################################
###############################################################################



add.x.var <- function(df, x.var){
  data.frame(df, x.var=factor(x.var, c("fertility","year")))
}

add.y.var <- function(df, y.var){
  data.frame(df, y.var=factor(y.var, c("year", "life expectancy")))
}

scatter=ggplot()+
  
  geom_line(aes(x = year, y = life.expectancy, color = region, group = country),
            data = add.y.var(add.x.var(WorldBankBefore1975, "year"), "life expectancy"))+
  geom_point(aes(x = fertility.rate, y = life.expectancy, color = region),
             data = add.y.var(add.x.var(WorldBank1975, "fertility"), "life expectancy"))+
  geom_line(aes(x = fertility.rate, y = year, color = region, group = country),
            data = add.y.var(add.x.var(WorldBankBefore1975, "fertility"), "year"))+
  
  
  
  
  xlab("")+
  facet_grid(y.var ~ x.var, scales="free")+
  theme_bw()+
  theme(panel.margin=grid::unit(0, "lines"))

scatter

###############################################################################
###############################################################################
############################## Question 3 #####################################
###############################################################################
###############################################################################

scatter = ggplot() +
  geom_point(aes(x = fertility.rate, y = life.expectancy, color = region),
             data = WorldBank) + 
  facet_wrap(~year)
scatter