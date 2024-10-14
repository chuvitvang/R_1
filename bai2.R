library(ggplot2)
library(dplyr)

# Sử dụng dataframe diamonds có sẵn và lọc dữ liệu
df_summary <- diamonds %>%
  filter(color %in% c("D", "J")) %>%
  count(cut, color, name = "count")

# Vẽ biểu đồ cột đôi
ggplot(data = df_summary, aes(x = cut, y = count, fill = color)) +
  geom_col(color = "navy", position = "dodge") +
  geom_text(aes(label = count), position = position_dodge(width = 0.9), vjust = -0.5) +
  theme_bw() +
  labs(x = "Cut", y = "Count", fill = "Color") +
  theme(
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    panel.background = element_rect(fill = "#EEEEEE"),
    axis.text.x = element_text(angle = 0, hjust = 0.5),
    plot.title = element_text(hjust = 0.5),
    axis.ticks = element_line(colour = "red")
  ) +
  scale_fill_manual(values = c("D" = "#00FFFF", "J" = "#FFCCFF")) +
  scale_y_continuous(limits = c(0, 3000))
