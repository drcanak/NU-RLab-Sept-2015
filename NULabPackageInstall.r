
need <- c("pacman","RCurl", "bitops", "assertive") # needed packages for job
ins <- installed.packages()[,1]                    # find out which packages are installed
Get <- need[which(is.na(match(need,ins)))]         # check if the needed packages are installed
if(length(Get) > 0){install.packages(Get)}         # install the needed packages if they are not-installed
eval(parse(text=paste("library(",need,")")))       # load the needed packages

x <- getURL("https://raw.githubusercontent.com/drcanak/NU-RLab-Sept-2015/master/NULabPackages.txt", ssl.verifypeer=FALSE)
NULabPackages <- read.csv(text=x)
NULabPackages <- as.vector(NULabPackages$ReqPackage)

TestOS <- is_windows()
if (TestOS == TRUE) {
  os <- "win.binary"
} else {
  os <- "mac.binary"
}

p_install(NULabPackages, character.only = TRUE, 
          dependencies = FALSE, repos="http://watson.nci.nih.gov/cran_mirror/",
          type = os)