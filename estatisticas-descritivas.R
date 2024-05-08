# libs
library(dplyr)
library(readr)
library(writexl)
# Carregar db
dados <- read.csv("data/fitbit/activity_data_heartrate.csv")
print(head(dados))

# Calcular estatísticas descritivas
estatisticas_descritivas <- dados %>%
  summarise(
    #Estaticias dos passos
    Media_Passos = mean(TotalSteps, na.rm = TRUE),
    Mediana_Passos = median(TotalSteps, na.rm = TRUE),
    Amplitude_Passos = max(TotalSteps, na.rm = TRUE) - min(TotalSteps, na.rm = TRUE),
    Desvio_Padrao_Passos = sd(TotalSteps, na.rm = TRUE),
    Coef_Var_Passos = sd(TotalSteps, na.rm = TRUE) / mean(TotalSteps, na.rm = TRUE) * 100,
    
    #Estaticias da distancia
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
    
    #Estaticias de frequencia cardíaca
    Media_Bpm = mean(Heart_rate, na.rm = TRUE),
    Mediana_Bpm = median(Heart_rate, na.rm = TRUE),
    Amplitude_Bpm = max(Heart_rate, na.rm = TRUE) - min(Heart_rate, na.rm = TRUE),
    Desvio_Padrao_Bpm = sd(Heart_rate, na.rm = TRUE),
    Coef_Var_Bpm = sd(Heart_rate, na.rm = TRUE) / mean(Heart_rate, na.rm = TRUE) * 100,
    
    #Estaticias das calorias
    Media_Calorias = mean(Calories, na.rm = TRUE),
    Mediana_Calorias = median(Calories, na.rm = TRUE),
    Amplitude_Calorias = max(Calories, na.rm = TRUE) - min(Calories, na.rm = TRUE),
    Desvio_Padrao_Calorias = sd(Calories, na.rm = TRUE),
    Coef_Var_Calorias = sd(Calories, na.rm = TRUE) / mean(Calories, na.rm = TRUE) * 100
  )

write_xlsx(estatisticas_descritivas, "estatisticas_descritivas.xlsx")

