library(dplyr)
library(tidyr)
library(ggplot2)

plot_clusters <- function(dataset,nr_c, seed_nr,reordering = TRUE){
  set.seed(seed_nr)
  vol.cl <- kcca(dataset, 
                 k = nr_c, 
                 save.data = TRUE, 
                 control = fc_cont, 
                 family = kccaFamily(fc_family))
  vol.pca <-prcomp(dataset) ## plot on first two principal components 
  main_txt <- paste("kcca ", 
                    vol.cl@family@name, 
                    " - ",
                    nr_c, 
                    " clusters (",
                    nsamp, 
                    "k sample, seed = ", 
                    seed_nr,
                    ")", 
                    sep = "")
  if (reordering == TRUE){
    print("reordering")
    vol.cl <- fc_reorder(vol.cl,orderby= "descending size")
  }
  plot(vol.cl, data = dataset, project = vol.pca, main = main_txt)
  return(vol.cl)
}


fc_rclust <- function(x, k, fc_cont, nrep=100, fc_family,
                      verbose=FALSE, FUN = kcca, seed=1234, plotme=TRUE){
  num_clusters <- k
  fc_seed = seed
  cli_tries <- NULL    ## kcca objects will be saved here for review
  for (itry in 1:nrep) {
    fc_seed <- fc_seed + 1
    set.seed(fc_seed)
    cli <- flexclust::kcca(x, k, save.data = TRUE,
                           control = fc_cont, family = kccaFamily(fc_family))
    cli.re <- fc_reorder(cli, orderby = "decending size")
    cli_info <- cli.re@clusinfo %>%
      dplyr::mutate(clust_num = row_number(),
                    clust_rank = min_rank(desc(size))) %>%
      dplyr::arrange(clust_rank) %>%
      dplyr::select(c(6, 5, 1:4))
    cli_try <- cbind(data.frame(k = num_clusters, seed = fc_seed),
                     cli_info)
    cli_tries <- rbind(cli_tries, cli_try)
  }
  cli_tries <- as.tbl(cli_tries)
  
  cli_sizes <- cli_tries %>%
    dplyr::select(k, seed, clust_num, clust_rank, size) %>%
    dplyr::filter(clust_rank <= 2) %>%
    dplyr::mutate(clust_label = paste0("Size_", clust_rank),
                  in_order = clust_num == clust_rank) %>%
    dplyr::select(-clust_rank, -clust_num) %>%
    tidyr::spread(key = clust_label, value = size) %>%
    dplyr::group_by(k, seed) %>%
    dplyr::summarize(in_order = all(in_order),
                     Size_1 = min(Size_1, na.rm = TRUE),
                     Size_2 = min(Size_2, na.rm = TRUE))
  
  # get location of peak numerically with MASS:kde2d
  s2d <- with(cli_sizes, MASS::kde2d(Size_1, Size_2, n = 100))
  s2d_peak <- which(s2d$z == max(s2d$z))
  Size_1_peak_at <- round(s2d$x[s2d_peak %% 100], 1)
  Size_2_peak_at <- round(s2d$y[s2d_peak %/% 100], 1)
  
  if(plotme) {
    xend <- Size_1_peak_at + 100   ## needs smarter calculation of this.
    yend <- Size_2_peak_at + 100
    p <- ggplot2::ggplot(cli_sizes, ggplot2::aes(Size_1, Size_2)) +
      ggplot2::geom_point(alpha = 0.5, size = 2) +
      ggplot2::stat_density2d() +
      ggplot2::annotate("segment", x = Size_1_peak_at, y = Size_2_peak_at,
                        xend = xend, yend = yend, color = "red", size = 1) +
      ggplot2::annotate("text", xend, yend,
                        label = paste0("(", Size_1_peak_at, ", ",
                                       Size_2_peak_at, ")"), vjust = 0) +
      ggplot2::ggtitle(paste0("Size of Cluster 2 by Size of Cluster 1 for k=", k,
                              ", # tries=", nrep))
    print(p)
  }
  
  cli_best <- cli_sizes %>%
    dplyr::mutate(distance = sqrt((Size_1 - Size_1_peak_at)^2 + (Size_2 - Size_2_peak_at)^2)) %>%
    dplyr::arrange(distance) %>%
    dplyr::slice(1:10)
  
  return(list(best = cli_best,
              sizes = cli_sizes,
              peak_at = c(Size_1_peak_at, Size_2_peak_at),
              tries = cli_tries))
}

fc_reorder <- function(x, orderby = "decending size") {
  ko <- x
  cl_map <- order(ko@clusinfo$size, decreasing = TRUE)
  ko@second <- cl_map[ko@second]
  ko@clsim <- ko@clsim[cl_map, cl_map]
  ko@centers <- ko@centers[cl_map, ]
  ko@cluster <- cl_map[ko@cluster]
  ko@clusinfo <- ko@clusinfo[cl_map, ]
  #ko@reorder <- cl_map    #add slot with reorder mapping
  return(ko)
}
