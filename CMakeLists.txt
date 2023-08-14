cmake_minimum_required(VERSION 2.8)
project(ORB_SLAM3)

IF(NOT CMAKE_BUILD_TYPE)
  SET(CMAKE_BUILD_TYPE Release)
ENDIF()

MESSAGE("Build type: " ${CMAKE_BUILD_TYPE})

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}  -Wall   -O3")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall   -O3")
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -march=native")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -march=native")

# Check C++11 or C++0x support
include(CheckCXXCompilerFlag)
CHECK_CXX_COMPILER_FLAG("-std=c++14" COMPILER_SUPPORTS_CXX14)
CHECK_CXX_COMPILER_FLAG("-std=c++0x" COMPILER_SUPPORTS_CXX0X)
if(COMPILER_SUPPORTS_CXX14)
   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")
   add_definitions(-DCOMPILEDWITHC11)
   add_definitions(-DCOMPILEDWITHC14)
   message(STATUS "Using flag -std=c++14.")
elseif(COMPILER_SUPPORTS_CXX0X)
   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
   add_definitions(-DCOMPILEDWITHC0X)
   message(STATUS "Using flag -std=c++0x.")
else()
   message(FATAL_ERROR "The compiler ${CMAKE_CXX_COMPILER} has no C++11 support. Please use a different C++ compiler.")
endif()

LIST(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake_modules)

find_package(OpenCV 4.4)
   if(NOT OpenCV_FOUND)
      message(FATAL_ERROR "OpenCV > 4.4 not found.")
   endif()

MESSAGE("OPENCV VERSION:")
MESSAGE(${OpenCV_VERSION})

find_package(Eigen3 3.1.0 REQUIRED)
find_package(Pangolin REQUIRED)
find_package(realsense2)

include_directories(
${PROJECT_SOURCE_DIR}
${PROJECT_SOURCE_DIR}/include
${PROJECT_SOURCE_DIR}/include/CameraModels
${PROJECT_SOURCE_DIR}/Thirdparty/Sophus
${EIGEN3_INCLUDE_DIR}
${Pangolin_INCLUDE_DIRS}
)

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/lib)

add_library(${PROJECT_NAME} SHARED
src/System.cc
src/Tracking.cc
src/LocalMapping.cc
src/LoopClosing.cc
src/ORBextractor.cc
src/ORBmatcher.cc
src/FrameDrawer.cc
src/Converter.cc
src/MapPoint.cc
src/KeyFrame.cc
src/Atlas.cc
src/Map.cc
src/MapDrawer.cc
src/Optimizer.cc
src/Frame.cc
src/KeyFrameDatabase.cc
src/Sim3Solver.cc
src/Viewer.cc
src/ImuTypes.cc
src/G2oTypes.cc
src/CameraModels/Pinhole.cpp
src/CameraModels/KannalaBrandt8.cpp
src/OptimizableTypes.cpp
src/MLPnPsolver.cpp
src/GeometricTools.cc
src/TwoViewReconstruction.cc
src/Config.cc
src/Settings.cc
include/System.h
include/Tracking.h
include/LocalMapping.h
include/LoopClosing.h
include/ORBextractor.h
include/ORBmatcher.h
include/FrameDrawer.h
include/Converter.h
include/MapPoint.h
include/KeyFrame.h
include/Atlas.h
include/Map.h
include/MapDrawer.h
include/Optimizer.h
include/Frame.h
include/KeyFrameDatabase.h
include/Sim3Solver.h
include/Viewer.h
include/ImuTypes.h
include/G2oTypes.h
include/CameraModels/GeometricCamera.h
include/CameraModels/Pinhole.h
include/CameraModels/KannalaBrandt8.h
include/OptimizableTypes.h
include/MLPnPsolver.h
include/GeometricTools.h
include/TwoViewReconstruction.h
include/SerializationUtils.h
include/Config.h
include/Settings.h)

add_subdirectory(Thirdparty/g2o)

