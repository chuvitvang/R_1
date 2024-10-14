library(ggplot2)

# Sử dụng dataframe diamonds với tên khác
diamond_data <- diamonds

# Tóm tắt số lượng kim cương theo kiểu cắt
df_summary <- as.data.frame(table(diamond_data$cut))
names(df_summary) <- c("cut", "count")

# Tạo biểu đồ
ggplot(df_summary, aes(x = cut, y = count)) +
  geom_col(color = "navy", fill = "#00FFFF", width = 0.6) +
  theme_bw() +
  labs(
    x = "Kiểu cắt",
    y = "Số lượng",
    title = "Số lượng Kim cương"
  ) +
  theme(
    panel.grid = element_blank(),
    panel.background = element_rect(fill = "#EEEEEE"),
    plot.title = element_text(face = "bold", size = 18, hjust = 0.5, colour = "red"),
    axis.title = element_text(face = "bold", size = 14),
    axis.text = element_text(colour = "black"),
    axis.ticks = element_line(colour = "red"),
    axis.ticks.length = unit(0.25, "cm")
  )
