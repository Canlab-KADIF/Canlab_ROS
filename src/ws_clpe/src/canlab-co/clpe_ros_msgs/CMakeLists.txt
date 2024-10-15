cmake_minimum_required(VERSION 3.5)

project(clpe_ros_msgs)

find_package(catkin REQUIRED COMPONENTS message_generation)

# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()
if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  # we dont use add_compile_options with pedantic in message packages
  # because the Python C extensions dont comply with it
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wpedantic")
endif()

add_message_files(
  DIRECTORY msg
  FILES
    ClpeCameraInfo.msg
)

generate_messages()

catkin_package()