target_link_libraries(${PROJECT_NAME}
${OpenCV_LIBS}
${EIGEN3_LIBS}
${Pangolin_LIBRARIES}
${PROJECT_SOURCE_DIR}/Thirdparty/DBoW2/lib/libDBoW2.so
${PROJECT_SOURCE_DIR}/Thirdparty/g2o/lib/libg2o.so
-lboost_serialization
-lcrypto
)

# If RealSense SDK is found the library is added and its examples compiled
if(realsense2_FOUND)
    include_directories(${PROJECT_NAME}
    ${realsense_INCLUDE_DIR}
    )
    target_link_libraries(${PROJECT_NAME}
    ${realsense2_LIBRARY}
    )
endif()


# Build examples

# RGB-D examples
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/Examples/RGB-D)

add_executable(rgbd_tum
        Examples/RGB-D/rgbd_tum.cc)
target_link_libraries(rgbd_tum ${PROJECT_NAME})

if(realsense2_FOUND)
    add_executable(rgbd_realsense_D435i
            Examples/RGB-D/rgbd_realsense_D435i.cc)
    target_link_libraries(rgbd_realsense_D435i ${PROJECT_NAME})
endif()


# RGB-D inertial examples
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/Examples/RGB-D-Inertial)

if(realsense2_FOUND)
    add_executable(rgbd_inertial_realsense_D435i
            Examples/RGB-D-Inertial/rgbd_inertial_realsense_D435i.cc)
    target_link_libraries(rgbd_inertial_realsense_D435i ${PROJECT_NAME})
endif()

#Stereo examples
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/Examples/Stereo)

add_executable(stereo_kitti
        Examples/Stereo/stereo_kitti.cc)
target_link_libraries(stereo_kitti ${PROJECT_NAME})

add_executable(stereo_euroc
        Examples/Stereo/stereo_euroc.cc)
target_link_libraries(stereo_euroc ${PROJECT_NAME})

add_executable(stereo_tum_vi
        Examples/Stereo/stereo_tum_vi.cc)
target_link_libraries(stereo_tum_vi ${PROJECT_NAME})

if(realsense2_FOUND)
    add_executable(stereo_realsense_t265
            Examples/Stereo/stereo_realsense_t265.cc)
    target_link_libraries(stereo_realsense_t265 ${PROJECT_NAME})

    add_executable(stereo_realsense_D435i
            Examples/Stereo/stereo_realsense_D435i.cc)
    target_link_libraries(stereo_realsense_D435i ${PROJECT_NAME})
endif()

# adding mono_endo example
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/EndoSLAM)

add_executable(mono_endo
	EndoSLAM/LowCam/Colon-IV/mono_endo.cc)
add_executable(small_intestine_high
	EndoSLAM/HighCam/SmallIntestine/small_intestine_high.cc)
add_executable(unity_endo
	EndoSLAM/unity.cc)
target_link_libraries(mono_endo ${PROJECT_NAME})
target_link_libraries(small_intestine_high ${PROJECT_NAME})
target_link_libraries(unity_endo ${PROJECT_NAME})


# adding endoslam datasets 
# endoslam Cameras/HighCam 
# colon
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/HighCam/Colon4/Traj1)
add_executable(hc_colon_t1
	endoslam/Cameras/HighCam/Colon4/Traj1/hc_colon4_t1.cc)
target_link_libraries(hc_colon_t1 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/HighCam/Colon4/Split_Traj1)
add_executable(hc_colon_split_t1
	endoslam/Cameras/HighCam/Colon4/Split_Traj1/hc_colon4_split_t1.cc)
target_link_libraries(hc_colon_split_t1 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/HighCam/Colon4/Traj2)
add_executable(hc_colon_t2
	endoslam/Cameras/HighCam/Colon4/Traj2/hc_colon4_t2.cc)
target_link_libraries(hc_colon_t2 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/HighCam/Colon4/Traj3)
add_executable(hc_colon_t3
	endoslam/Cameras/HighCam/Colon4/Traj3/hc_colon4_t3.cc)
target_link_libraries(hc_colon_t3 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/HighCam/Colon4/Traj4)
add_executable(hc_colon_t4
	endoslam/Cameras/HighCam/Colon4/Traj4/hc_colon4_t4.cc)
