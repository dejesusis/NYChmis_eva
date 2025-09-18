# 1. Install RInno and jsonlite if not already present
if (!requireNamespace("RInno", quietly = TRUE)) {
  install.packages("RInno")
}
if (!requireNamespace("jsonlite", quietly = TRUE)) {
  install.packages("jsonlite")
}
# 2. Read and parse the renv.lock file
lockfile_data <- jsonlite::read_json("renv.lock")

# 3. Extract the names of all packages
packages_from_renv <- names(lockfile_data$Packages)

# 4. Create the RInno app using the extracted package list
RInno::create_app(
  app_name = "Eva_Site",
  pkgs = packages_from_renv,
  #include_R = TRUE, # Recommended for a complete and reproducible installation
  app_dir = getwd() # Assumes your app files are in the current directory
)

# 5. Compile the Inno Setup installer
RInno::compile_iss()

#devtools::install_github('talgalili/installr')