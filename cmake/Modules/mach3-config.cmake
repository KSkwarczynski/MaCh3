SET(MACH3_LIB_LIST "-libCovariance -libManager -libMCMC -libOscClass -libSamplePDF -libSplines")

SET(MACH3_FEATURES_LIST)

if(MaCh3_MULTITHREAD_ENABLED)
  LIST(APPEND MACH3_FEATURES_LIST "MULTITHREAD")
endif()

if(MaCh3_GPU_ENABLED)
  LIST(APPEND MACH3_FEATURES_LIST "GPU")
endif()

if(MaCh3_DEBUG_ENABLED)
  LIST(APPEND MACH3_FEATURES_LIST "DEBUG")
endif()

LIST(APPEND MACH3_FEATURES_LIST ${MaCh3_Fitter_ENABLED})
LIST(APPEND MACH3_FEATURES_LIST ${MaCh3_Oscillator_ENABLED})

SET(ROOT_INCLUDE_DIRS_SEP ${ROOT_INCLUDE_DIRS})
string(REPLACE ";" " -I" ROOT_INCLUDE_DIRS_SEP "-I${ROOT_INCLUDE_DIRS_SEP}")
SET(ROOT_DEFINITIONS_SEP ${ROOT_DEFINITIONS})
string(REPLACE ";" " " ROOT_DEFINITIONS_SEP "${ROOT_DEFINITIONS_SEP}")
SET(ROOT_LIBRARIES_SEP ${ROOT_LIBRARIES})
string(REPLACE ";" " -l" ROOT_LIBRARIES_SEP "-l${ROOT_LIBRARIES_SEP}")


string(REPLACE ";" " " MACH3_FEATURES "${MACH3_FEATURES_LIST}")
configure_file(${CMAKE_CURRENT_LIST_DIR}/../Templates/mach3-config.in
  "${PROJECT_BINARY_DIR}/mach3-config" @ONLY)
install(PROGRAMS
  "${PROJECT_BINARY_DIR}/mach3-config" DESTINATION
  bin)
