# Copyright (c) 2009, Whispersoft s.r.l.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
# * Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
# * Redistributions in binary form must reproduce the above
# copyright notice, this list of conditions and the following disclaimer
# in the documentation and/or other materials provided with the
# distribution.
# * Neither the name of Whispersoft s.r.l. nor the names of its
# contributors may be used to endorse or promote products derived from
# this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


#############################
#  THIS IS A MODIFIED COPY. #
#############################

#
#  Changed 6/18/2013 by Tobias Schwinger
#  Copyright (c) 2013 High Fidelity
#

#
# Finds SPEEXDSP library
#
#  SPEEXDSP_INCLUDE_DIRS - where to find speex.h, etc.
#  SPEEXDSP_LIBRARIES    - List of libraries when using SPEEXDSP.
#  SPEEXDSP_FOUND        - True if SPEEXDSP found.
#

if (SPEEXDSP_INCLUDE_DIRS AND SPEEXDSP_LIBRARIES)
  set(SPEEXDSP_FOUND TRUE)
else (SPEEXDSP_INCLUDE_DIRS AND SPEEXDSP_LIBRARIES)

    find_path(SPEEXDSP_INCLUDE_DIRS speex/speex.h
      /usr/include
      /usr/local/include
      ${SPEEX_ROOT_DIR}/include
    )

    set(SPEEXDSP_NAMES speexdsp)
    find_library(SPEEXDSP_LIBRARY NAMES ${SPEEXDSP_NAMES} PATHS /usr/lib usr/local/lib)
    if (NOT SPEEXDSP_LIBRARY AND APPLE)
        find_library(SPEEXDSP_LIBRARY NAMES ${SPEEXDSP_NAMES} PATHS ${SPEEX_ROOT_DIR}/lib/MacOS)
    elseif (WIN32)
        find_library(SPEEXDSP_LIBRARY NAMES ${SPEEXDSP_NAMES} PATHS ${SPEEX_ROOT_DIR}/lib/Win32)
    endif ()

    if (SPEEXDSP_INCLUDE_DIRS AND SPEEXDSP_LIBRARY)
       set(SPEEXDSP_FOUND TRUE)
       set(SPEEXDSP_LIBRARIES ${SPEEXDSP_LIBRARY})
    else (SPEEXDSP_INCLUDE_DIRS AND SPEEXDSP_LIBRARY)
       set(SPEEXDSP_FOUND FALSE)
       set(SPEEXDSP_LIBRARIES)
    endif (SPEEXDSP_INCLUDE_DIRS AND SPEEXDSP_LIBRARY)

    if (SPEEXDSP_FOUND)
      message(STATUS "Found SpeexDSP: ${SPEEXDSP_LIBRARY}")
    else (SPEEXDSP_FOUND)
       if (SPEEXDSP_FIND_REQUIRED)
          message(STATUS "Looked for SpeexDSP libraries named ${SPEEXDSP_NAMES}.")
          message(STATUS "Include file detected: [${SPEEXDSP_INCLUDE_DIRS}].")
          message(STATUS "Lib file detected: [${SPEEXDSP_LIBRARY}].")
          message(FATAL_ERROR "=========> Could NOT find SpeexDSP library")
       endif (SPEEXDSP_FIND_REQUIRED)
    endif (SPEEXDSP_FOUND)

    mark_as_advanced(SPEEXDSP_INCLUDE_DIRS SPEEXDSP_LIBRARIES)

endif (SPEEXDSP_INCLUDE_DIRS AND SPEEXDSP_LIBRARIES)
