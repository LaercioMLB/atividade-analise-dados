# Carregar a biblioteca necessária
library(ggplot2)

# Carregar os dados do arquivo CSV
dados <- read.csv("data/fitbit/activity_data_heartrate.csv")

# Criar o boxplot para o atributo Heart_rate
ggplot(dados, aes(y = Heart_rate)) +
  geom_boxplot(fill = "yellow", colour = "black") +
  labs(title = "Boxplot de Frequencia cardíaca",
       y = "Frequência Cardíaca (bpm)") +
  theme_minimal()
