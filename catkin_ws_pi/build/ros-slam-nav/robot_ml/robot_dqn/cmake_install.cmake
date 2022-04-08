# Install script for directory: /home/ubuntu/catkin_ws/src/ros-slam-nav/robot_ml/robot_dqn

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/ubuntu/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  include("/home/ubuntu/catkin_ws/build/ros-slam-nav/robot_ml/robot_dqn/catkin_generated/safe_execute_install.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/ubuntu/catkin_ws/build/ros-slam-nav/robot_ml/robot_dqn/catkin_generated/installspace/robot_dqn.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_dqn/cmake" TYPE FILE FILES
    "/home/ubuntu/catkin_ws/build/ros-slam-nav/robot_ml/robot_dqn/catkin_generated/installspace/robot_dqnConfig.cmake"
    "/home/ubuntu/catkin_ws/build/ros-slam-nav/robot_ml/robot_dqn/catkin_generated/installspace/robot_dqnConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_dqn" TYPE FILE FILES "/home/ubuntu/catkin_ws/src/ros-slam-nav/robot_ml/robot_dqn/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/robot_dqn" TYPE PROGRAM FILES "/home/ubuntu/catkin_ws/build/ros-slam-nav/robot_ml/robot_dqn/catkin_generated/installspace/robot_dqn_no_obstacle")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/robot_dqn" TYPE PROGRAM FILES "/home/ubuntu/catkin_ws/build/ros-slam-nav/robot_ml/robot_dqn/catkin_generated/installspace/robot_dqn_static_obstacle")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/robot_dqn" TYPE PROGRAM FILES "/home/ubuntu/catkin_ws/build/ros-slam-nav/robot_ml/robot_dqn/catkin_generated/installspace/robot_dqn_moving_obstacle")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/robot_dqn" TYPE PROGRAM FILES "/home/ubuntu/catkin_ws/build/ros-slam-nav/robot_ml/robot_dqn/catkin_generated/installspace/robot_dqn_combination_obstacle")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/robot_dqn" TYPE PROGRAM FILES "/home/ubuntu/catkin_ws/build/ros-slam-nav/robot_ml/robot_dqn/catkin_generated/installspace/result_graph")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/robot_dqn" TYPE PROGRAM FILES "/home/ubuntu/catkin_ws/build/ros-slam-nav/robot_ml/robot_dqn/catkin_generated/installspace/action_graph")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/robot_dqn" TYPE PROGRAM FILES "/home/ubuntu/catkin_ws/build/ros-slam-nav/robot_ml/robot_dqn/catkin_generated/installspace/moving_obstacle")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/robot_dqn" TYPE PROGRAM FILES "/home/ubuntu/catkin_ws/build/ros-slam-nav/robot_ml/robot_dqn/catkin_generated/installspace/combination_obstacle_1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/robot_dqn" TYPE PROGRAM FILES "/home/ubuntu/catkin_ws/build/ros-slam-nav/robot_ml/robot_dqn/catkin_generated/installspace/combination_obstacle_2")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/robot_dqn" TYPE PROGRAM FILES "/home/ubuntu/catkin_ws/build/ros-slam-nav/robot_ml/robot_dqn/catkin_generated/installspace/environment_no_obstacle.py")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/robot_dqn" TYPE PROGRAM FILES "/home/ubuntu/catkin_ws/build/ros-slam-nav/robot_ml/robot_dqn/catkin_generated/installspace/environment_static_obstacle.py")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/robot_dqn" TYPE PROGRAM FILES "/home/ubuntu/catkin_ws/build/ros-slam-nav/robot_ml/robot_dqn/catkin_generated/installspace/environment_moving_obstacle.py")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/robot_dqn" TYPE PROGRAM FILES "/home/ubuntu/catkin_ws/build/ros-slam-nav/robot_ml/robot_dqn/catkin_generated/installspace/environment_combination_obstacle.py")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/robot_dqn" TYPE PROGRAM FILES "/home/ubuntu/catkin_ws/build/ros-slam-nav/robot_ml/robot_dqn/catkin_generated/installspace/respawnGoal.py")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robot_dqn" TYPE DIRECTORY FILES
    "/home/ubuntu/catkin_ws/src/ros-slam-nav/robot_ml/robot_dqn/launch"
    "/home/ubuntu/catkin_ws/src/ros-slam-nav/robot_ml/robot_dqn/save_model"
    )
endif()

