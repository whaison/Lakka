#!/bin/bash

rm -rf target/

>&2 echo "Generic.x86_64"
DISTRO=Lakka PROJECT=Generic ARCH=x86_64 make image -j9
>&2 echo "Generic.i386"
DISTRO=Lakka PROJECT=Generic ARCH=i386 make image -j9
>&2 echo "Generic.x86_64 UEFI"
DISTRO=Lakka PROJECT=Generic ARCH=x86_64 UEFI="yes" make image -j9
>&2 echo "Generic.i386 UEFI"
DISTRO=Lakka PROJECT=Generic ARCH=i386 UEFI="yes" make image -j9
>&2 echo "RPi.arm"
DISTRO=Lakka PROJECT=RPi ARCH=arm make image -j9
>&2 echo "RPi.arm noobs"
DISTRO=Lakka PROJECT=RPi ARCH=arm make noobs -j9
>&2 echo "RPi2.arm"
DISTRO=Lakka PROJECT=RPi2 ARCH=arm make image -j9
>&2 echo "RPi2.arm noobs"
DISTRO=Lakka PROJECT=RPi2 ARCH=arm make noobs -j9
>&2 echo "imx6.cuboxi.arm"
DISTRO=Lakka PROJECT=imx6 SYSTEM=cuboxi ARCH=arm make image -j9
>&2 echo "imx6.udoo.arm"
DISTRO=Lakka PROJECT=imx6 SYSTEM=udoo ARCH=arm make image -j9
>&2 echo "a20.arm"
DISTRO=Lakka PROJECT=a20 ARCH=arm make image -j9
>&2 echo "a10.arm"
DISTRO=Lakka PROJECT=a10 ARCH=arm make image -j9
>&2 echo "Bananapi.arm"
DISTRO=Lakka PROJECT=Bananapi ARCH=arm make image -j9
>&2 echo "OdroidC1.arm"
DISTRO=Lakka PROJECT=OdroidC1 ARCH=arm make image -j9
>&2 echo "OdroidXU3.arm"
DISTRO=Lakka PROJECT=OdroidXU3 ARCH=arm make image -j9
>&2 echo "WeTek_Play.arm"
DISTRO=Lakka PROJECT=WeTek_Play ARCH=arm make image -j9
>&2 echo "WeTek_Core.arm"
DISTRO=Lakka PROJECT=WeTek_Core ARCH=arm make image -j9
>&2 echo "H3.op2.arm"
DISTRO=Lakka PROJECT=H3 SYSTEM=opi2 ARCH=arm make image -j9
>&2 echo "H3.opipc.arm"
DISTRO=Lakka PROJECT=H3 SYSTEM=opipc ARCH=arm make image -j9
>&2 echo "H3.opiplus.arm"
DISTRO=Lakka PROJECT=H3 SYSTEM=opiplus ARCH=arm make image -j9
>&2 echo "H3.opione.arm"
DISTRO=Lakka PROJECT=H3 SYSTEM=opione ARCH=arm make image -j9
>&2 echo "H3.opilite.arm"
DISTRO=Lakka PROJECT=H3 SYSTEM=opilite ARCH=arm make image -j9
>&2 echo "H3.bpim2p.arm"
DISTRO=Lakka PROJECT=H3 SYSTEM=bpim2p ARCH=arm make image -j9
>&2 echo "H3.opiplus2e.arm"
DISTRO=Lakka PROJECT=H3 SYSTEM=opiplus2e ARCH=arm make image -j9
>&2 echo "H3.opipcplus.arm"
DISTRO=Lakka PROJECT=H3 SYSTEM=opipcplus ARCH=arm make image -j9
>&2 echo "H3.bpim3.arm"
DISTRO=Lakka PROJECT=H3 SYSTEM=bpim3 ARCH=arm make image -j9
>&2 echo "H3.bx2.arm"
DISTRO=Lakka PROJECT=H3 SYSTEM=bx2 ARCH=arm make image -j9

rm target/*.kernel
rm target/*.system

for f in target/*; do
  md5sum $f > $f.md5
  sha256sum $f > $f.sha256
done

for f in target/*; do
  dir=`echo $f | sed -e 's/target\/Lakka-\(.*\)-devel-\(.*\)/\1/'`
  mkdir -p target/$dir
  mv $f target/$dir/
done

#scp -r target/* lakka@sources.lakka.tv:sources/nightly/
