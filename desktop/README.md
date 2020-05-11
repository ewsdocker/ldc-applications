# ldc-desktop - Linux Docker Container desktop applications images.

Under development - not ready for use.

____  
## Development Notes  

    #!/bin/bash
    
    # ===========================================================================
    # ===========================================================================

    # ===========================================================================
    # ===========================================================================

    # ===========================================================================
    # ===========================================================================

    # ===========================================================================
    # ===========================================================================

### ldc-desktop:dlibreoffice 

    # ===========================================================================
    #
    #    ldc-desktop:dlibreoffice-0.1.0
    #
    # ===========================================================================

    cd ~/Development/ewslms/ldc-desktop
    docker build \
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
      --file Dockerfile.dlibreoffice \
      -t ewsdocker/ldc-desktop:dlibreoffice-0.1.0  .

    docker create \
      -it \
      -e LRUN_APP="libreoffice" \
      \
      -e LMS_BASE="${HOME}/.local" \
      -e LMS_HOME="${HOME}" \
      -e LMS_CONF="${HOME}/.config" \
      \
      -v ${HOME}/bin:/userbin \
      -v ${HOME}/.local:/usrlocal \
      -v ${HOME}/.config/docker:/conf \
      -v ${HOME}/.config/docker/ldc-desktop-dlibreoffice-0.1.0:/root \
      -v ${HOME}/.config/docker/ldc-desktop-dlibreoffice-0.1.0/workspace:/workspace \
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
      --name=ldc-desktop-dlibreoffice-0.1.0 \
    ewsdocker/ldc-desktop:dlibreoffice-0.1.0 

    docker start ldc-desktop-dlibreoffice-0.1.0

    docker rm ldc-desktop-dlibreoffice-0.1.0

    docker rmi ewsdocker/ldc-desktop:dlibreoffice-0.1.0

    # ===========================================================================
    # ===========================================================================

### ldc-desktop:dgimp 

    # ===========================================================================
    #
    #    ldc-desktop:dgimp-0.1.0
    #
    # ===========================================================================

    cd ~/Development/ewslms/ldc-desktop
    docker build \
      --build-arg LIB_HOST=http://alpine-nginx-pkgcache \
      --network=pkgnet \
      \
      --file Dockerfile.dgimp \
      -t ewsdocker/ldc-desktop:dgimp-0.1.0  .

    docker run \
      -it \
      -e LRUN_APP="gimp" \
      \
      -v ${HOME}/bin:/userbin \
      -v ${HOME}/.local:/usrlocal \
      -v ${HOME}/.config/docker:/conf \
      -v ${HOME}/.config/docker/ldc-desktop-dgimp-0.1.0:/root \
      -v ${HOME}/.config/docker/ldc-desktop-dgimp-0.1.0/workspace:/workspace \
      \
      -e DISPLAY=unix${DISPLAY} \
      -v ${HOME}/.Xauthority:/root/.Xauthority \
      -v /tmp/.X11-unix:/tmp/.X11-unix \
      -v /dev/shm:/dev/shm \
      --device /dev/snd \
      \
      -v ${HOME}/Pictures/Gimp:/artwork \
      -v ${HOME}/Pictures:/pictures \
      -v ${HOME}/Documents:/www \
      \
      --name=ldc-desktop-dgimp-0.1.0 \
    ewsdocker/ldc-desktop:dgimp-0.1.0 

	docker start ldc-desktop-dgimp-0.1.0

	docker rm ldc-desktop-dgimp-0.1.0

	rm -Rf ${HOME}/.config/docker/ldc-desktop-dgimp-0.1.0

    # ===========================================================================
    # ===========================================================================

    # ===========================================================================
    # ===========================================================================

### ldc-desktop:drip-me 

    # ===========================================================================
    #
    #    ldc-desktop:drip-me-0.1.0
    #
    # ===========================================================================

    cd ~/Development/ewslms/ldc-desktop
    docker build \
     --build-arg RIPME_HOST=http://alpine-nginx-pkgcache \
     --build-arg RIPME_VER="1.7" \
     --build-arg RIPME_EXT="82" \
     \
      --build-arg LIB_HOST=http://alpine-nginx-pkgcache \
      --network=pkgnet \
      \
      --file Dockerfile.drip-me \
      -t ewsdocker/ldc-desktop:drip-me-0.1.0  .

    docker run \
      -it \
      --rm \
      -e LRUN_APP="/bin/bash" \
      \
      -e LMS_BASE="${HOME}/.local" \
      -e LMS_HOME="${HOME}" \
      -e LMS_CONF="${HOME}/.config" \
      \
      -v ${HOME}/bin:/userbin \
      -v ${HOME}/.local:/usrlocal \
      -v ${HOME}/.config/docker:/conf \
      -v ${HOME}/.config/docker/ldc-desktop-drip-me-0.1.0:/root \
      -v ${HOME}/.config/docker/ldc-desktop-drip-me-0.1.0/workspace:/workspace \
      \
      -e DISPLAY=unix${DISPLAY} \
      -v ${HOME}/.Xauthority:/root/.Xauthority \
      -v /tmp/.X11-unix:/tmp/.X11-unix \
      -v /dev/shm:/dev/shm \
      --device /dev/snd \
      \
      -v ${HOME}/Pictures/RipMe:/data \
      \
      --name=ldc-desktop-drip-me-0.1.0 \
    ewsdocker/ldc-desktop:drip-me-0.1.0 

    # ===========================================================================
    # ===========================================================================

### ldc-desktop:dgimagereader 

    # ===========================================================================
    #
    #    ldc-desktop:dgimagereader-0.1.0
    #
    # ===========================================================================

    cd ~/Development/ewslms/ldc-desktop
    docker build \
      --build-arg LIB_HOST=http://alpine-nginx-pkgcache \
      --network=pkgnet \
      \
      --file Dockerfile.dgimagereader \
      -t ewsdocker/ldc-desktop:dgimagereader-0.1.0  .

    docker run \
      -it \
      \
      -e LMS_BASE="${HOME}/.local" \
      -e LMS_HOME="${HOME}" \
      -e LMS_CONF="${HOME}/.config" \
      \
      -v ${HOME}/bin:/userbin \
      -v ${HOME}/.local:/usrlocal \
      -v ${HOME}/.config/docker:/conf \
      -v ${HOME}/.config/docker/ldc-desktop-dgimagereader-0.1.0:/root \
      -v ${HOME}/.config/docker/ldc-desktop-dgimagereader-0.1.0/workspace:/workspace \
      \
      -e DISPLAY=unix${DISPLAY} \
      -v ${HOME}/.Xauthority:/root/.Xauthority \
      -v /tmp/.X11-unix:/tmp/.X11-unix \
      -v /dev/shm:/dev/shm \
      --device /dev/snd \
      \
      -v ${HOME}/Pictures/Gimp:/artwork \
      -v ${HOME}/Pictures:/pictures \
      -v ${HOME}/Documents:/www \
      \
      --name=ldc-desktop-dgimagereader-0.1.0 \
    ewsdocker/ldc-desktop:dgimagereader-0.1.0 

	docker start ldc-desktop-dgimagereader-0.1.0

	docker rm ldc-desktop-dgimagereader-0.1.0

	rm -Rf ${HOME}/.config/docker/ldc-desktop-dgimagereader-0.1.0

