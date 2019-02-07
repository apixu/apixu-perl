# Apixu Perl

Perl module for [Apixu Weather API](https://www.apixu.com/api.aspx)

## Requirements
* [Perl](https://www.perl.org/get.html)
* [cpanm](https://metacpan.org/pod/distribution/App-cpanminus/bin/cpanm)
* curl
* make
* Modules
    * [LWP::UserAgent](https://metacpan.org/pod/LWP::UserAgent)
    * [JSON](https://metacpan.org/pod/JSON)

## Install module

Choose the version you want to install from the [releases page](https://github.com/apixu/apixu-perl/releases)
or choose `master` to install the latest updates.

#### cpanm

```
cpanm https://github.com/apixu/apixu-perl/archive/vX.X.X.tar.gz

```
or

```
cpanm https://github.com/apixu/apixu-perl/archive/master.tar.gz
```

#### Manually
```
git clone https://github.com/apixu/apixu-perl --branch vX.X.X --single-branch # or download repository
cd apixu-perl
git checkout vX.X.X
```

## Usage and integration with frameworks

See the [examples](./examples).

```
APIXUKEY=yourapikey ./examples/<file>.pl
```

## Documentation

https://www.apixu.com/doc/

## Development

You can use with Docker. See [Makefile-dev](Makefile-dev).

Enter environment:
```
make -f Makefile-dev env APIXUKEY=yourapikey
```

Run example file:
```
make -f Makefile-dev run APIXUKEY=yourapikey FILE=examples/<file>.pl
```
