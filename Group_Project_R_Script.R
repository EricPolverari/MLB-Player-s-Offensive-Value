model6 <-lm (woba~poorlyweak_percent, data=stats_1_)
with(stats_1_, plot(woba~poorlyweak_percent, pch = 20))
grid()         
abline(model6, col = "red")          
summary (model6)



model3 <-lm (woba~poorlytopped_percent, data=stats_1_)
with(stats_1_, plot(woba~poorlytopped_percent, pch = 20))
grid() 
abline(model3, col = "red") 
summary (model3)



model2 <-lm (woba~poorlyunder_percent, data=stats_1_)
with(stats_1_, plot(woba~poorlyunder_percent, pch = 20))
grid() 
abline(model2, col = "red") 
summary (model2)



model1 <-lm (woba~flareburner_percent, data=stats_1_)
with(stats_1_, plot(woba~flareburner_percent, pch = 20))
grid()         
abline(model1, col = "red")          
summary (model1)



model4 <-lm (woba~solidcontact_percent, data=stats_1_)
with(stats_1_, plot(woba~solidcontact_percent, pch = 20))
grid() 
abline(model4, col = "red") 
summary (model4)



model5 <-lm (woba~barrel_batted_rate, data=stats_1_)
with(stats_1_, plot(woba~barrel_batted_rate, pch = 20))
grid() 
abline(model5, col = "red") 
summary (model5)



model10 <-lm (woba~poorlyweak_percent+poorlyunder_percent+poorlytopped_percent+flareburner_percent+solidcontact_percent+barrel_batted_rate, data=stats_1_)
summary (model10)


library(readxl)

statcast <- read_excel("statcast.xls")
statcast1 <- read_excel("statcast1.xls")


full.model <-lm (woba~ . , data=statcast1)
summary(full.model) 

reduced.model <-ols_step_both_p(full.model)
reduced.model

model1 <-lm (woba~on_base_plus_slg+b_intent_walk+b_k_percent, data=statcast1)
summary(model1)

model2 <-lm (woba~b_intent_walk+b_k_percent+pitch_count_fastball, data=statcast1)
summary(model2)

model3 <-lm (woba~b_intent_walk+pitch_count_fastball+barrel_batted_rate, data=statcast1)
summary(model3)

model4 <-lm (woba~b_intent_walk+pitch_count_fastball+barrel_batted_rate+b_intent_walk*b_intent_ball
             +pitch_count_fastball*barrel_batted_rate+barrel_batted_rate*barrels, data=statcast1)
summary(model4)

anova(model3,model4)

model5 <-lm (woba~b_intent_walk+pitch_count_fastball+barrel_batted_rate+barrels, data=statcast1)
summary(model5)

anova(model3,model5)
anova(model5,model4)

library(car)

vif(model5)

model6 <-lm (woba~b_intent_walk+b_k_percent +barrels + popups_percent, data=statcast1)
summary(model6)

anova(model6,model5)
 plot(statcast1$b_intent_walk, statcast1$woba)
 plot(statcast1$barrels, statcast1$woba)
 plot(statcast1$pitch_count_fastball, statcast1$woba)
model7 <-lm (woba~b_intent_walk*b_walk+pitch_count_fastball*in_zone+barrels*solidcontact_percent, data=statcast1)
summary(model7)
 
anova(model6,model7)

reduced.model <-ols_step_both_p(full.model)
reduced.model

model6 <-lm (woba~b_intent_walk + barrels + b_k_percent + popups_percent, data=statcast1)
summary(model6)

model7 <-lm (woba~b_walk + barrels + b_k_percent + popups_percent, data=statcast1)
summary(model7)

model8 <-lm (woba~b_walk*barrels + b_k_percent + popups_percent, data=statcast1)
summary(model8)


model9 <-lm (woba~b_walk + barrels + pitch_count_breaking  , data=statcast1)
summary(model9)
 
model10 <-lm (woba~b_walk *pitch_count_breaking + barrels , data=statcast1)
summary(model10)


anova(model9,model10)



full.model <-lm (woba~ . , data=statcast2)
summary(full.model) 

reduced.model <-ols_step_both_p(full.model)
reduced.model


model12 <-lm (woba~isolated_power + poorlyunder_percent + pull_percent, data=statcast2)
summary(model12)

model13 <-lm (woba~isolated_power * poorlyunder_percent + pull_percent   , data=statcast2)
summary(model13)

model13.1 <-lm (woba~isolated_power * pull_percent + poorlyunder_percent   , data=statcast2)
summary(model13.1)



model14 <-lm (woba~ uBB+ b_hit_by_pitch + b_single + b_double + b_triple + b_home_run + b_ab + b_walk + b_sac_fly , data=statcast)
summary(model14)

