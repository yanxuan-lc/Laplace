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
set(PROJECT_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
set(CMAKE_INSTALL_PREFIX "${PROJECT_ROOT_DIR}/bin")
set(BINARY_ROOT_DIR "${CMAKE_INSTALL_PREFIX}/")
set(ENGINE_ROOT_DIR ${PROJECT_ROOT_DIR}/engine)

# ---- build 3rd-party libraries ----
add_subdirectory(library)

# ---- build self modules ----
add_subdirectory(engine/editor)
