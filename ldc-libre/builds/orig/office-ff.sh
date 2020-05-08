#!/bin/bash
cd ~/Development/ewslms/ldc-desktop

echo "   ********************************************"
echo "   ****"
echo "   **** stopping office container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rm ldc-desktop-office-6.2.3-ff

echo "   ********************************************"
echo "   ****"
echo "   **** removing office image(s)"
echo "   ****"
echo "   ********************************************"
echo

docker rmi ewsdocker/ldc-desktop:office-6.2.3-ff

# ===========================================================================
#
#    ldc-desktop:office-6.2.3-ff
#
# ===========================================================================

echo
echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-desktop:office-6.2.3-ff"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
      --build-arg OFFICE_VER="6.2.3" \
      \
      --build-arg LINK2="0" \
      --build-arg ELINK="0" \
      --build-arg NETSURF="0" \
      --build-arg PALEMOON="0" \
      --build-arg FIREFOX="1" \
      \
      --build-arg NETSURF_HOST=http://alpine-nginx-pkgcache \
      --build-arg PALEMOON_HOST=http://alpine-nginx-pkgcache \
      --build-arg FIREFOX_HOST=http://alpine-nginx-pkgcache \
      \
      --build-arg OFFICE_HOST=http://alpine-nginx-pkgcache \
      --build-arg LIB_HOST=http://alpine-nginx-pkgcache \
      --network=pkgnet \
      \
      --file Dockerfile.dlibre \
  -t ewsdocker/ldc-desktop:office-6.2.3-ff  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-desktop:office-6.2.3-ff failed."
 	exit 1
 }

echo
echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-desktop-office-6.2.3-ff"
echo "   ****"
echo "   ***********************************************"
echo

docker create \
      -it \
      -e LRUN_APP="libreoffice" \
      \
      -v ${HOME}/bin:/userbin \
      -v ${HOME}/.local:/usrlocal \
      -v ${HOME}/.config/docker:/conf \
      -v ${HOME}/.config/docker/ldc-desktop-office-6.2.3-ff:/root \
      -v ${HOME}/.config/docker/ldc-desktop-office-6.2.3-ff/workspace:/workspace \
      \
      -e DISPLAY=unix${DISPLAY} \
      -v ${HOME}/.Xauthority:/root/.Xauthority \
      -v /tmp/.X11-unix:/tmp/.X11-unix \
      -v /dev/shm:/dev/shm \
      --device /dev/snd \
      \
      -v ${HOME}/Documents:/documents \
      -v ${HOME}/Source:/source \
      \
      --name=ldc-desktop-office-6.2.3-ff \
    ewsdocker/ldc-desktop:office-6.2.3-ff
[[ $? -eq 0 ]] ||
 {
 	echo "create container ldc-desktop-office-6.2.3-ff failed."
 	exit 1
 }

echo
echo "   ****************************************************************"
echo "   ****"
echo "   **** ldc-desktop:office-6.2.3-ff successfully installed."
echo "   ****"
echo "   **** run with "
echo "   ****    docker start ldc-desktop-office-6.2.3-ff"
echo "   ****"
echo "   ****************************************************************"
echo
echo

exit 0

