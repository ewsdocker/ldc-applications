#!/bin/bash
# ===========================================================================
#
#    ldc-console:nano-0.1.0-b1
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-console

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-console-nano container"
echo "   ****"
echo "   ********************************************"
echo
docker rm ldc-console-nano-0.1.0-b1

echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-console:nano images"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-console:nano-0.1.0-b1

echo "   ********************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-console:nano-0.1.0-b1"
echo "   ****"
echo "   ********************************************"
echo
docker build \
  --build-arg CLI_APP="NANO" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="run" \
  --build-arg RUN_APP="nano" \
  \
  --build-arg BUILD_NAME="ldc-console" \
  --build-arg BUILD_VERSION="nano" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b1" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-base" \
  --build-arg FROM_VERS="dbase" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b1" \
  \
  --build-arg LIB_INSTALL=0 \
  --build-arg LIB_VERSION=0.1.6 \
  --build-arg LIB_VERS_MOD="-b1" \
  \
  --build-arg LIB_HOST=http://alpine-nginx-pkgcache \
  --network=pkgnet \
  \
  --file Dockerfile.dconsole \
  \
  -t ewsdocker/ldc-console:nano-0.1.0-b1  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-console:nano-0.1.0-b1 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-console-nano-0.1.0-b1 container"
echo "   ****"
echo "   ***********************************************"
echo

docker run \
  -it \
  \
  -v /etc/localtime:/etc/localtime:ro \
  \
  -e LMS_HOME="${HOME}" \
  -e LMS_BASE="${HOME}/.local" \
  -e LMS_CONF="${HOME}/.config" \
  \
  -e LMSOPT_QUIET="0" \
  \
  -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.config/docker:/conf \
  -v ${HOME}/.config/docker/ldc-console-nano-0.1.0-b1:/root \
  -v ${HOME}/.config/docker/ldc-console-nano-0.1.0-b1/workspace:/workspace \
  \
  -v ${HOME}/Downloads:/Downloads \
  \
  -e LMSLIB_INST="0" \
  -e LMSLIB_HOST=http://alpine-nginx-pkgcache \
  -e LMSLIB_VERS="0.1.6" \
  -e LMSLIB_VERS_MOD="-b1" \
  \
  --name=ldc-console-nano-0.1.0-b1 \
ewsdocker/ldc-console:nano-0.1.0-b1 
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-console:nano-0.1.0-b1 failed."
 	exit 1
 }

# ===========================================================================
# ===========================================================================

echo "   ********************************************"
echo "   ****"
echo "   **** ldc-console:nano-0.1.0-b1 successfully installed."
echo "   ****"
echo "   ********************************************"
echo

exit 0