target_link_libraries(hc_colon_t4 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/HighCam/Colon4/Traj5)
add_executable(hc_colon_t5
	endoslam/Cameras/HighCam/Colon4/Traj5/hc_colon4_t5.cc)
target_link_libraries(hc_colon_t5 ${PROJECT_NAME})

# small intestine
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/HighCam/SmallIntestine/Traj1)
add_executable(hc_si_t1
	endoslam/Cameras/HighCam/SmallIntestine/Traj1/hc_si_t1.cc)
target_link_libraries(hc_si_t1 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/HighCam/SmallIntestine/Traj2)
add_executable(hc_si_t2
	endoslam/Cameras/HighCam/SmallIntestine/Traj2/hc_si_t2.cc)
target_link_libraries(hc_si_t2 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/HighCam/SmallIntestine/Traj3)
add_executable(hc_si_t3
	endoslam/Cameras/HighCam/SmallIntestine/Traj3/hc_si_t3.cc)
target_link_libraries(hc_si_t3 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/HighCam/SmallIntestine/Traj4)
add_executable(hc_si_t4
	endoslam/Cameras/HighCam/SmallIntestine/Traj4/hc_si_t4.cc)
target_link_libraries(hc_si_t4 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/HighCam/SmallIntestine/Traj5)
add_executable(hc_si_t5
	endoslam/Cameras/HighCam/SmallIntestine/Traj5/hc_si_t5.cc)
target_link_libraries(hc_si_t5 ${PROJECT_NAME})

# stomach1
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/HighCam/Stomach1/Traj1)
add_executable(hc_stom1_t1
	endoslam/Cameras/HighCam/Stomach1/Traj1/hc_stom1_t1.cc)
target_link_libraries(hc_stom1_t1 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/HighCam/Stomach1/Traj2)
add_executable(hc_stom1_t2
	endoslam/Cameras/HighCam/Stomach1/Traj2/hc_stom1_t2.cc)
target_link_libraries(hc_stom1_t2 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/HighCam/Stomach1/Traj3)
add_executable(hc_stom1_t3
	endoslam/Cameras/HighCam/Stomach1/Traj3/hc_stom1_t3.cc)
target_link_libraries(hc_stom1_t3 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/HighCam/Stomach1/Traj4)
add_executable(hc_stom1_t4
	endoslam/Cameras/HighCam/Stomach1/Traj4/hc_stom1_t4.cc)
target_link_libraries(hc_stom1_t4 ${PROJECT_NAME})

# stomach2
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/HighCam/Stomach2/Traj1)
add_executable(hc_stom2_t1
	endoslam/Cameras/HighCam/Stomach2/Traj1/hc_stom2_t1.cc)
target_link_libraries(hc_stom2_t1 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/HighCam/Stomach2/Traj2)
add_executable(hc_stom2_t2
	endoslam/Cameras/HighCam/Stomach2/Traj2/hc_stom2_t2.cc)
target_link_libraries(hc_stom2_t2 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/HighCam/Stomach2/Traj3)
add_executable(hc_stom2_t3
	endoslam/Cameras/HighCam/Stomach2/Traj3/hc_stom2_t3.cc)
target_link_libraries(hc_stom2_t3 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/HighCam/Stomach2/Traj4)
add_executable(hc_stom2_t4
	endoslam/Cameras/HighCam/Stomach2/Traj4/hc_stom2_t4.cc)
target_link_libraries(hc_stom2_t4 ${PROJECT_NAME})

# stomach3
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/HighCam/Stomach3/Traj1)
add_executable(hc_stom3_t1
	endoslam/Cameras/HighCam/Stomach3/Traj1/hc_stom3_t1.cc)
target_link_libraries(hc_stom3_t1 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/HighCam/Stomach3/Traj2)
add_executable(hc_stom3_t2
	endoslam/Cameras/HighCam/Stomach3/Traj2/hc_stom3_t2.cc)
target_link_libraries(hc_stom3_t2 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/HighCam/Stomach3/Traj3)
add_executable(hc_stom3_t3
	endoslam/Cameras/HighCam/Stomach3/Traj3/hc_stom3_t3.cc)
