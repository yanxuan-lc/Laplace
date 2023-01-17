set(TARGET_NAME Laplace)

# ---- build project sources ----
file(GLOB EDITOR_HEADERS CONFIGURE_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/include/*.h)
file(GLOB EDITOR_SOURCES CONFIGURE_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/source/*.cpp)
source_group(TREE "${CMAKE_CURRENT_SOURCE_DIR}" FILES ${EDITOR_HEADERS} ${EDITOR_SOURCES})

# ---- add executable resources ----
include_directories(${EDITOR_HEADERS})
add_executable(${TARGET_NAME} ${EDITOR_HEADERS} ${EDITOR_SOURCES})

# ---- include current project source file ----
target_include_directories(${TARGET_NAME} PUBLIC $<BUILD_INTERFACE:${ENGINE_ROOT_DIR}>)

# ---- link 3rd-party dependencies ----
target_link_libraries(${TARGET_NAME} PUBLIC glfw imgui)
