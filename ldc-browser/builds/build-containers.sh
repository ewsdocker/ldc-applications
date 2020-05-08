#!/bin/bash
cd ~/Development/ewslms/ldc-browser

echo
echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-browser containers"
echo "   ****"
echo "   ********************************************"
echo

docker stop ldc-browser-netsurf-3.8
docker rm ldc-browser-netsurf-3.8

docker stop ldc-browser-ffquantum-67.0.4
docker rm ldc-browser-ffquantum-67.0.4

docker stop ldc-browser-palemoon-28.6.0.1
docker rm ldc-browser-palemoon-28.6.0.1

docker stop ldc-browser-waterfox-56.2.11
docker rm ldc-browser-waterfox-56.2.11

echo
echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-browser images"
echo "   ****"
echo "   ********************************************"
echo

docker rmi ewsdocker/ldc-browser:netsurf-3.8
docker rmi ewsdocker/ldc-browser:ffquantum-67.0.4
docker rmi ewsdocker/ldc-browser:palemoon-28.6.0.1
docker rmi ewsdocker/ldc-browser:waterfox-56.2.11

# ===========================================================================
#
#    ldc-browser:netsurf
#
# ===========================================================================

echo
echo "   **********************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-browser:netsurf containers"
echo "   ****"
echo "   **********************************************"
echo

builds/build-netsurf.sh
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-browser:netsurf failed."
 	exit 1
 }

# ===========================================================================
#
#    ldc-browser:ffquantum
#
# ===========================================================================

echo
echo "   ********************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-browser:ffquantum"
echo "   ****"
echo "   ********************************************"
echo

builds/build-ffquantum.sh
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-browser:ffquantum failed."
 	exit 2
 }

# ===========================================================================
#
#    ldc-browser:palemoon
#
# ===========================================================================

echo
echo "   ********************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-browser:palemoon"
echo "   ****"
echo "   ********************************************"
echo

builds/build-palemoon.sh
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-browser:palemoon failed."
 	exit 3
 }

# ===========================================================================
#
#    ldc-browser:waterfox
#
# ===========================================================================

echo
echo "   ********************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-browser:waterfox"
echo "   ****"
echo "   ********************************************"
echo

builds/build-waterfox.sh
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-browser:waterfox failed."
 	exit 4
 }

# ===========================================================================
# ===========================================================================

echo
echo "   **********************************************"
echo "   **********************************************"
echo "   ****"
echo "   **** ldc-browser modules successfully installed."
echo "   ****"
echo "   **********************************************"
echo "   **********************************************"
echo

clear
docker images

exit 0