target_link_libraries(hc_stom3_t3 ${PROJECT_NAME})


# endoslam Cameras/LowCam 
# colon
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/LowCam/Colon4/Traj1)
add_executable(lc_colon_t1
	endoslam/Cameras/LowCam/Colon4/Traj1/lc_colon4_t1.cc)
target_link_libraries(lc_colon_t1 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/LowCam/Colon4/Traj2)
add_executable(lc_colon_t2
	endoslam/Cameras/LowCam/Colon4/Traj2/lc_colon4_t2.cc)
target_link_libraries(lc_colon_t2 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/LowCam/Colon4/Traj3)
add_executable(lc_colon_t3
	endoslam/Cameras/LowCam/Colon4/Traj3/lc_colon4_t3.cc)
target_link_libraries(lc_colon_t3 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/LowCam/Colon4/Traj4)
add_executable(lc_colon_t4
	endoslam/Cameras/LowCam/Colon4/Traj4/lc_colon4_t4.cc)
target_link_libraries(lc_colon_t4 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/LowCam/Colon4/Traj5)
add_executable(lc_colon_t5
	endoslam/Cameras/LowCam/Colon4/Traj5/lc_colon4_t5.cc)
target_link_libraries(lc_colon_t5 ${PROJECT_NAME})

# small intestine
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/LowCam/SmallIntestine/Traj1)
add_executable(lc_si_t1
	endoslam/Cameras/LowCam/SmallIntestine/Traj1/lc_si_t1.cc)
target_link_libraries(lc_si_t1 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/LowCam/SmallIntestine/Traj2)
add_executable(lc_si_t2
	endoslam/Cameras/LowCam/SmallIntestine/Traj2/lc_si_t2.cc)
target_link_libraries(lc_si_t2 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/LowCam/SmallIntestine/Traj3)
add_executable(lc_si_t3
	endoslam/Cameras/LowCam/SmallIntestine/Traj3/lc_si_t3.cc)
target_link_libraries(lc_si_t3 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/LowCam/SmallIntestine/Traj4)
add_executable(lc_si_t4
	endoslam/Cameras/LowCam/SmallIntestine/Traj4/lc_si_t4.cc)
target_link_libraries(lc_si_t4 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/LowCam/SmallIntestine/Traj5)
add_executable(lc_si_t5
	endoslam/Cameras/LowCam/SmallIntestine/Traj5/lc_si_t5.cc)
target_link_libraries(lc_si_t5 ${PROJECT_NAME})

# stomach1
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/LowCam/Stomach1/Traj1)
add_executable(lc_stom1_t1
	endoslam/Cameras/LowCam/Stomach1/Traj1/lc_stom1_t1.cc)
target_link_libraries(lc_stom1_t1 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/LowCam/Stomach1/Traj2)
add_executable(lc_stom1_t2
	endoslam/Cameras/LowCam/Stomach1/Traj2/lc_stom1_t2.cc)
target_link_libraries(lc_stom1_t2 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/LowCam/Stomach1/Traj3)
add_executable(lc_stom1_t3
	endoslam/Cameras/LowCam/Stomach1/Traj3/lc_stom1_t3.cc)
target_link_libraries(lc_stom1_t3 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/LowCam/Stomach1/Traj4)
add_executable(lc_stom1_t4
	endoslam/Cameras/LowCam/Stomach1/Traj4/lc_stom1_t4.cc)
target_link_libraries(lc_stom1_t4 ${PROJECT_NAME})

# stomach2
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/LowCam/Stomach2/Traj1)
add_executable(lc_stom2_t1
	endoslam/Cameras/LowCam/Stomach2/Traj1/lc_stom2_t1.cc)
target_link_libraries(lc_stom2_t1 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/LowCam/Stomach2/Traj2)
add_executable(lc_stom2_t2
	endoslam/Cameras/LowCam/Stomach2/Traj2/lc_stom2_t2.cc)
target_link_libraries(lc_stom2_t2 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/LowCam/Stomach2/Traj3)
add_executable(lc_stom2_t3
	endoslam/Cameras/LowCam/Stomach2/Traj3/lc_stom2_t3.cc)
