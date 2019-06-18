est_colors_group1 = c("#0078ff", "#003cff", "#0000b4", "#000096", "#00005a")
est_colors_group2 = c("#d2dbc1", "#bae6e8", "#98a589", "#2b7aa1", "#0000f0")
est_colors_group3 = c("#fcedc5", "#ffca9f", "#ad7351", "#964542", "#ff4800")
est_colors_group4 = c("#e6e7e8", "#d2c3d4", "#c4bec5", "#8b7883", "#3c0078")
est_colors_group5 = c("#c1bc76", "#65a580", "#2e6347", "#1d4432", "#51de3e")
est_colors_group6 = c("#f0f1f2", "#e6e7e8", "#a7a9ab", "#808284", "#ff2db4")

est_colors = rbind(est_colors_group1,
                   est_colors_group2,
                   est_colors_group3,
                   est_colors_group4,
                   est_colors_group5,
                   est_colors_group6)

est_palettes = list(
  `group 1`  = est_colors[1, ],
  `group 2`  = est_colors[2, ],
  `group 3`  = est_colors[3, ],
  `group 4`  = est_colors[4, ],
  `group 5`  = est_colors[5, ],
  `group 6`  = est_colors[6, ],
  `slice 1`  = est_colors[, 1],
  `slice 2`  = est_colors[, 2],
  `slice 3`  = est_colors[, 3],
  `slice 4`  = est_colors[, 4],
  `slice 5`  = est_colors[, 5]
)

devtools::use_data(est_palettes, internal = TRUE, overwrite = TRUE)
