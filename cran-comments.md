## Test environments
- R-hub windows-x86_64-devel (r-devel)
- R-hub ubuntu-gcc-release (r-release)
- R-hub fedora-clang-devel (r-devel)
- win-builder (devel and release)

## R CMD check results
0 errors ✓ | 0 warnings ✓ | 1 note x

* Note was to say that this is a new submission.

### Review 1 - 2019-11-21
>Please add \value to .Rd files regarding exported methods and explain
the functions results in the documentation. Please write about the
structure of the output (class) and also what the output means.

Added value to the documentation for all exported functions.
