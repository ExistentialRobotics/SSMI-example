cmake_minimum_required(VERSION 3.1)
project(car_control)

# set default build type
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wno-deprecated-declarations")

find_package(catkin REQUIRED COMPONENTS roscpp nav_msgs std_msgs tf)
find_package(Eigen3 REQUIRED)

include_directories(include ${catkin_INCLUDE_DIRS} ${EIGEN3_INCLUDE_DIR})

catkin_package(
  INCLUDE_DIRS
  LIBRARIES
  CATKIN_DEPENDS roscpp nav_msgs std_msgs tf
  DEPENDS EIGEN3)

add_library(DDControl src/DDControl.cpp)
add_library(power_diagram_control src/power_diagram_control.cpp)

add_executable(dd_control_node src/dd_control_node.cpp)
add_dependencies(dd_control_node ${catkin_EXPORTED_TARGETS})
target_link_libraries(dd_control_node DDControl ${catkin_LIBRARIES})

add_executable(power_diagram_node src/power_diagram_node.cpp)
add_dependencies(power_diagram_node ${catkin_EXPORTED_TARGETS})
target_link_libraries(power_diagram_node power_diagram_control DDControl ${catkin_LIBRARIES})

install(DIRECTORY
  config
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
  FILES_MATCHING PATTERN "*.yaml"
  )

install(TARGETS dd_control_node power_diagram_node
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(TARGETS DDControl power_diagram_control
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
)
