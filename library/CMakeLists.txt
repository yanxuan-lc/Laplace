set(third_party_folder "ThirdParty")
set(BUILD_SHARED_LIBS OFF CACHE BOOL "" FORCE)

# ---- glfw ----
if (NOT TARGET glfw)
    option(GLFW_BUILD_EXAMPLES "" OFF)
    option(GLFW_BUILD_TESTS "" OFF)
    option(GLFW_BUILD_DOCS "" OFF)
    option(GLFW_INSTALL "" OFF)
    add_subdirectory(glfw)
    set_target_properties(glfw PROPERTIES FOLDER ${third_party_folder}/glfw)
    set_target_properties(update_mappings PROPERTIES FOLDER ${third_party_folder}/glfw)
endif ()

# ---- imgui ----
if(NOT TARGET imgui)
    include(imgui.cmake)
    set_target_properties(imgui PROPERTIES FOLDER ${third_party_folder}/imgui)
endif()

# ---- link system dependencies ----
find_package(OpenGL REQUIRED)

# ---- link 3rd-party dependencies ----
target_link_libraries(glfw PUBLIC ${OPENGL_gl_LIBRARY})