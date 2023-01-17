cmake_minimum_required(VERSION 3.20 FATAL_ERROR)

project(Laplace VERSION 0.0.1)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(BUILD_SHARED_LIBS OFF)

include(CMakeDependentOption)

# ---- include code guards ----
if (PROJECT_SOURCE_DIR STREQUAL PROJECT_BINARY_DIR)
    message(FATAL_ERROR "In-source builds not allowed.")
endif ()

# ---- set global variables ----
set(TARGET_NAME "Laplace")
set(LAPLACE_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
set(CMAKE_INSTALL_PREFIX "${LAPLACE_ROOT_DIR}/bin")
set(BINARY_ROOT_DIR "${CMAKE_INSTALL_PREFIX}/")

# ---- build 3rd-party libraries ----
add_subdirectory(library)

# ---- build project sources ----
file(GLOB APP_HEADERS CONFIGURE_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/include/*.h)
file(GLOB APP_SOURCES CONFIGURE_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/source/*.cpp)
add_executable(${TARGET_NAME} ${APP_HEADERS} ${APP_SOURCES})

# ---- link 3rd-party dependencies ----
target_link_libraries(${TARGET_NAME} PUBLIC glfw imgui)
