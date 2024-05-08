# Carregar a biblioteca necessária
library(ggplot2)
library(dplyr)
library(writexl)

# Carregar os dados do arquivo CSV
dados <- read.csv("data/fitbit/activity_data_heartrate.csv")

# Criar o boxplot para o atributo Heart_rate
ggplot(dados, aes(y = Heart_rate)) +
  geom_boxplot(fill = "yellow", colour = "black") +
  labs(title = "Boxplot de Frequencia cardíaca",
       y = "Frequência Cardíaca (bpm)") +
  theme_minimal()


# Criar o histograma para o atributo Total de passos
ggplot(dados, aes(x = TotalSteps)) +
  geom_histogram(bins = 30, fill = "orange", color = "black") +
  labs(title = "Histograma de Total de passos",
       x = "Total de Passos",
       y = "Frequência") +
  theme_minimal()

# Criar o gráfico de dispersão entre TotalSteps e Calories
ggplot(dados, aes(x = TotalSteps, y = Calories)) +
  geom_point(alpha = 0.5, color = "blue") +  # alpha para melhor visualização dos pontos sobrepostos
  labs(title = "Gráfico de Dispersão entre TotalSteps e Calories",
       x = "Total de Passos",
       y = "Calorias Queimadas") +
  theme_minimal()

# Criar o gráfico de dispersão entre TotalSteps e TotalDistance
ggplot(dados, aes(x = TotalSteps, y = TotalDistance)) +
  geom_point(alpha = 0.5, color = "blue") +  # Usar transparência para melhor visualização em caso de sobreposição
  labs(title = "Gráfico de Dispersão entre TotalSteps e TotalDistance",
       x = "Total de Passos",
       y = "Distância Total (km)") +
  theme_minimal()


# Criar o gráfico de dispersão entre TotalActiveMinutes e Calories
ggplot(dados, aes(x = TotalActiveMinutes, y = Calories)) +
  geom_point(alpha = 0.5, color = "blue") +  # Usar transparência para melhor visualização em caso de sobreposição
  labs(title = "Gráfico de Dispersão entre TotalActiveMinutes e Calories",
       x = "Total de Minutos Ativos",
       y = "Calorias Queimadas") +
  theme_minimal()


# Criar um novo atributo categórico 'HeartRateCategory'
dados <- dados %>%
  mutate(HeartRateCategory = case_when(
    Heart_rate <= 60 ~ "até 60 bpm",
    Heart_rate > 60 & Heart_rate <= 90 ~ "61 a 90 bpm",
    Heart_rate > 90 ~ "maior que 90 bpm"
  ))

# Calcular a média de passos por categoria de frequência cardíaca
media_passos_por_categoria <- dados %>%
  group_by(HeartRateCategory) %>%
  summarise(Media_Passos = mean(TotalSteps, na.rm = TRUE))

# Criar um gráfico de barras para mostrar a média de passos por categoria de frequência cardíaca
ggplot(media_passos_por_categoria, aes(x = HeartRateCategory, y = Media_Passos, fill = HeartRateCategory)) +
  geom_bar(stat = "identity", color = "black") +
  labs(title = "Média de Passos por Categoria de Frequência Cardíaca",
       x = "Categoria de Frequência Cardíaca",
       y = "Média de Passos") +
  theme_minimal() +
  scale_fill_brewer(palette = "Pastel1")  #

# Criar uma tabela de frequências para 'HeartRateCategory'
frequencia_heart_rate <- table(dados$HeartRateCategory)

# Converter a tabela de frequências para data frame para exportação
freq_df <- as.data.frame(frequencia_heart_rate)

# Exportar a tabela de frequências para um arquivo Excel
write_xlsx(freq_df, "frequencia.xlsx")