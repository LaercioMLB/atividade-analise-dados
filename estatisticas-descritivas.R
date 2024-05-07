# libs
library(dplyr)
library(readr)

# Carregar db
dados <- read.csv("data/fitbit/activity_data_heartrate.csv")
print(head(dados))

# Calcular estatísticas descritivas
estatisticas_descritivas <- dados %>%
  summarise(
    #Estaticias dos steps
    Media_Steps = mean(TotalSteps, na.rm = TRUE),
    Mediana_Steps = median(TotalSteps, na.rm = TRUE),
    Amplitude_Steps = max(TotalSteps, na.rm = TRUE) - min(TotalSteps, na.rm = TRUE),
    Desvio_Padrao_Steps = sd(TotalSteps, na.rm = TRUE),
    Coef_Var_Steps = sd(TotalSteps, na.rm = TRUE) / mean(TotalSteps, na.rm = TRUE) * 100,
    
    #Estaticias das distances
    Media_Distance = mean(TotalDistance, na.rm = TRUE),
    Mediana_Distance = median(TotalDistance, na.rm = TRUE),
    Amplitude_Distance = max(TotalDistance, na.rm = TRUE) - min(TotalDistance, na.rm = TRUE),
    Desvio_Padrao_Distance = sd(TotalDistance, na.rm = TRUE),
    Coef_Var_Distance = sd(TotalDistance, na.rm = TRUE) / mean(TotalDistance, na.rm = TRUE) * 100,
    
    #Estaticias dos minutos ativos
    Media_ActiveMinutes = mean(TotalActiveMinutes, na.rm = TRUE),
    Mediana_ActiveMinutes = median(TotalActiveMinutes, na.rm = TRUE),
    Amplitude_ActiveMinutes = max(TotalActiveMinutes, na.rm = TRUE) - min(TotalActiveMinutes, na.rm = TRUE),
    Desvio_Padrao_ActiveMinutes = sd(TotalActiveMinutes, na.rm = TRUE),
    Coef_Var_ActiveMinutes = sd(TotalActiveMinutes, na.rm = TRUE) / mean(TotalActiveMinutes, na.rm = TRUE) * 100,
    
    #Estaticias de bpm do coração
    Media_bpm = mean(Heart_rate, na.rm = TRUE),
    Mediana_bpm = median(Heart_rate, na.rm = TRUE),
    Amplitude_bpm = max(Heart_rate, na.rm = TRUE) - min(Heart_rate, na.rm = TRUE),
    Desvio_Padrao_bpm = sd(Heart_rate, na.rm = TRUE),
    Coef_Var_bpm = sd(Heart_rate, na.rm = TRUE) / mean(Heart_rate, na.rm = TRUE) * 100,
    
    #Estaticias das calorias
    Media_Calories = mean(Calories, na.rm = TRUE),
    Mediana_Calories = median(Calories, na.rm = TRUE),
    Amplitude_Calories = max(Calories, na.rm = TRUE) - min(Calories, na.rm = TRUE),
    Desvio_Padrao_Calories = sd(Calories, na.rm = TRUE),
    Coef_Var_Calories = sd(Calories, na.rm = TRUE) / mean(Calories, na.rm = TRUE) * 100
  )