target_link_libraries(lc_stom2_t3 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/LowCam/Stomach2/Traj4)
add_executable(lc_stom2_t4
	endoslam/Cameras/LowCam/Stomach2/Traj4/lc_stom2_t4.cc)
target_link_libraries(lc_stom2_t4 ${PROJECT_NAME})

# stomach3
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/LowCam/Stomach3/Traj1)
add_executable(lc_stom3_t1
	endoslam/Cameras/LowCam/Stomach3/Traj1/lc_stom3_t1.cc)
target_link_libraries(lc_stom3_t1 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/LowCam/Stomach3/Traj2)
add_executable(lc_stom3_t2
	endoslam/Cameras/LowCam/Stomach3/Traj2/lc_stom3_t2.cc)
target_link_libraries(lc_stom3_t2 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/LowCam/Stomach3/Traj3)
add_executable(lc_stom3_t3
	endoslam/Cameras/LowCam/Stomach3/Traj3/lc_stom3_t3.cc)
target_link_libraries(lc_stom3_t3 ${PROJECT_NAME})


set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/LowCam/Stomach3/Traj4)
add_executable(lc_stom3_t4
	endoslam/Cameras/LowCam/Stomach3/Traj4/lc_stom3_t4.cc)
target_link_libraries(lc_stom3_t4 ${PROJECT_NAME})

# Cameras/MiroCam/Colon3
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/MiroCam/Colon3/Traj1)
add_executable(mc_colon3_t1
	endoslam/Cameras/MiroCam/Colon3/Traj1/mc_colon3_t1.cc)
target_link_libraries(mc_colon3_t1 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/MiroCam/Colon3/Traj3)
add_executable(mc_colon3_t3
	endoslam/Cameras/MiroCam/Colon3/Traj3/mc_colon3_t3.cc)
target_link_libraries(mc_colon3_t3 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/MiroCam/Colon3/Traj4)
add_executable(mc_colon3_t4
	endoslam/Cameras/MiroCam/Colon3/Traj4/mc_colon3_t4.cc)
target_link_libraries(mc_colon3_t4 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/MiroCam/Colon3/Traj5)
add_executable(mc_colon3_t5
	endoslam/Cameras/MiroCam/Colon3/Traj5/mc_colon3_t5.cc)
target_link_libraries(mc_colon3_t5 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/MiroCam/Colon3/Traj6)
add_executable(mc_colon3_t6
	endoslam/Cameras/MiroCam/Colon3/Traj6/mc_colon3_t6.cc)
target_link_libraries(mc_colon3_t6 ${PROJECT_NAME})

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/Cameras/MiroCam/Colon3/Traj7)
add_executable(mc_colon3_t7
	endoslam/Cameras/MiroCam/Colon3/Traj7/mc_colon3_t7.cc)
target_link_libraries(mc_colon3_t7 ${PROJECT_NAME})

# UnityCam
# Colon
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/UnityCam/Colon)
add_executable(uc_colon
	endoslam/UnityCam/Colon/uc_colon.cc)
target_link_libraries(uc_colon ${PROJECT_NAME})

# Small intestine
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/UnityCam/SmallIntestine)
add_executable(uc_si
	endoslam/UnityCam/SmallIntestine/uc_si.cc)
target_link_libraries(uc_si ${PROJECT_NAME})

# stomach
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/endoslam/UnityCam/Stomach)
add_executable(uc_stom
	endoslam/UnityCam/Stomach/uc_stom.cc)
target_link_libraries(uc_stom ${PROJECT_NAME})

#Monocular examples
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/Examples/Monocular)

add_executable(mono_tum
        Examples/Monocular/mono_tum.cc)
target_link_libraries(mono_tum ${PROJECT_NAME})

add_executable(mono_kitti
        Examples/Monocular/mono_kitti.cc)
target_link_libraries(mono_kitti ${PROJECT_NAME})

add_executable(mono_euroc
        Examples/Monocular/mono_euroc.cc)
target_link_libraries(mono_euroc ${PROJECT_NAME})



