#!/bin/bash
cd ~/Development/ewslms/ldc-desktop

echo
echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-browser containers"
echo "   ****"
echo "   ********************************************"
echo

docker stop ldc-browser-netsurf-3.8
docker rm ldc-browser-netsurf-3.8

docker stop ldc-browser-ffquantum-66.0.4
docker rm ldc-browser-ffquantum-66.0.4

docker stop ldc-browser-palemoon-28.4.1
docker rm ldc-browser-palemoon-28.4.1

docker stop ldc-browser-waterfox-56.2.8
docker rm ldc-browser-waterfox-56.2.8

echo
echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-browser images"
echo "   ****"
echo "   ********************************************"
echo

docker rmi ewsdocker/ldc-browser:netsurf-3.8
docker rmi ewsdocker/ldc-browser:ffquantum-66.0.4
docker rmi ewsdocker/ldc-browser:palemoon-28.4.1
docker rmi ewsdocker/ldc-browser:waterfox-56.2.8

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

./build-netsurf.sh
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-browser:netsurf failed."
 	exit 1
 }

# ===========================================================================
#
#    ldc-browser:ffquantum-66.0.4
#
# ===========================================================================

echo
echo "   ********************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-browser:ffquantum"
echo "   ****"
echo "   ********************************************"
echo

./build-ffquantum.sh
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-browser:ffquantum failed."
 	exit 2
 }

# ===========================================================================
#
#    ldc-browser:palemoon-28.4.1
#
# ===========================================================================

echo
echo "   ********************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-browser:palemoon"
echo "   ****"
echo "   ********************************************"
echo

./build-palemoon.sh
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-browser:palemoon failed."
 	exit 3
 }

# ===========================================================================
#
#    ldc-browser:waterfox-56.2.7.1
#
# ===========================================================================

echo
echo "   ********************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-browser:waterfox"
echo "   ****"
echo "   ********************************************"
echo

./build-waterfox.sh
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