uBB = statcast$b_walk-statcast$b_intent_walk

anova(model12,model13)

with(statcast2, plot(woba~isolated_power, pch = 20))
grid()

with(statcast2, plot(woba~poorlyunder_percent, pch = 20))
grid()

with(statcast2, plot(woba~pull_percent, pch = 20))
grid()

install.packages("olsrr")
library(olsrr)


full.model <-lm (woba~ . , data=statcast3)
summary(full.model) 

reduced.model <-ols_step_both_p(full.model)
reduced.model



model20 <-lm (woba~isolated_power + b_hit_line_drive + out_zone_swing , data=statcast3)
summary(model20)

model21 <-lm (woba~isolated_power + I(isolated_power^2) + out_zone_swing+ b_hit_line_drive  , data=statcast3)
summary(model21)

anova(model20,model21)

model22 <-lm (woba~isolated_power + b_hit_line_drive + out_zone_swing + poorlyunder_percent , data=statcast3)
summary(model22)

model23 <-lm (woba~isolated_power + I(isolated_power^2) + b_hit_line_drive + I(b_hit_line_drive^2)  + out_zone_swing + poorlyunder_percent , data=statcast3)
summary(model23)

model24 <-lm (woba~isolated_power + I(isolated_power^2) + b_hit_line_drive  + out_zone_swing + poorlyunder_percent , data=statcast3)
summary(model24)

model25 <-lm (woba~isolated_power + I(isolated_power^2) + b_hit_line_drive + I(b_hit_line_drive^2) 
              + out_zone_swing + I(out_zone_swing^2)+ poorlyunder_percent , data=statcast3)
summary(model25)

model26 <-lm (woba~isolated_power + I(isolated_power^2) + b_hit_line_drive + I(b_hit_line_drive^2) 
              + out_zone_swing + I(out_zone_swing^2)+ poorlyunder_percent + I(poorlyunder_percent^2), data=statcast3)
summary(model26)

anova(model25,model26)

full.model <-lm (woba~ . , data=statcast6)
summary(full.model) 

reduced.model <-ols_step_both_p(full.model)
reduced.model

model30 <-lm (woba~ flareburner_percent 
              + oz_swing_percent + sprint_speed + barrel_batted_rate, data=statcast6)
summary(model30)

model31 <-lm (woba~barrels * barrel_batted_rate + flareburner_percent 
              + oz_swing_percent + sprint_speed , data=statcast6)
summary(model31)

model32 <-lm (woba~ I(barrel_batted_rate^2)+ barrel_batted_rate + sprint_speed + flareburner_percent
              + oz_swing_percent  
                , data=statcast6)
summary(model32)

anova(model30,model32)

model33 <-lm (woba~barrels + I(barrels^2)+ barrel_batted_rate + I(barrel_batted_rate^2)+ sprint_speed + flareburner_percent+ whiff_percent + oz_swing_percent  
              , data=statcast3)
summary(model33)

model34 <-lm (woba~barrels + I(barrels^2)+ barrel_batted_rate + 
                      sprint_speed + flareburner_percent + whiff_percent + I(whiff_percent^2)+ oz_swing_percent + I(oz_swing_percent^2) 
              , data=statcast3)
summary(model34)





install.packages("car")

library(car)

cor(statcast_cor_new)
plot(statcast_cor_new)
vif(model90)
residualPlots(model91)
boxplot(model91$residuals, horizontal=TRUE)
library(olsrr)
ols_plot_resid_qq(model91)
ols_plot_resid_stud_fit(model91)$outliers
ols_leverage(model91)
ols_plot_resid_lev(model91)
ols_plot_cooksd_chart(model91)

model91 <- lm (woba ~ I(isolated_power^2) + sprint_speed + b_hit_line_drive + isolated_power 
               + popups_percent + straightaway_percent + in_zone_swing, data = statcast3)
summary(model91)

model90 <- lm (woba ~  sprint_speed + b_hit_line_drive + isolated_power 
               + popups_percent + straightaway_percent + in_zone_swing, data = statcast3)
summary(model90)

vif(model90)

### for fun ###

full.model1 <-lm (woba~ . , data=Statcast_adv1)
summary(full.model1) 

reduced.model1 <-ols_step_both_p(full.model1)
reduced.model1

modelfun <-lm (woba ~  barrels + flareburner_percent + oz_swing_percent 
             + in_zone_percent + sprint_speed + out_zone_swing_miss, data = Statcast_adv1)
summary(modelfun) 

with(statcast3, plot(woba~isolated_power, pch = 20))
grid() 

