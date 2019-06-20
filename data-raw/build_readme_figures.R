library(dplyr)
library(ggplot2)
library(ggest)

### 1. theme_est()
##################

data(funding)
base_graph = ggplot(funding, aes(x=factor(year), y=total_raised_capital)) +
  geom_bar(stat="identity") +
  geom_text(aes(label=format(round(total_raised_capital/1e6, 2), nsmall=2)),
            vjust=-0.5, size=10, family="Aino-Headline") +
  labs(y="total raised capital (EUR)",
       x="",
       title="Investments raised by Estonian startups",
       caption="data source: Estonian startup database") +
  scale_y_continuous(labels=scales::unit_format(unit="m", scale=1e-6, sep=""))

p = base_graph +
  theme_est(base_size=32)

png("figures/theme_est.png", height = 1400, width = 2000)
p
dev.off()

### 2. colour palettes
######################

pals = list_color_palettes()
plots = list()
for(name in pals){
  is_orig_pal = grepl("group", name)
  if(is_orig_pal){
    p = visualize_pal(name, 5)
    plots[[length(plots) + 1]] = p
  }
}

png("figures/palettes.png", height = 1400, width = 2000)
p = gridExtra::grid.arrange(grobs=plots)
dev.off()

### 3. boulderplot
##################

dt = gapminder::gapminder %>%
  filter(year == 2007, continent %in% c("Asia", "Africa")) %>%
  droplevels() %>%
  mutate(country = reorder(country, -1 * pop)) %>%
  arrange(year, country)

png("figures/geom_boulder.png", height = 1400, width = 2000)
ggplot(dt, aes(x = gdpPercap, y = lifeExp, fill=lifeExp)) +
  geom_boulder(aes(size = pop), pch = 21, show.legend = FALSE,
               linetype=5, linewidth=2, alpha=0.3) +
  scale_x_log10(limits = c(230, 63000)) +
  scale_size_continuous(range = c(1,40)) + ylim(c(39, 87)) +
  scale_fill_gradientn(colors=c("white", "black", "#0072CE")) +
  labs(y="variable 2",
       x="variable 1",
       title="A boulderplot") +
  theme_est(base_size = 32)
dev.off()