add_executable(mono_tum_vi
        Examples/Monocular/mono_tum_vi.cc)
target_link_libraries(mono_tum_vi ${PROJECT_NAME})

if(realsense2_FOUND)
    add_executable(mono_realsense_t265
            Examples/Monocular/mono_realsense_t265.cc)
    target_link_libraries(mono_realsense_t265 ${PROJECT_NAME})

    add_executable(mono_realsense_D435i
            Examples/Monocular/mono_realsense_D435i.cc)
    target_link_libraries(mono_realsense_D435i ${PROJECT_NAME})
endif()

#Monocular inertial examples
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/Examples/Monocular-Inertial)

add_executable(mono_inertial_euroc
        Examples/Monocular-Inertial/mono_inertial_euroc.cc)
target_link_libraries(mono_inertial_euroc ${PROJECT_NAME})

add_executable(mono_inertial_tum_vi
        Examples/Monocular-Inertial/mono_inertial_tum_vi.cc)
target_link_libraries(mono_inertial_tum_vi ${PROJECT_NAME})

if(realsense2_FOUND)
    add_executable(mono_inertial_realsense_t265
            Examples/Monocular-Inertial/mono_inertial_realsense_t265.cc)
    target_link_libraries(mono_inertial_realsense_t265 ${PROJECT_NAME})

    add_executable(mono_inertial_realsense_D435i
            Examples/Monocular-Inertial/mono_inertial_realsense_D435i.cc)
    target_link_libraries(mono_inertial_realsense_D435i ${PROJECT_NAME})
endif()

#Stereo Inertial examples
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/Examples/Stereo-Inertial)

add_executable(stereo_inertial_euroc
        Examples/Stereo-Inertial/stereo_inertial_euroc.cc)
target_link_libraries(stereo_inertial_euroc ${PROJECT_NAME})

add_executable(stereo_inertial_tum_vi
        Examples/Stereo-Inertial/stereo_inertial_tum_vi.cc)
target_link_libraries(stereo_inertial_tum_vi ${PROJECT_NAME})

if(realsense2_FOUND)
    add_executable(stereo_inertial_realsense_t265
            Examples/Stereo-Inertial/stereo_inertial_realsense_t265.cc)
    target_link_libraries(stereo_inertial_realsense_t265 ${PROJECT_NAME})

    add_executable(stereo_inertial_realsense_D435i
            Examples/Stereo-Inertial/stereo_inertial_realsense_D435i.cc)
    target_link_libraries(stereo_inertial_realsense_D435i ${PROJECT_NAME})
endif()

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/Examples/Calibration)
if(realsense2_FOUND)
    add_executable(recorder_realsense_D435i
            Examples/Calibration/recorder_realsense_D435i.cc)
    target_link_libraries(recorder_realsense_D435i ${PROJECT_NAME})

    add_executable(recorder_realsense_T265
            Examples/Calibration/recorder_realsense_T265.cc)
    target_link_libraries(recorder_realsense_T265 ${PROJECT_NAME})
endif()

#Old examples

# RGB-D examples
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/Examples_old/RGB-D)

add_executable(rgbd_tum_old
        Examples_old/RGB-D/rgbd_tum.cc)
target_link_libraries(rgbd_tum_old ${PROJECT_NAME})

if(realsense2_FOUND)
    add_executable(rgbd_realsense_D435i_old
            Examples_old/RGB-D/rgbd_realsense_D435i.cc)
    target_link_libraries(rgbd_realsense_D435i_old ${PROJECT_NAME})
endif()


# RGB-D inertial examples
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/Examples_old/RGB-D-Inertial)

if(realsense2_FOUND)
    add_executable(rgbd_inertial_realsense_D435i_old
            Examples_old/RGB-D-Inertial/rgbd_inertial_realsense_D435i.cc)
    target_link_libraries(rgbd_inertial_realsense_D435i_old ${PROJECT_NAME})
endif()

#Stereo examples
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/Examples_old/Stereo)

add_executable(stereo_kitti_old
        Examples_old/Stereo/stereo_kitti.cc)
target_link_libraries(stereo_kitti_old ${PROJECT_NAME})

