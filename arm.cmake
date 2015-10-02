SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_SYSTEM_VERSION 1)

SET(TOOLCHAIN_PATH /opt/arm-toolchain)
SET(TOOLCHAIN_PREFIX arm)

# specify the cross compiler
SET(CMAKE_C_COMPILER   ${TOOLCHAIN_PATH}/usr/bin/${TOOLCHAIN_PREFIX}-gcc)
SET(CMAKE_CXX_COMPILER ${TOOLCHAIN_PATH}/usr/bin/${TOOLCHAIN_PREFIX}-g++)

# where is the target environment
SET(CMAKE_FIND_ROOT_PATH  ${TOOLCHAIN_PATH}/${TOOLCHAIN_PREFIX})

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# set project properties
SET(ARCHITECTURE "arm" CACHE STRING "Architecture")
SET(WORD_SIZE    "32"  CACHE STRING "Word size")
