set(imgui_SOURCE_DIR_ ${CMAKE_CURRENT_SOURCE_DIR}/imgui)
set(imgui_BACKEND_SOURCE_DIR_ ${imgui_SOURCE_DIR_}/backends)

# ---- get imgui and implementations ----
file(GLOB imgui_sources CONFIGURE_DEPENDS
        "${imgui_SOURCE_DIR_}/*.h"
        "${imgui_SOURCE_DIR_}/*.cpp"
)
file(GLOB imgui_impl CONFIGURE_DEPENDS
        "${imgui_BACKEND_SOURCE_DIR_}/imgui_impl_glfw.h"
        "${imgui_BACKEND_SOURCE_DIR_}/imgui_impl_glfw.cpp"
        "${imgui_BACKEND_SOURCE_DIR_}/imgui_impl_opengl3.h"
        "${imgui_BACKEND_SOURCE_DIR_}/imgui_impl_opengl3.cpp"
)

add_library(imgui STATIC ${imgui_sources} ${imgui_impl})

# ---- link dependencies ----
target_include_directories(imgui PUBLIC $<BUILD_INTERFACE:${imgui_SOURCE_DIR_}>)
target_include_directories(imgui PUBLIC $<BUILD_INTERFACE:${imgui_BACKEND_SOURCE_DIR_}>)
target_link_libraries(imgui PUBLIC glfw)