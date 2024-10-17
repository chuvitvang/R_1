library(ggplot2)#ggplot2 dùng để vẽ biểu đồ
library(dplyr)#cung cấp các hàm để xử lý và biến đổi dữ liệu

# Tóm tắt dữ liệu từ dataframe diamonds
#diamonds: dataframe có sẵn trong ggplot2, chứa thông tin về các viên kim cương
#toán tử %>% "pipe" giúp truyền kết quả từ một bước này sang bước tiếp theo
df_summary <- diamonds %>% 
  filter(color %in% c("D", "J")) %>% #lọc ra các hàng có màu là "D" hoặc "J"
  count(cut, color) #đếm số lượng viên kim cương theo từng loại cắt (cut) và màu (color)
  #Kết quả sẽ được lưu vào biến df_summary với hai cột cut và color, cùng cột n cho số lượng

# Vẽ biểu đồ cột đôi
#ggplot(df_summary, ...): bắt đầu xây dựng biểu đồ với dữ liệu từ df_summary
#es(...): xác định các biến cho các trục x, y và màu sắc của các cột. x là cut, y là n (số lượng), và fill là color
ggplot(df_summary, aes(x = cut, y = n, fill = color)) +
  #geom_col để vẽ biểu đồ cột
  #position = "dodge": tạo khoảng cách giữa các cột của D và J
  geom_col(color = "navy", position = "dodge") +
  #geom_text: thêm nhãn cho các cột
  #aes(label = n): hiển thị giá trị số lượng (n) trên các cột
  #position = position_dodge(width = 0.9): giữ cho các nhãn không bị chồng lên nhau
  #vjust = -0.5: điều chỉnh vị trí nhãn nằm trên cột.
  geom_text(aes(label = n), position = position_dodge(width = 0.9), vjust = -0.5) +
  theme_bw() + #theme_bw(): áp dụng theme trắng đen cho biểu đồ, giúp tăng tính rõ ràng
  #labs(...): đặt tiêu đề cho trục x, y và chú thích màu
  labs(x = "Cut", y = "Count", fill = "Color") +
  theme( #tùy chỉnh theme
    #panel.grid = element_blank(): loại bỏ các đường lưới.
    #panel.background = element_rect(fill = "#EEEEEE"): đặt màu nền cho biểu đồ.
    #axis.text.x = element_text(angle = 0, hjust = 0.5): điều chỉnh góc và vị trí của chữ trên trục x.
    #plot.title = element_text(hjust = 0.5): căn giữa tiêu đề của biểu đồ.
    #axis.ticks = element_line(color = "red"): đặt màu cho các dấu tick trên các trục.
    panel.grid = element_blank(),
    panel.background = element_rect(fill = "#EEEEEE"),
    axis.text.x = element_text(angle = 0, hjust = 0.5),
    plot.title = element_text(hjust = 0.5),
    axis.ticks = element_line(color = "red")
  ) +
  #scale_fill_manual(...): định nghĩa màu sắc cho các nhóm màu.
  #values = c("D" = "#00FFFF", "J" = "#FFCCFF"): chỉ định mã màu cụ thể cho màu "D" và "J".
  scale_fill_manual(values = c("D" = "#00FFFF", "J" = "#FFCCFF")) +
  #scale_y_continuous(...): tùy chỉnh trục y.
  #limits = c(0, 3000): đặt giới hạn cho trục y từ 0 đến 3000
  scale_y_continuous(limits = c(0, 3000))
