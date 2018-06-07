# https://gist.github.com/jsta/e486f337be6d5bcdb3aeb1335959de52
# GLEON lakes according to Wikipedia

library(rvest)
library(wikilake)
library(sf)
library(maps)
library(ggplot2)

# get data ####
# gleon_lakes <- read_html("http://gleon.org/lakes")
# gleon_lakes <- html_nodes(gleon_lakes, ".views-field")
# gleon_lakes <- html_text(gleon_lakes)
#
# gleon_lake_names <- gleon_lakes[seq(1, length(gleon_lakes), by = 3)]
# gleon_lake_names <- gsub("\n", "", gleon_lake_names)
# gleon_lake_names <- trimws(gleon_lake_names)[-1]
#
# res <- lapply(gleon_lake_names, function(x) tryCatch(wikilake::lake_wiki(x), error = function(err){NA}))
#
# # clean missing lakes ####
# res_clean <- res[unlist(lapply(res, function(x) !is.null(x)))]
# res_clean <- res_clean[unlist(lapply(res_clean, function(x) length(x) > 1))]
# res_clean <- res_clean[unlist(lapply(res_clean, function(x) !is.na(x[,"Lat"])))]
#
# length(res_clean) / length(gleon_lake_names) # proportion of gleon lakes that resolve to wikipedia pages
#
# ##### collapse list to data.frame
#
# res_df_names <- unique(unlist(lapply(res_clean, names)))
# res_df <- data.frame(matrix(NA, nrow = length(res_clean),
#                             ncol = length(res_df_names)))
# names(res_df) <- res_df_names
# for(i in seq_len(length(res_clean))){
#   # print(i) # debugging
#   dt_pad <- data.frame(matrix(NA, nrow = 1,
#                 ncol = length(res_df_names) - ncol(res_clean[[i]])),
#                 stringsAsFactors = FALSE)
#   names(dt_pad) <- res_df_names[!(res_df_names %in% names(res_clean[[i]]))]
#   dt <- cbind(res_clean[[i]], dt_pad)
#   dt <- dt[,res_df_names]
#   res_df[i,] <- dt
# }
#
# # Keep only common columns #####
# good_cols <- data.frame(as.numeric(as.character(apply(milakes,
#                                           2, function(x) sum(!is.na(x))))))
# good_cols <- cbind(good_cols, names(milakes))
# good_cols <- good_cols[good_cols[,1] > 20 ,2]
#
# res_final <- res_df[,good_cols]
# saveRDS(res_final, "_episodes_rmd/gleon-lakes_wikipedia.rds")

res_final <- readRDS("scripts/gleon-lakes_wikipedia.rds")

world  <- sf::st_as_sf(map("world", plot = FALSE, fill = TRUE))
res_sf <- st_as_sf(res_final, coords = c("Lon", "Lat"), crs = 4326)

ggplot() +
  geom_sf(data = world) +
  geom_sf(data = res_sf, color = "red", size = 5) +
  theme(plot.background = element_blank(),
        axis.text = element_text(size = 25))

ggsave("fig/gleon_map.pdf", width = 20, height = 20)

# plot.margin = margin(-25, 0, -25, 0, "cm")# https://gist.github.com/jsta/e486f337be6d5bcdb3aeb1335959de52
