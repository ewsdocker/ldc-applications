#!/bin/bash
# ===========================================================================
#
#    ldc-console:tumblr-0.1.0-b4
#
# ===========================================================================

echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-console-tumblr container"
echo "   ****"
echo "   ********************************************"
echo
docker stop ldc-console-tumblr-0.1.0-b4
docker rm ldc-console-tumblr-0.1.0-b4

echo "   ***********************************************"
echo "   ****"
echo "   **** installing ldc-console-tumblr-0.1.0-b4 container"
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
  -e LMSLIB_VERS_MOD="-b4" \
  \
  -v ${HOME}/bin:/userbin \
  -v ${HOME}/.local:/usrlocal \
  -v ${HOME}/.config/docker:/conf \
  -v ${HOME}/.config/docker/ldc-console-tumblr-0.1.0-b4:/root \
  -v ${HOME}/.config/docker/ldc-console-tumblr-0.1.0-b4/workspace:/workspace \
  \
  -v ${HOME}/Downloads:/Downloads \
  -v ${HOME}/Pictures/Tumblr:/data \
  \
  --name=ldc-console-tumblr-0.1.0-b4 \
ewsdocker/ldc-console:tumblr-0.1.0-b4 
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-console:tumblr-0.1.0-b4 failed."
 	exit 2
 }

echo "   ********************************************"
echo "   ****"
echo "   **** ldc-console:tumblr-0.1.0-b4 successfully installed."
echo "   ****"
echo "   ********************************************"
echo

exit 0

