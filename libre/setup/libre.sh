#!/bin/bash

# =========================================================================

mkdir -p ${LIBRE_DIR}
mkdir -p ${HLP_DIR}

# =========================================================================

wget ${LIBRE_URL}
[[ $? -eq 0 ]] || exit $?

tar fxvz ${LIBRE_PKG}
[[ $? -eq 0 ]] || exit $?

rm -Rf ${LIBRE_PKG}

dpkg -i ${LIBRE_DIR}/DEBS/*.deb  
[[ $? -eq 0 ]] || exit $?

# =========================================================================

wget ${HLP_URL}
[[ $? -eq 0 ]] || exit $?

tar fxvz ${HLP_TAR} 
[[ $? -eq 0 ]] || exit $?

rm -Rf ${HLP_TAR}

dpkg -i ${HLP_DIR}/DEBS/*.deb 
[[ $? -eq 0 ]] || exit $?

# =========================================================================

rm -Rf "${LIBRE_DIR}"
rm -Rf "${HLP_DIR}"

# =========================================================================

PATH=$PATH:/opt/libreoffice${LIBRE_REL}/program

ln -s /usr/bin/lms/addLanguage /usr/bin/addLanguage
ln -s /opt/libreoffice${LIBRE_REL}/program/soffice /usr/bin/libreoffice 

# =========================================================================

exit 0

