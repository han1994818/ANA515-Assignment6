# 加载必要的库
library(readr)
library(dplyr)
library(ggplot2)
library(stringr)

# 读取数据
storm_data <- read_csv("/Users/lichenghan/Desktop/Mcdaniel college/515/StormEvents_locations-ftp_v1.0_d2024_c20240620.csv.gz", show_col_types = FALSE)

# 使用实际存在的列进行选择
storm_data_selected <- storm_data %>%
  select(YEARMONTH, EPISODE_ID, LOCATION, RANGE, AZIMUTH, LATITUDE, LONGITUDE)

# 创建基于位置的散点图，展示风暴事件的地理分布
ggplot(storm_data_selected, aes(x = LONGITUDE, y = LATITUDE, label = LOCATION)) +
  geom_point() +  # 添加点以表示事件的位置
  geom_text(aes(label = LOCATION), vjust = 1.5, hjust = 1.5, check_overlap = TRUE, size = 2.5, angle = 45) +  # angle 可以调整文本角度
  labs(title = "Geographic distribution of storm events", x = "Longitude经度", y = "latitude纬度") +
  theme_minimal() +
  theme(
    text = element_text(size = 12),  # 调整图表主要文字大小
    axis.text.x = element_text(angle = 45, hjust = 1),  # x轴标签倾斜以改善视觉效果
    plot.title = element_text(hjust = 0.5)  # 标题居中
  )

