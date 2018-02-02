check_include_file("dirent.h" HAVE_DIRENT_H)
check_function_exists(getopt HAVE_SYSTEM_GETOPT)
if (HAVE_SYSTEM_GETOPT)
  add_definitions(-D HAVE_SYSTEM_GETOPT)
else()
  # CCache will have a replacement for it
endif()
check_function_exists (vsnprintf HAVE_VSNPRINTF)
check_function_exists (snprintf HAVE_SNPRINTF)
check_function_exists (sprintf HAVE_SPRINTF)

configure_file(config.h.cmake.in ${CMAKE_CURRENT_BINARY_DIR}/config.h )

configure_file(ccache_swig_config.h.in ${CMAKE_CURRENT_BINARY_DIR}/ccache_swig_config.h )
include_directories(${CMAKE_CURRENT_BINARY_DIR})

set ( SOURCEFILES ccache.c mdfour.c hash.c execute.c util.c args.c stats.c cleanup.c snprintf.c unify.c )
if (NOT HAVE_SYSTEM_GETOPT)
set ( SOURCEFILES ${SOURCEFILES} getopt.c )
endif ()
if (NOT HAVE_DIRENT_H)
set ( SOURCEFILES ${SOURCEFILES} dirent.c )
endif ()

add_executable ( ccache-swig ${SOURCEFILES} )
if ( ZLIB_FOUND )
  target_link_libraries ( ccache-swig ${ZLIB_LIBRARIES} )
endif ()
install ( TARGETS ccache-swig DESTINATION bin )


if ( YODL2MAN_EXECUTABLE )
  set ( MAN_OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/ccache-swig.1 )
  add_custom_command( OUTPUT ${MAN_OUTPUT}
                      COMMAND ${YODL2MAN_EXECUTABLE} -o ${MAN_OUTPUT} ${CMAKE_CURRENT_SOURCE_DIR}/ccache.yo
                      DEPENDS ccache.yo
  )
  add_custom_target ( ccache_doc ALL DEPENDS ${MAN_OUTPUT} )
  install ( FILES ${MAN_OUTPUT} DESTINATION share/man/man1 )
endif ()
