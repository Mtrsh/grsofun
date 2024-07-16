# issue described by Myriam Terristi (unnumbered, not on github):
# error when making land mask tidy

> rlang::last_trace()
<error/purrr_error_indexed>
Error in `purrr::map()`:
ℹ In index: 1.
Caused by error in `purrr::map()`:
ℹ In index: 1.
Caused by error in `nc_atts.NetCDF()`:
! specified variable not found
---
Backtrace:
     ▆
  1. ├─map2tidy::map2tidy(...)
  2. │ └─purrr::map(...)
  3. │   └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
  4. │     ├─purrr:::with_indexed_errors(...)
  5. │     │ └─base::withCallingHandlers(...)
  6. │     ├─purrr:::call_with_cleanup(...)
  7. │     └─map2tidy (local) .f(.x[[i]], ...)
  8. │       └─map2tidy::nclist_to_df_byilon(...)
  9. │         └─purrr::map(...)
 10. │           └─purrr:::map_("list", .x, .f, ..., .progress = .progress)
 11. │             ├─purrr:::with_indexed_errors(...)
 12. │             │ └─base::withCallingHandlers(...)
 13. │             ├─purrr:::call_with_cleanup(...)
 14. │             └─map2tidy (local) .f(.x[[i]], ...)
 15. │               └─map2tidy::nclist_to_df_byfil(...)
 16. │                 ├─... %>% lubridate::ymd()
 17. │                 ├─ncmeta::nc_atts(filnam, timenam)
 18. │                 └─ncmeta:::nc_atts.character(filnam, timenam)
 19. │                   ├─ncmeta::nc_atts(nc, variable = variable)
 20. │                   └─ncmeta:::nc_atts.NetCDF(nc, variable = variable)
 21. │                     └─base::stop("specified variable not found")
 22. ├─lubridate::ymd(.)
 23. │ └─lubridate:::.parse_xxx(...)
 24. │   ├─base::unlist(lapply(list(...), .num_to_date), use.names = FALSE)
 25. │   └─base::lapply(list(...), .num_to_date)
 26. ├─stringr::str_remove(., " 0:0:0")
 27. │ └─stringr::str_replace(string, pattern, "")
 28. │   └─stringr:::check_lengths(string, pattern, replacement)
 29. │     └─vctrs::vec_size_common(...)
 30. ├─stringr::str_remove(., " 00:00:00")
 31. │ └─stringr::str_replace(string, pattern, "")
 32. │   └─stringr:::check_lengths(string, pattern, replacement)
 33. │     └─vctrs::vec_size_common(...)
 34. ├─stringr::str_remove(., "days since ")
 35. │ └─stringr::str_replace(string, pattern, "")
 36. │   └─stringr:::check_lengths(string, pattern, replacement)
 37. │     └─vctrs::vec_size_common(...)
 38. ├─dplyr::pull(., value)
 39. ├─dplyr::filter(., name == "units")
 40. └─tidyr::unnest(., cols = c(value))
