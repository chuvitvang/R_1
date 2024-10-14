library(ggplot2)
df <- diamonds

df_summary <- aggregate(carat ~ cut, df, FUN = length)
names(df_summary)[2] <- "count"

ggplot(data = df_summary, mapping = aes(x = cut, y = count)) +
  geom_col(color = "navy", fill = "#00FFFF", width = 0.6) +
  theme_bw() +
  labs(x = "Cut", y = "Count",
       title = "Counting of Diamonds") +
  theme(
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    panel.background = element_rect(fill = "#EEEEEE"),
    plot.title = element_text(face = "bold", size = 18, hjust = 0.5,colour = "red"),
    axis.title = element_text(face = "bold", size = 14),
    axis.text = element_text(colour = "black"),
    axis.ticks = element_line(colour = "red"),
    axis.ticks.length = unit(0.25, "cm")
  )
