# PHP dockerfiles

## `5.6-fpm-pgsql.legacy.dockerfile`

A 4chan docker file with
- Postgres

Since this is a old version of php, the packages list are first added before the main packages are installed

## `8.4.6-fpm-basic.dockerfile`

just php 8.4.6-fpm

### Extentions
- ZIP

## `8.4.6-fpm-pgsql.dockerfile`

PHP with pgsql as its database

### Extentions
- ZIP
- PGSQL

## `8.4.6-fpm-pnginfo.dockerfile`

A purpose built dockerfile to look up and store pnginfo data from ai generated images that has tags stored from stable diffusion web ui

### Extentions
- ZIP
- PGSQL

### Packages
- PYTHON
- FFMPEG

