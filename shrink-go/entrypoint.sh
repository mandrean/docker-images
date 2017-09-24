#!/bin/sh

PROJ=$1

printf "\nInitiating shrink-go for $PROJ... "
cd $PROJ
if [ $? -ne 0 ]; then
    echo -e "ERROR: Couldn't find $GOPATH/src/$PROJ"
    echo -e "Aborting."
    exit 1
fi
printf "Done.\n"

printf "Building statically linked binary with stripped symbols... "
go build -a -installsuffix cgo -ldflags="-s -w"
if [ $? -ne 0 ]; then
    echo -e "ERROR: Couldn't build $PROJ"
    echo -e "Aborting."
    exit 1
fi
printf "Done.\n"


printf "Packing with upx...\n"
DIR=$(basename "$PWD")
upx -f -o $DIR-upx $DIR
if [ $? -ne 0 ]; then
    echo -e "ERROR: Couldn't pack $PROJ with upx"
    echo -e "Aborting."
    exit 1
fi

echo "Successfully shrunk $PROJ!"
echo "Done."
