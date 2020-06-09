#!/bin/bash
# ===========================================================================
#
#    ldc-console:tumblr-0.1.0-b2
#
# ===========================================================================
cd ~/Development/ewsldc/ldc-applications/console

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-console-tumblr container"
echo "   ****"
echo "   ********************************************"
echo
docker rm ldc-console-tumblr-0.1.0-b2

echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-console:tumblr images"
echo "   ****"
echo "   ********************************************"
echo
docker rmi ewsdocker/ldc-console:tumblr-0.1.0-b2

echo "   ********************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-console:tumblr-0.1.0-b2"
echo "   ****"
echo "   ********************************************"
echo
docker build \
  --build-arg CLI_APP="TMBL" \
  \
  --build-arg BUILD_DAEMON="0" \
  --build-arg BUILD_TEMPLATE="run" \
  --build-arg RUN_APP="tumblr" \
  \
  --build-arg BUILD_NAME="ldc-console" \
  --build-arg BUILD_VERSION="tumblr" \
  --build-arg BUILD_VERS_EXT="-0.1.0" \
  --build-arg BUILD_EXT_MOD="-b2" \
  \
  --build-arg FROM_REPO="ewsdocker" \
  --build-arg FROM_PARENT="ldc-base" \
  --build-arg FROM_VERS="dbase" \
  --build-arg FROM_EXT="-0.1.0" \
  --build-arg FROM_EXT_MOD="-b2" \
  \
  --build-arg LIB_INSTALL=0 \
  --build-arg LIB_VERSION=0.1.6 \
  --build-arg LIB_VERS_MOD="-b2" \
  \
  --build-arg LIB_HOST=http://alpine-nginx-pkgcache \
  --network=pkgnet \
  \
  --file Dockerfile \
  \
  -t ewsdocker/ldc-console:tumblr-0.1.0-b2  .
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-console:tumblr-0.1.0-b2 failed."
 	exit 1
 }

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-console-tumblr-0.1.0-b2 container"
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
  -e LMSLIB_INST="0" \
  -e LMSLIB_HOST=http://alpine-nginx-pkgcache \
  -e LMSLIB_VERS="0.1.6" \
  -e LMSLIB_VERS_MOD="-b2" \
  \
  -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.config/docker:/conf \
  -v ${HOME}/.config/docker/ldc-console-tumblr-0.1.0-b2:/root \
  -v ${HOME}/.config/docker/ldc-console-tumblr-0.1.0-b2/workspace:/workspace \
  \
  -v ${HOME}/Downloads:/Downloads \
  -v ${HOME}/Pictures/Tumblr:/data \
  \
  --name=ldc-console-tumblr-0.1.0-b2 \
ewsdocker/ldc-console:tumblr-0.1.0-b2 
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-console:tumblr-0.1.0-b2 failed."
 	exit 1
 }

# ===========================================================================
# ===========================================================================

echo "   ********************************************"
echo "   ****"
echo "   **** ldc-console:tumblr-0.1.0-b2 successfully installed."
echo "   ****"
echo "   ********************************************"
echo

exit 0

