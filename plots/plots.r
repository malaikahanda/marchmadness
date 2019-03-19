
# libraries
library(tidyverse)

# data
df = read_csv("pixels.csv", col_types = cols()) %>%
  mutate(col = rgb(r_mean, g_mean, b_mean, maxColorValue = 255))

# plot

palette = df$col
names(palette) = df$col

ggplot(data = df,
       aes(x = b_mean - (r_mean + g_mean),
           y = seed,
           label = team)) +
  geom_point(aes(color = col),
             size = 12) +
  scale_color_manual(values = palette) +
  geom_text(color = "white",
            size = 3) +
  labs(title = "Bluest NCAA Teams",
       x = "Average Blueness of Logo (penalized)",
       y = "Seed") +
  theme_bw() +
  theme(legend.position = "none")

# ggsave("bluepen.jpg", width = 14, height = 8, units = "in")