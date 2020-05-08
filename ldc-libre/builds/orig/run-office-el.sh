#!/bin/bash
cd ~/Development/ewslms/ldc-libre

echo "   ********************************************"
echo "   ****"
echo "   **** stopping office container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rm ldc-libre-office-6.2.3-el

echo "   ********************************************"
echo "   ****"
echo "   **** removing office image(s)"
echo "   ****"
echo "   ********************************************"
echo

docker rmi ewsdocker/ldc-libre:office-6.2.3-el

# ===========================================================================
#
#    ldc-libre:office-6.2.3-el
#
# ===========================================================================

echo
echo "   ***************************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-libre:office-6.2.3-el"
echo "   ****"
echo "   ***************************************************"
echo

docker build \
      --build-arg OFFICE_VER="6.2.3" \
      \
      --build-arg LINK2="0" \
      --build-arg ELINK="1" \
      --build-arg NETSURF="0" \
      --build-arg PALEMOON="0" \
      --build-arg FIREFOX="0" \
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
  -t ewsdocker/ldc-libre:office-6.2.3-el  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-libre:office-6.2.3-el failed."
 	exit 1
 }

echo
echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-libre-office-6.2.3-el"
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
      -v ${HOME}/.config/docker/ldc-libre-office-6.2.3-el:/root \
      -v ${HOME}/.config/docker/ldc-libre-office-6.2.3-el/workspace:/workspace \
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
      --name=ldc-libre-office-6.2.3-el \
    ewsdocker/ldc-libre:office-6.2.3-el
[[ $? -eq 0 ]] ||
 {
 	echo "create container ldc-libre-office-6.2.3-el failed."
 	exit 1
 }

echo
echo "   ****************************************************************"
echo "   ****"
echo "   **** ldc-libre:office-6.2.3-el successfully installed."
echo "   ****"
echo "   **** run with "
echo "   ****    docker start ldc-libre-office-6.2.3-el"
echo "   ****"
echo "   ****************************************************************"
echo
echo

exit 0

