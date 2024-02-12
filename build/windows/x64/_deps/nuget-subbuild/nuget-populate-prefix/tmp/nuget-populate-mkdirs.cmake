# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "E:/Flutter_projects/Intern_Projects/assignment2/assign2/build/windows/x64/_deps/nuget-src"
  "E:/Flutter_projects/Intern_Projects/assignment2/assign2/build/windows/x64/_deps/nuget-build"
  "E:/Flutter_projects/Intern_Projects/assignment2/assign2/build/windows/x64/_deps/nuget-subbuild/nuget-populate-prefix"
  "E:/Flutter_projects/Intern_Projects/assignment2/assign2/build/windows/x64/_deps/nuget-subbuild/nuget-populate-prefix/tmp"
  "E:/Flutter_projects/Intern_Projects/assignment2/assign2/build/windows/x64/_deps/nuget-subbuild/nuget-populate-prefix/src/nuget-populate-stamp"
  "E:/Flutter_projects/Intern_Projects/assignment2/assign2/build/windows/x64/_deps/nuget-subbuild/nuget-populate-prefix/src"
  "E:/Flutter_projects/Intern_Projects/assignment2/assign2/build/windows/x64/_deps/nuget-subbuild/nuget-populate-prefix/src/nuget-populate-stamp"
)

set(configSubDirs Debug)
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "E:/Flutter_projects/Intern_Projects/assignment2/assign2/build/windows/x64/_deps/nuget-subbuild/nuget-populate-prefix/src/nuget-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "E:/Flutter_projects/Intern_Projects/assignment2/assign2/build/windows/x64/_deps/nuget-subbuild/nuget-populate-prefix/src/nuget-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
