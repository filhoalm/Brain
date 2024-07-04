#########
library(ggplot2)

url <- "https://raw.githubusercontent.com/filhoalm/Brain/main/data.csv"
result <- read.csv(url, stringsAsFactors = FALSE)

# Subset and sort the result
result <- subset(result, result$asr > 0)
result <- result[order(result$asr),]
result <- as.data.frame(result)

# Create the ordered lollipop plot with style and different colors for sex
ggplot(result, aes(x = asr, y = reorder(country, asr), color = factor(sex))) +
  geom_segment(aes(x = 0, xend = asr, y = country, yend = country), show.legend = FALSE) + 
  geom_point(size = 3) +
  geom_text(aes(label = asr, color = factor(sex)), hjust = -0.3, vjust = 0.5, size = 2.0) + # Adjust text size and color
  geom_vline(xintercept = 0, linetype = "dashed", color = "black") +
  labs(title = "", subtitle = "Children (0-14)", x = "ASR", y = "Country", color = "Sex") +
  theme_minimal(base_size = 12) + 
  theme(axis.text.y = element_text(angle = 0, hjust = 1, color = "black", family = "sans")) + 
  scale_color_manual(values = c("1" = lancet_colors[4], "2" = lancet_colors[9])) +
  scale_x_continuous(limits = c(0, 20), breaks = seq(0, 20, 2)) # Set x-axis limits and breaks


########