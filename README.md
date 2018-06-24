# kairos-
Command line weather, using Yahoo Weather API

# compile using vgo

```
vgo build -ldflags "-X github.com/addodelgrossi/kairos/version.Version=`cat VERSION` -X github.com/addodelgrossi/kairos/version.BuildDate=`date -u +%Y-%m-%d_%H:%M:%S` -X github.com/addodelgrossi/kairos/version.GitHash=`git rev-parse HEAD` "
```


# testing

```
./kairos version
```