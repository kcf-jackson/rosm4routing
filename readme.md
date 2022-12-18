## R bindings to the Rust library 'osm4routing' 

- 'osm4routing' converts OpenStreetMap PBF files to CSV files (node and edge lists) for routing applications. See the original repository [here](https://github.com/Tristramg/osm4routing2). 

- This repository provides the R **binary** package to eliminate the need to install Rust. This is especially useful for Windows users, as Rust requires admin access on some Windows machines.

- The source is included for reference only. Building the package from source would require Rust, which defeats the purpose of this repository.

- The binary packages are stored in the `dist` folder. Use `pc-linux-gnu.tar.gz` for Linux, `.tgz` for MacOS and `.zip` for Windows. 


### Installation

```{r}
# Linux
install.packages("rosm4routing_0.1.0_R_x86_64-pc-linux-gnu.tar.gz", source = TRUE, repo = NULL)

# MacOS
install.packages("rosm4routing_0.1.0.tgz", source = TRUE, repo = NULL)

# Windows
install.packages("rosm4routing_0.1.0.zip", source = TRUE, repo = NULL)
```

### Usage

There is only one function in this package. It takes a `.pbf` file and split it into `edges.csv` and `nodes.csv` for routing applications.

```{r}
# Get 'Brisbane.osm.pbf` from https://download.bbbike.org/osm/bbbike/Brisbane/
rosm4routing::rosm4routing("Brisbane.osm.pbf")
```

Output

```{r}
> head(read.csv("nodes.csv"))
           id      lon       lat
1 10086857644 152.8021 -27.62345
2    80978807 153.0568 -27.40295
3   267203102 153.0865 -27.23121
4   276407951 152.9316 -27.18895
5  6572315523 153.0678 -27.43544
6  8081434199 153.1080 -27.54809

> tibble::tibble(head(read.csv("edges.csv")))
# A tibble: 6 × 10
       id     source   target length  foot car_f…¹ car_b…² bike_…³ bike_…⁴ wkt  
    <int>      <dbl>    <dbl>  <dbl> <int>   <int>   <int>   <int>   <int> <chr>
1 4048902  332825509   1.13e9  426.      0       6       0       0       0 LINE…
2 4048902 1133399119   3.33e8  186.      0       6       0       0       0 LINE…
3 4048903 9803891734   2.15e7  290.      0       6       0       0       0 LINE…
4 4049656   21476058   4.72e9   88.0     0       6       0       0       0 LINE…
5 4049686  602768546   6.03e8   17.0     0       6       0       0       0 LINE…
6 4049687   99987215   6.08e7   58.5     1       4       0       2       0 LINE…
# … with abbreviated variable names ¹​car_forward, ²​car_backward, ³​bike_forward,
#   ⁴​bike_backward

```



