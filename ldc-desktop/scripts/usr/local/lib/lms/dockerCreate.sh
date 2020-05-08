#!/bin/bash
cd ~/Development/ewslms/ldc-desktop

# ****************************************************

declare -a cNames=( "ldc-utilities" 
                    "ldc-core" 
                    "ldc-lang" 
                    "ldc-browser"
                    "ldc-libre" 
                    "ldc-desktop" 
                    "ldc-eclipse" )

declare -a cVersions=( "dcore" "dgui" )

declare -a cMods=( )

# ****************************************************

declare    cRepo="ewsdocker"
declare    cName=""
declare    cVersion=""
declare    cVersExt=""
declare    cExtMod=""

# ****************************************************

function setupImage()
{
	cRepo=${1:-"$cRepo"}
	cName=${2:-"$cName"}
	cVersion=${3:-"$cVersion"}
	cMod=${4:-"$cMod"}
}

function buildImage()
{
    local type=${1:-"create"}
	local docker=${2:-"Dockerfile"}
	local image=${3:-"$cRepo/$cName:$cVersion-$cMod"}
	local opts=${4:-""}
	
    docker ${type} ${opts} --file ${docker} ${image}
    [[ $? -eq 0 ]] ||
     {
     	echo "The following docker command failed:"
     	echo
     	echo "    \"docker ${type} ${opts} --file ${docker} ${image}\""
     	echo "    *****************************************************"
     	return 1
     }

    docker "build" "
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
    ewsdocker/ldc-desktop:office-6.2.3-el
}

echo "   ********************************************"
echo "   ****"
echo "   **** stopping office container(s)"
echo "   ****"
echo "   ********************************************"
echo
docker rm ldc-desktop-office-6.2.3-el

echo
echo "   ****************************************************"
echo "   ****"
echo "   **** creating container ldc-desktop-office-6.2.3-el"
echo "   ****"
echo "   ****************************************************"
echo

docker create \
      -it \
      -e LRUN_APP="libreoffice" \
      \
      -v ${HOME}/bin:/userbin \
      -v ${HOME}/.local:/usrlocal \
      -v ${HOME}/.config/docker:/conf \
      -v ${HOME}/.config/docker/ldc-desktop-office-6.2.3-el:/root \
      -v ${HOME}/.config/docker/ldc-desktop-office-6.2.3-el/workspace:/workspace \
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
      --name=ldc-desktop-office-6.2.3-el \
    ewsdocker/ldc-desktop:office-6.2.3-el
[[ $? -eq 0 ]] ||
 {
 	echo "create container ldc-desktop-office-6.2.3-el failed."
 	exit 1
 }

echo
echo "   ****************************************************************"
echo "   ****"
echo "   **** ldc-desktop:office-6.2.3-el successfully created."
echo "   ****"
echo "   **** run with "
echo "   ****    docker start ldc-desktop-office-6.2.3-el"
echo "   ****"
echo "   ****************************************************************"
echo
echo

exit 0

