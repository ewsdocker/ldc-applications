#!/bin/bash
cd ~/Development/ewslms/ldc-eclipse

echo
echo "   ********************************************"
echo "   ****"
echo "   **** stopping ldc-eclipse containers"
echo "   ****"
echo "   ********************************************"
echo

docker rm ldc-eclipse-dcdt-0.1.0-gpp-6
docker rm ldc-eclipse-djs-0.1.0-njs11
docker rm ldc-eclipse-dpdt-0.1.0-php5.6

echo
echo "   ********************************************"
echo "   ****"
echo "   **** removing ldc-eclipse images"
echo "   ****"
echo "   ********************************************"
echo

docker rmi ewsdocker/ldc-eclipse:dcdt-0.1.0-gpp-6
docker rmi ewsdocker/ldc-eclipse:djs-0.1.0-njs11
docker rmi ewsdocker/ldc-eclipse:dpdt-0.1.0-php5.6

# ===========================================================================
#
#    ldc-eclipse:dcdt-0.1.0
#
# ===========================================================================

echo
echo "   **********************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-eclipse:dcdt containers"
echo "   ****"
echo "   **********************************************"
echo

builds/build-dcdt.sh
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-eclipse:dcdt failed."
 	exit 1
 }

# ===========================================================================
#
#    ldc-eclipse:djs-0.1.0
#
# ===========================================================================

echo
echo "   ********************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-eclipse:djs"
echo "   ****"
echo "   ********************************************"
echo
builds/build-djs.sh
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-eclipse:djs-njs11 failed."
 	exit 2
 }

# ===========================================================================
#
#    ldc-eclipse:dpdt-0.1.0
#
# ===========================================================================

echo "   ********************************************"
echo "   ****"
echo "   **** building ewsdocker/ldc-eclipse:dpdt"
echo "   ****"
echo "   ********************************************"
echo
builds/build-dpdt.sh
[[ $? -eq 0 ]] ||
 {
 	echo "build ewsdocker/ldc-eclipse:dpdt failed."
 	exit 3
 }

# ===========================================================================
# ===========================================================================

echo "   **********************************************"
echo "   **********************************************"
echo "   ****"
echo "   **** ldc-eclipse modules successfully installed."
echo "   ****"
echo "   **********************************************"
echo "   **********************************************"
echo

clear
docker images

exit 0

