## Release summary
This is a minor release to update the style sheets to the latest release plus
adding a couple of new components. 

## Test environments
- R-hub windows-x86_64-devel (r-devel)
- R-hub ubuntu-gcc-release (r-release)
- R-hub fedora-clang-devel (r-devel)
- win-builder (devel and release)

One note from Windows Server 2022, R-devel, 64 bit

```
* checking for detritus in the temp directory ... NOTE
Found the following files/directories:
  'lastMiKTeXException'
```
A github search suggests this is isolate to that setup on rhub and is not an 
issue.  In addition, I can't replicate the issue on any local builds.

## R CMD check results
0 errors v | 0 warnings v | 0 note v