add_executable(stereo_euroc_old
        Examples_old/Stereo/stereo_euroc.cc)
target_link_libraries(stereo_euroc_old ${PROJECT_NAME})

add_executable(stereo_tum_vi_old
        Examples_old/Stereo/stereo_tum_vi.cc)
target_link_libraries(stereo_tum_vi_old ${PROJECT_NAME})

if(realsense2_FOUND)
    add_executable(stereo_realsense_t265_old
            Examples_old/Stereo/stereo_realsense_t265.cc)
    target_link_libraries(stereo_realsense_t265_old ${PROJECT_NAME})

    add_executable(stereo_realsense_D435i_old
            Examples_old/Stereo/stereo_realsense_D435i.cc)
    target_link_libraries(stereo_realsense_D435i_old ${PROJECT_NAME})
endif()

#Monocular examples
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/Examples_old/Monocular)

add_executable(mono_tum_old
        Examples_old/Monocular/mono_tum.cc)
target_link_libraries(mono_tum_old ${PROJECT_NAME})

add_executable(mono_kitti_old
        Examples_old/Monocular/mono_kitti.cc)
target_link_libraries(mono_kitti_old ${PROJECT_NAME})

add_executable(mono_euroc_old
        Examples_old/Monocular/mono_euroc.cc)
target_link_libraries(mono_euroc_old ${PROJECT_NAME})

add_executable(mono_tum_vi_old
        Examples_old/Monocular/mono_tum_vi.cc)
target_link_libraries(mono_tum_vi_old ${PROJECT_NAME})

if(realsense2_FOUND)
    add_executable(mono_realsense_t265_old
            Examples_old/Monocular/mono_realsense_t265.cc)
    target_link_libraries(mono_realsense_t265_old ${PROJECT_NAME})

    add_executable(mono_realsense_D435i_old
            Examples_old/Monocular/mono_realsense_D435i.cc)
    target_link_libraries(mono_realsense_D435i_old ${PROJECT_NAME})
endif()

#Monocular inertial examples
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/Examples_old/Monocular-Inertial)

add_executable(mono_inertial_euroc_old
        Examples_old/Monocular-Inertial/mono_inertial_euroc.cc)
target_link_libraries(mono_inertial_euroc_old ${PROJECT_NAME})

add_executable(mono_inertial_tum_vi_old
        Examples_old/Monocular-Inertial/mono_inertial_tum_vi.cc)
target_link_libraries(mono_inertial_tum_vi_old ${PROJECT_NAME})

if(realsense2_FOUND)
    add_executable(mono_inertial_realsense_t265_old
            Examples_old/Monocular-Inertial/mono_inertial_realsense_t265.cc)
    target_link_libraries(mono_inertial_realsense_t265_old ${PROJECT_NAME})

    add_executable(mono_inertial_realsense_D435i_old
            Examples_old/Monocular-Inertial/mono_inertial_realsense_D435i.cc)
    target_link_libraries(mono_inertial_realsense_D435i_old ${PROJECT_NAME})
endif()

#Stereo Inertial examples
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/Examples_old/Stereo-Inertial)

add_executable(stereo_inertial_euroc_old
        Examples_old/Stereo-Inertial/stereo_inertial_euroc.cc)
target_link_libraries(stereo_inertial_euroc_old ${PROJECT_NAME})

add_executable(stereo_inertial_tum_vi_old
        Examples_old/Stereo-Inertial/stereo_inertial_tum_vi.cc)
target_link_libraries(stereo_inertial_tum_vi_old ${PROJECT_NAME})

if(realsense2_FOUND)
    add_executable(stereo_inertial_realsense_t265_old
            Examples_old/Stereo-Inertial/stereo_inertial_realsense_t265.cc)
    target_link_libraries(stereo_inertial_realsense_t265_old ${PROJECT_NAME})

    add_executable(stereo_inertial_realsense_D435i_old
            Examples_old/Stereo-Inertial/stereo_inertial_realsense_D435i.cc)
    target_link_libraries(stereo_inertial_realsense_D435i_old ${PROJECT_NAME})
endif()
