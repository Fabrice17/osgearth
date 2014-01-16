# Locate SilverLining
# This module defines
# SILVERLINING_LIBRARY
# SILVERLINING_FOUND, if false, do not try to link to SilverLining 
# SILVERLINING_INCLUDE_DIR, where to find the headers
#
# $SILVERLINING_DIR is an environment variable that would
# correspond to the ./configure --prefix=$SILVERLINING_DIR
#
# Created by Robert Hauck. 


IF (MSVC90)
	IF (CMAKE_CL_64)
		SET(SILVERLINING_ARCH "vc9/x64")
	ELSE (CMAKE_CL_64)
		SET(SILVERLINING_ARCH "vc9/win32")
	ENDIF (CMAKE_CL_64)
ENDIF (MSVC90)

IF (MSVC80)
	IF (CMAKE_CL_64)
		SET(SILVERLINING_ARCH "vc8/x64")
	ELSE (CMAKE_CL_64)
		SET(SILVERLINING_ARCH "vc8/win32")
	ENDIF (CMAKE_CL_64)
ENDIF (MSVC80)

IF (MSVC10)
	IF (CMAKE_CL_64)
		SET(SILVERLINING_ARCH "vc10/x64")
	ELSE (CMAKE_CL_64)
		SET(SILVERLINING_ARCH "vc10/win32")
	ENDIF (CMAKE_CL_64)
ENDIF (MSVC10)

IF (MSVC11)
	IF (CMAKE_CL_64)
		SET(SILVERLINING_ARCH "vc11/x64")
	ELSE (CMAKE_CL_64)
		SET(SILVERLINING_ARCH "vc11/win32")
	ENDIF (CMAKE_CL_64)
ENDIF (MSVC11)

IF (MSVC71)
	SET(SILVERLINING_ARCH "vc7")
ENDIF (MSVC71)

IF (MSVC60)
	SET(SILVERLINING_ARCH "vc6")
ENDIF (MSVC60)

IF (UNIX)
	SET(SILVERLINING_ARCH "linux")
ENDIF (UNIX)

FIND_PATH(SILVERLINING_INCLUDE_DIR Atmosphere.h
    "${SILVERLINING_DIR}/Public Headers"
    "$ENV{SILVERLINING_PATH}/Public Headers"
    $ENV{SILVERLINING_PATH}
    ${SILVERLINING_DIR}/include
    $ENV{SILVERLINING_DIR}/include
    $ENV{SILVERLINING_DIR}
    /usr/local/include
    /usr/include
    /sw/include # Fink
    /opt/local/include # DarwinPorts
    /opt/csw/include # Blastwave
    /opt/include
    /usr/freeware/include
)

MACRO(FIND_SILVERLINING_LIBRARY MYLIBRARY MYLIBRARYNAME)

    FIND_LIBRARY(${MYLIBRARY}
    NAMES ${MYLIBRARYNAME}
    PATHS
		${SILVERLINING_DIR}/lib
		$ENV{SILVERLINING_DIR}/lib
		$ENV{SILVERLINING_DIR}
		$ENV{SILVERLINING_PATH}/lib
		/usr/local/lib
		/usr/lib
		/sw/lib
		/opt/local/lib
		/opt/csw/lib
		/opt/lib
		/usr/freeware/lib64
	PATH_SUFFIXES
		${SILVERLINING_ARCH}
    )

ENDMACRO(FIND_SILVERLINING_LIBRARY MYLIBRARY MYLIBRARYNAME)


FIND_SILVERLINING_LIBRARY(SILVERLINING_LIBRARY_RELEASE "SilverLining-MT-DLL;SilverLining;SilverLiningOpenGL")
FIND_SILVERLINING_LIBRARY(SILVERLINING_LIBRARY_DEBUG "SilverLining-MTD-DLL;SilverLiningOpenGL")

SET(SILVERLINING_FOUND FALSE)
IF (SILVERLINING_INCLUDE_DIR AND SILVERLINING_LIBRARY_RELEASE AND SILVERLINING_LIBRARY_DEBUG)
   SET(SILVERLINING_FOUND TRUE)
ENDIF (SILVERLINING_INCLUDE_DIR AND SILVERLINING_LIBRARY_RELEASE AND SILVERLINING_LIBRARY_DEBUG)

IF (SILVERLINING_FOUND)
   IF (NOT SILVERLINING_FIND_QUIETLY)
      MESSAGE(STATUS "Found SilverLining: ${SILVERLINING_LIBRARY_RELEASE}")
   ENDIF (NOT SILVERLINING_FIND_QUIETLY)
ELSE (SILVERLINING_FOUND)
   IF (SILVERLINING_FIND_REQUIRED)
      MESSAGE(FATAL_ERROR "Could not find SilverLining")
   ENDIF (SILVERLINING_FIND_REQUIRED)
ENDIF (SILVERLINING_FOUND)
