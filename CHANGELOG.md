# CHANGELOG

## 2020-07-26
### Changed
- Upstream fixed the invalid first argument error

## 2020-07-20
### Changed
- Downgrade browser-sync to 2.26.7 due to upstream issues

## 2020-04-13
### Added
- .dockerignore
### Changed
- Renamed entrypoint
- ENV formated
- dumb-init is now in the entrypoint's shebang
- Move entrypoint script instead of symlinking it
- Changing ownership of /usr/local/bin to root
- Travis-CI
    - Output version in a file
    - Commit version file first before committing the rest
    - Run container in the background
    - Update version commands
### Removed
