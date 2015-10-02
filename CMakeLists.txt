cmake_minimum_required(VERSION 3.2)

project (tcg)

option (BIG_ENDIAN "Big endian" OFF)
set (WORD_SIZE "32" CACHE STRING "Word size")
set (ARCHITECTURE "i386" CACHE STRING "Architecture")

set_property (CACHE WORD_SIZE PROPERTY STRINGS 32 64)
set_property (CACHE ARCHITECTURE PROPERTY STRINGS i386 arm)

string (TOUPPER ${ARCHITECTURE} ARCHITECTURE_UPPER)


set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fomit-frame-pointer")
if(${WORD_SIZE} EQUAL 64)
    set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC")
endif()

if(BIG_ENDIAN)
    add_definitions (-DTARGET_WORDS_BIGENDIAN)
endif()

add_definitions (
    -DTCG_STANDALONE
    -DCONFIG_NEED_MMU
    -DCONFIG_SOFTMMU
    -DNEED_CPU_H
    -DNDEBUG
    -DTCG_TARGET_${ARCHITECTURE_UPPER}
    -DHOST_BITS_${WORD_SIZE})

include_directories (${ARCHITECTURE})

add_library (tcg STATIC
    additional.c
    optimize.c
    tcg.c)

