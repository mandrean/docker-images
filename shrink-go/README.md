mandrean/shrink-go
==================
Compiles, strips and compresses statically linked Go binaries into their smallest possible size.

Typically let's you save around 70-80 % in file size.

Based on go1.9 and Alpine 3.6.

Pre-requisites
--------------
* [Docker](https://docs.docker.com/engine/installation/)

Usage
-----
Send your Go project import path as the only argument to the build container, and mount your `GOPATH` or Go project into it:

```sh
docker run --rm -it \
	-v $(GOPATH):/go \
	mandrean/shrink-go \
	github.com/your-name/your-project
```

Or just the Go project it self:
```sh
PROJ=github.com/your-name/your-project && \
docker run --rm -it \
	-v ~/go/src/$PROJ:/go/src/$PROJ \
	mandrean/shrink-go \
	$PROJ
```

The compressed binary will be outputted next to the compiled & stripped one in the same folder.

Maintainers
-----------
* Sebastian Mandrean (<sebastian.mandrean@gmail.com>)
