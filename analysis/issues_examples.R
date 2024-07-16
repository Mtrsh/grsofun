# issue described by Myriam Terristi (unnumbered, not on github):
# error when making land mask tidy

settings <- list(
  fileprefix = "test",  # simulation name defined by the user
  model = "pmodel",     # in future could also be "biomee", but not yet implemented
  year_start = 2018,    # xxx not yet handled
  year_end = 2018,      # xxx not yet handled
  grid = list(          # a list specifying the grid which must be common to all forcing data
    lon_start = -179.75,
    dlon = 0.5,
    len_ilon = 720,
    lat_start = -89.75,
    dlat = 0.5,
    len_ilat = 360
  ),
  file_landmask = "/Net/Groups/BGI/scratch/mterristi/PhD/Pmodel/grsofun/data/elevation/WFDEI-elevation.nc",
  dir_landmask_tidy = "/Net/Groups/BGI/scratch/mterristi/PhD/Pmodel/grsofun/data/elevation/WFDEI-elevation_tidy/",
  file_elv = "/Net/Groups/BGI/scratch/mterristi/PhD/Pmodel/grsofun/data/elevation/WFDEI-elevation.nc",
  dir_elv_tidy = "/Net/Groups/BGI/scratch/mterristi/PhD/Pmodel/grsofun/data/elevation/WFDEI-elevation_tidy/",
  save_drivers = TRUE,   # whether rsofun driver object is to be saved. Uses additional disk space but substantially speeds up grsofun_run().
  dir_drivers = here::here("input/tidy/"),  # path where rsofun drivers are to be written
  overwrite = FALSE,    # whether files with tidy forcing data and drivers are to be overwritten. If false, reads files if available instead of re-creating them.
  spinupyears = 10,     # model spin-up length
  recycle = 1,          # climate forcing recycling during the spinup
  dir_out = here::here("output/tidy/"),     # path for tidy model output
  dir_out_nc = "xxx",  # xxx not yet handled
  save = list(         # a named list where names correspond to variable names in rsofun output and the value is a string specifying the temporal resolution to which global output is to be aggregated. 
    gpp = "mon"
  ),
  nthreads = 1,   # distribute to multiple nodes for high performance computing - xxx not yet implemented
  ncores_max = 1  # set to 1 for un-parallel run
)

error <- map2tidy::map2tidy(
  nclist = settings$file_landmask,
  varnam = "elevation",
  lonnam = "lon",
  latnam = "lat",
  timenam= NA,
  timedimnam= NA,
  do_chunks = TRUE,
  outdir = settings$dir_landmask_tidy,
  fileprefix = "WFDEI-elevation",
  overwrite = settings$overwrite
)


Error in `purrr::map()`:
ℹ In index: 1.
Caused by error in `purrr::map()`:
ℹ In index: 1.
Caused by error in `nc_atts.NetCDF()`:
! specified variable not found
