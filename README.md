## Laboratory work VIII

Данная лабораторная работа посвещена изучению систем автоматизации развёртывания и управления приложениями на примере **Docker**

```sh
$ open https://docs.docker.com/get-started/
```

## Tasks

- [ ] 1. Создать публичный репозиторий с названием **lab08** на сервисе **GitHub**
- [ ] 2. Ознакомиться со ссылками учебного материала
- [ ] 3. Выполнить инструкцию учебного материала
- [ ] 4. Составить отчет и отправить ссылку личным сообщением в **Slack**
```sh
┌──(kali㉿kali)-[~]
└─$ cd HECCYLLIujTbmy/workspace/projects      
                                                                                                                                                                                                                                         
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects]
└─$ git clone https://github.com/HECCYLLIujTbmy/lab04-pls lab08-to4no
Cloning into 'lab08-to4no'...
remote: Enumerating objects: 225, done.
remote: Counting objects: 100% (225/225), done.
remote: Compressing objects: 100% (98/98), done.
remote: Total 225 (delta 119), reused 208 (delta 113), pack-reused 0
Receiving objects: 100% (225/225), 90.33 KiB | 1.19 MiB/s, done.
Resolving deltas: 100% (119/119), done.
```
```sh                                                                                                                                                                                                                                        
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects]
└─$ cd lab08-to4no/.github/workflows   
                                                                                                                                                                                                                                         
┌──(kali㉿kali)-[~/…/projects/lab08-to4no/.github/workflows]
└─$ ls                 
Linux.yml  Windows.yml
```
```sh                                                                                                                                                                                                                                        
┌──(kali㉿kali)-[~/…/projects/lab08-to4no/.github/workflows]
```
<details><summary>$ nano CI.yml </summary>       

```sh
name: CMake

on:
  push:
    branches: [main]
    tags: -"v*0.*"
  pull_request:
    branches: [main]

env:
  BUILD_TYPE: Release

jobs:
  build_Linux:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3

      - name: Configure Solver
        run: cmake -H. -B_build -DCPACK_GENERATOR="TGZ"

      - name: Build Solver
        run: cmake --build _build --target package

      - name: Make Solver Package
        run: cd _build && cpack -G "DEB" &&
             cpack -G "RPM" &&
             mkdir ../artifacts &&
             mv *.tar.gz ../artifacts/ &&
             mv *.deb ../artifacts/ &&
             mv *.rpm ../artifacts/
      - name: Publish
        uses: actions/upload-artifact@v2
        with:
          name: DebRpm
          path: artifacts/
```

</details>

```sh                                                                                                                                                                                                                                        
┌──(kali㉿kali)-[~/…/projects/lab08-to4no/.github/workflows]
└─$ cd ../..                        
                                                                                                                                                                                                                                         
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/lab08-to4no]
└─$ mkdir include && cd include  
                                                                                                                                                                                                                                         
┌──(kali㉿kali)-[~/…/workspace/projects/lab08-to4no/include]
 ```

<details><summary>$ nano print.hpp</summary>

```sh
#include <fstream>
#include <iostream>
#include <string>

void print(const std::string& text, std::ofstream& out);
void print(const std::string& text, std::ostream& out = std::cout);
```
</details>

```sh                                                                                                                                                                            
┌──(kali㉿kali)-[~/…/workspace/projects/lab08-to4no/include]
└─$ cd ..   
                                                                                                                                                                                                                                         
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/lab08-to4no]
└─$ cd sources           
cd: no such file or directory: sources
                                                                                                                                                                                                                                         
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/lab08-to4no]
└─$ mkdir sources && cd sources 
```

```sh                                                                                                                                                                                                                                        
┌──(kali㉿kali)-[~/…/workspace/projects/lab08-to4no/sources]
```

<details><summary>$ nano print.cpp </summary>

```sh
#include <fstream>
#include <iostream>
#include <string>
void print(const std::string& text, std::ofstream& out);
void print(const std::string& text, std::ostream& out = std::cout);
void print(const std::string& text, std::ostream& out)
{
  out << text;
}

void print(const std::string& text, std::ofstream& out)
{
  out << text;
}
```

</details>

```sh
┌──(kali㉿kali)-[~/…/workspace/projects/lab08-to4no/sources]
└─$ cd .. && ls                         
formatter_ex_lib  formatter_lib  hello_world_application  include  README.md  solver_application  solver_lib  sources
                                                                                                                                                                                                                                         
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/lab08-to4no]
└─$ mkdir demo                 
                                                                                                                                                                                                                                         
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/lab08-to4no]
└─$ cd demo    
                                                                                                                                                                                                                                         
┌──(kali㉿kali)-[~/…/workspace/projects/lab08-to4no/demo]
```
<details><summary>$ nano main.cpp</summary>

```sh
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <string>

void print(const std::string& text, std::ofstream& out);
void print(const std::string& text, std::ostream& out = std::cout);

int main(int argc, char* argv[])
{
  const char* log_path = std::getenv("LOG_PATH");
  if (log_path == nullptr)
  {
    std::cerr << "undefined environment variable: LOG_PATH" << std::endl;
    return 1;
  }
  std::string text;
  while (std::cin >> text)
  {
    std::ofstream out{log_path, std::ios_base::app};
    print(text, out);
    out << std::endl;
  }
}
```

</details>

```sh
┌──(kali㉿kali)-[~/…/workspace/projects/lab08-to4no/demo]
└─$ cd ..      
                                                                                                                                                                                                                                         
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/lab08-to4no]
└─$ git init                                                         
hint: Using 'master' as the name for the initial branch. This default branch name
hint: is subject to change. To configure the initial branch name to use in all
hint: of your new repositories, which will suppress this warning, call:
hint: 
hint:   git config --global init.defaultBranch <name>
hint: 
hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
hint: 'development'. The just-created branch can be renamed via this command:
hint: 
hint:   git branch -m <name>
Initialized empty Git repository in /home/kali/HECCYLLIujTbmy/workspace/projects/lab08-to4no/.git/
                                                                                                                                                                                                                                         
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/lab08-to4no]
└─$ git remote add origin https://github.com/HECCYLLIujTbmy/lab08-to4no
```
```sh 
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/lab08-to4no]
```
<details><summary>$ nano CMakeLists.txt</summary>

```sh
cmake_minimum_required(VERSION 3.4)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

option(BUILD_EXAMPLES "Build examples" OFF)
option(BUILD_TESTS "Build tests" OFF)

project(print)
set(PRINT_VERSION_MAJOR 0)
set(PRINT_VERSION_MINOR 1)
set(PRINT_VERSION_PATCH 0)
set(PRINT_VERSION_TWEAK 0)
set(PRINT_VERSION
  ${PRINT_VERSION_MAJOR}.${PRINT_VERSION_MINOR}.${PRINT_VERSION_PATCH}.${PRINT_VERSION_TWEAK})
set(PRINT_VERSION_STRING "v${PRINT_VERSION}")

add_library(print STATIC ${CMAKE_CURRENT_SOURCE_DIR}/sources/print.cpp)

target_include_directories(print PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:include>
)

if(BUILD_EXAMPLES)
  file(GLOB EXAMPLE_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/examples/*.cpp")
  foreach(EXAMPLE_SOURCE ${EXAMPLE_SOURCES})
    get_filename_component(EXAMPLE_NAME ${EXAMPLE_SOURCE} NAME_WE)
    add_executable(${EXAMPLE_NAME} ${EXAMPLE_SOURCE})
    target_link_libraries(${EXAMPLE_NAME} print)
    install(TARGETS ${EXAMPLE_NAME}
      RUNTIME DESTINATION bin
    )
  endforeach(EXAMPLE_SOURCE ${EXAMPLE_SOURCES})
endif()

install(TARGETS print
    EXPORT print-config
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
)

install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/include/ DESTINATION include)
install(EXPORT print-config DESTINATION cmake)

if(BUILD_TESTS)
    enable_testing()
    file(GLOB ${PROJECT_NAME}_TEST_SOURCES tests/*.cpp)
    add_executable(check ${${PROJECT_NAME}_TEST_SOURCES})
    target_link_libraries(check ${PROJECT_NAME} GTest::main)
    add_test(NAME check COMMAND check)
endif()

add_executable(demo demo/main.cpp)
target_link_libraries(demo print)
install(TARGETS demo RUNTIME DESTINATION bin)

include(CPackConfig.cmake)
```

</details>

```sh
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/lab08-to4no]
```
<details><summary>$ nano CPackConfig.cmake</summary>

```sh
include(InstallRequiredSystemLibraries)

set(CPACK_PACKAGE_CONTACT donotdisturb@yandex.ru)
set(CPACK_PACKAGE_VERSION_MAJOR ${PRINT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PRINT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PRINT_VERSION_PATCH})
set(CPACK_PACKAGE_VERSION_TWEAK ${PRINT_VERSION_TWEAK})
set(CPACK_PACKAGE_VERSION ${PRINT_VERSION})

set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "static C++ library for printing")

set(CPACK_RESOURCE_FILE_README \${CMAKE_CURRENT_SOURCE_DIR}/README.md)

set(CPACK_RPM_PACKAGE_NAME "solver")
set(CPACK_RPM_PACKAGE_LICENSE "MIT")
set(CPACK_RPM_PACKAGE_GROUP "print-solver")
set(CPACK_RPM_PACKAGE_VERSION CPACK_PACKAGE_VERSION)

set(CPACK_DEBIAN_PACKAGE_NAME "solver")
set(CPACK_DEBIAN_PACKAGE_PREDEPENDS "cmake >= 3.0")
set(CPACK_DEBIAN_PACKAGE_VERSION CPACK_PACKAGE_VERSION)

include(CPack)
```

</details>

```sh
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/lab08-to4no]
└─$
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/lab08-to4no]
```
<details><summary> $ sudo service docker status</summary>

```sh
[sudo] password for kali: 
● docker.service - Docker Application Container Engine
     Loaded: loaded (/lib/systemd/system/docker.service; enabled; preset: enabled)
     Active: active (running) since Sun 2023-06-25 11:38:57 EDT; 1h 0min ago
TriggeredBy: ● docker.socket
       Docs: https://docs.docker.com
   Main PID: 681 (dockerd)
      Tasks: 11
     Memory: 116.7M
        CPU: 717ms
     CGroup: /system.slice/docker.service
             └─681 /usr/sbin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock

Jun 25 11:38:51 kali dockerd[681]: time="2023-06-25T11:38:51.644948327-04:00" level=info msg="[core] Subchannel Connectivity change to READY" module=grpc
Jun 25 11:38:51 kali dockerd[681]: time="2023-06-25T11:38:51.644961482-04:00" level=info msg="[core] Channel Connectivity change to READY" module=grpc
Jun 25 11:38:52 kali dockerd[681]: time="2023-06-25T11:38:52.085954925-04:00" level=info msg="[graphdriver] using prior storage driver: overlay2"
Jun 25 11:38:53 kali dockerd[681]: time="2023-06-25T11:38:53.018406820-04:00" level=info msg="Loading containers: start."
Jun 25 11:38:55 kali dockerd[681]: time="2023-06-25T11:38:55.419428111-04:00" level=info msg="Default bridge (docker0) is assigned with an IP address 172.17.0.0/16. Daemon option --bip can be used to set a preferred IP address"
Jun 25 11:38:55 kali dockerd[681]: time="2023-06-25T11:38:55.527014242-04:00" level=info msg="Loading containers: done."
Jun 25 11:38:57 kali dockerd[681]: time="2023-06-25T11:38:57.057369363-04:00" level=info msg="Docker daemon" commit=5d6db84 graphdriver(s)=overlay2 version=20.10.24+dfsg1
Jun 25 11:38:57 kali dockerd[681]: time="2023-06-25T11:38:57.093728235-04:00" level=info msg="Daemon has completed initialization"
Jun 25 11:38:57 kali systemd[1]: Started Docker Application Container Engine.
Jun 25 11:38:57 kali dockerd[681]: time="2023-06-25T11:38:57.517946002-04:00" level=info msg="API listen on /run/docker.sock"
```

</details>

```sh
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/lab08-to4no]
└─$ sudo ls -la /var/run/docker.sock
srw-rw---- 1 root docker 0 Jun 25 10:11 /var/run/docker.sock
                                                                                                
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/lab08-to4no]
└─$ sudo chown kali:docker /var/run/docker.sock    
                                                                                                
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/lab08-to4no]
└─$ sudo ls -la /var/run/docker.sock
srw-rw---- 1 kali docker 0 Jun 25 10:11 /var/run/docker.sock
```

```sh                                                                                                
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/lab08-to4no]
```

<details><summary> $ docker build -t logger . </summary>

```sh
Sending build context to Docker daemon  2.196MB
Step 1/12 : FROM ubuntu:18.04
 ---> f9a80a55f492
Step 2/12 : RUN apt update
 ---> Using cache
 ---> feb87af77533
Step 3/12 : RUN apt install -yy gcc g++ cmake
 ---> Using cache
 ---> bc1108aa78a1
Step 4/12 : COPY . print/
 ---> 5bd660630533
Step 5/12 : WORKDIR print
 ---> Running in c7d6bddba0a1
Removing intermediate container c7d6bddba0a1
 ---> 32b9f72817db
Step 6/12 : RUN cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install
 ---> Running in 62d48a93e1ca
-- The C compiler identification is GNU 7.5.0
-- The CXX compiler identification is GNU 7.5.0                                                                                                                                                                                             
-- Check for working C compiler: /usr/bin/cc                                                                                                                                                                                                
-- Check for working C compiler: /usr/bin/cc -- works                                                                                                                                                                                       
-- Detecting C compiler ABI info                                                                                                                                                                                                            
-- Detecting C compiler ABI info - done                                                                                                                                                                                                     
-- Detecting C compile features                                                                                                                                                                                                             
-- Detecting C compile features - done                                                                                                                                                                                                      
-- Check for working CXX compiler: /usr/bin/c++                                                                                                                                                                                             
-- Check for working CXX compiler: /usr/bin/c++ -- works                                                                                                                                                                                    
-- Detecting CXX compiler ABI info                                                                                                                                                                                                          
-- Detecting CXX compiler ABI info - done                                                                                                                                                                                                   
-- Detecting CXX compile features                                                                                                                                                                                                           
-- Detecting CXX compile features - done                                                                                                                                                                                                    
-- Configuring done                                                                                                                                                                                                                         
-- Generating done                                                                                                                                                                                                                          
-- Build files have been written to: /print/_build                                                                                                                                                                                          
Removing intermediate container 62d48a93e1ca                                                                                                                                                                                                
 ---> 31d0cb6e84bf                                                                                                                                                                                                                          
Step 7/12 : RUN cmake --build _build                                                                                                                                                                                                        
 ---> Running in d91a4d081d2b                                                                                                                                                                                                               
Scanning dependencies of target print                                                                                                                                                                                                       
[ 25%] Building CXX object CMakeFiles/print.dir/sources/print.cpp.o                                                                                                                                                                         
[ 50%] Linking CXX static library libprint.a                                                                                                                                                                                                
[ 50%] Built target print                                                                                                                                                                                                                   
Scanning dependencies of target demo
[ 75%] Building CXX object CMakeFiles/demo.dir/demo/main.cpp.o
[100%] Linking CXX executable demo
[100%] Built target demo
Removing intermediate container d91a4d081d2b
 ---> d69f18fa7507
Step 8/12 : RUN cmake --build _build --target install
 ---> Running in 68ed704901b8
[ 50%] Built target print
[100%] Built target demo
Install the project...
-- Install configuration: "Release"
-- Installing: /print/_install/lib/libprint.a
-- Installing: /print/_install/include
-- Installing: /print/_install/include/print.hpp
-- Installing: /print/_install/cmake/print-config.cmake
-- Installing: /print/_install/cmake/print-config-release.cmake
-- Installing: /print/_install/bin/demo
Removing intermediate container 68ed704901b8
 ---> 28637c6223f1
Step 9/12 : ENV LOG_PATH /home/logs/log.txt
 ---> Running in b2dcc1ff5c4a
Removing intermediate container b2dcc1ff5c4a
 ---> c53d2573e3cc
Step 10/12 : VOLUME /home/logs
 ---> Running in cf7ac67401e5
Removing intermediate container cf7ac67401e5
 ---> cb547abe2efa
Step 11/12 : WORKDIR /print/_install/bin
 ---> Running in ef09250d780c
Removing intermediate container ef09250d780c
 ---> 2563397720e1
Step 12/12 : ENTRYPOINT ./demo
 ---> Running in b0933fe90fed
Removing intermediate container b0933fe90fed
 ---> 518eb84a4e96
Successfully built 518eb84a4e96
Successfully tagged logger:latest
```

</details>

```sh
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/lab08-to4no]
└─$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED             SIZE
logger       latest    518eb84a4e96   54 seconds ago      336MB
<none>       <none>    0ab93ae8ba92   About an hour ago   337MB
<none>       <none>    9762afacfc67   2 hours ago         337MB
ubuntu       18.04     f9a80a55f492   3 weeks ago         63.2MB
                                                                                                
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/lab08-to4no]
└─$ mkdir logs
 ```
                                                                                               
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/lab08-to4no]
<details><summary> $ sudo docker inspect logger</summary>

```sh
[
    {
        "Id": "sha256:518eb84a4e968542854b32a000d7acd58ad2f0b416cffe10f0ed95115a22fd58",
        "RepoTags": [
            "logger:latest"
        ],
        "RepoDigests": [],
        "Parent": "sha256:2563397720e1baad90d06f8b9cdac9f39ab74d081a9b6eacb40507cd4a74af44",
        "Comment": "",
        "Created": "2023-06-25T16:41:52.189911852Z",
        "Container": "b0933fe90fed3c5ec85ce5b46f0106f8b7b2b1928745b5f48bf9cdeb5975bee8",
        "ContainerConfig": {
            "Hostname": "b0933fe90fed",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "LOG_PATH=/home/logs/log.txt"
            ],
            "Cmd": [
                "/bin/sh",
                "-c",
                "#(nop) ",
                "ENTRYPOINT [\"/bin/sh\" \"-c\" \"./demo\"]"
            ],
            "Image": "sha256:2563397720e1baad90d06f8b9cdac9f39ab74d081a9b6eacb40507cd4a74af44",
            "Volumes": {
                "/home/logs": {}
            },
            "WorkingDir": "/print/_install/bin",
            "Entrypoint": [
                "/bin/sh",
                "-c",
                "./demo"
            ],
            "OnBuild": null,
            "Labels": {
                "org.opencontainers.image.ref.name": "ubuntu",
                "org.opencontainers.image.version": "18.04"
            }
        },
        "DockerVersion": "20.10.24+dfsg1",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "LOG_PATH=/home/logs/log.txt"
            ],
            "Cmd": null,
            "Image": "sha256:2563397720e1baad90d06f8b9cdac9f39ab74d081a9b6eacb40507cd4a74af44",
            "Volumes": {
                "/home/logs": {}
            },
            "WorkingDir": "/print/_install/bin",
            "Entrypoint": [
                "/bin/sh",
                "-c",
                "./demo"
            ],
            "OnBuild": null,
            "Labels": {
                "org.opencontainers.image.ref.name": "ubuntu",
                "org.opencontainers.image.version": "18.04"
            }
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 335553641,
        "VirtualSize": 335553641,
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/51ba6e1f5c3dbcd19487f0ae1b65ec893d21f5e0b199c99baa53240e63371df0/diff:/var/lib/docker/overlay2/e63544c6ea351c871a91aeaa9d48f2bd473956683eb16529ab26bfa135589550/diff:/var/lib/docker/overlay2/456449c8fe1562e83558b345e75f60d3046b2b96dfeff04e945f1349daea05cd/diff:/var/lib/docker/overlay2/cf6b85136b8e25294f8ceb8065a4103494ce23769ed3b008c24965a4aa24dd32/diff:/var/lib/docker/overlay2/23e0f260aa25da15ad9112772b041879e3459fe0e3af4ebba46e57de0154991b/diff:/var/lib/docker/overlay2/44b49c8829825036b78d4b1a8c428ffee320a456a4acb0daec8ecd388afe2cf1/diff",
                "MergedDir": "/var/lib/docker/overlay2/7216e1fc8f92a01c73a8457002ac8ead591d4db5c8155e049b7f34af7d099294/merged",
                "UpperDir": "/var/lib/docker/overlay2/7216e1fc8f92a01c73a8457002ac8ead591d4db5c8155e049b7f34af7d099294/diff",
                "WorkDir": "/var/lib/docker/overlay2/7216e1fc8f92a01c73a8457002ac8ead591d4db5c8155e049b7f34af7d099294/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:548a79621a426b4eb077c926eabac5a8620c454fb230640253e1b44dc7dd7562",
                "sha256:2feeb99e6aedb64f052ca19afaf6ea404d09d417f938dc071216942a5c1a2445",
                "sha256:a7ef9866eef3a2889258b185c9151a128a70ae4717cfc7721742e43216022ed6",
                "sha256:ae6426118f5c79c0af312ae8d3549d961cef5061b975062ed7bc7c4beb2c8388",
                "sha256:daafa645dc47a04fef30898cbd731be5ebb125edbfef8b28f65fef707d339f6c",
                "sha256:941b99e0e7295ee11df67cc8adc810d90a67cde7fe387cf5acf5493439bc9f45",
                "sha256:14ec324a5f8defcba21cb440d1c2a1dd2123270e2587a3e482bdcf035df038cc"
            ]
        },
        "Metadata": {
            "LastTagTime": "2023-06-25T12:41:52.424606019-04:00"
        }
    }
]
```

</details>

```sh
   ──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/lab08-to4no]
└─$  cat logs/log.txt 
cat: logs/log.txt: No such file or directory
                                                                                                
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/lab08-to4no]
└─$ ls
build              demo              formatter_lib            logs                solver_lib
CMakeLists.txt     Dockerfile        hello_world_application  README.md           sources
CPackConfig.cmake  formatter_ex_lib  include                  solver_application
                                                                                                
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/lab08-to4no]
└─$ cd logs                                         
```

```sh                                                                                               
┌──(kali㉿kali)-[~/…/workspace/projects/lab08-to4no/logs]
└─$ nano log.txt        
                                                                                                
┌──(kali㉿kali)-[~/…/workspace/projects/lab08-to4no/logs]
└─$ cd ..  
                                                                                                
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/lab08-to4no]
└─$ git add -A                                                         
                                                                                                
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/lab08-to4no]
```

<details><summary> $ git commit -m"f1rst push" </summary>

```sh
[master (root-commit) 068623c] f1rst push
 340 files changed, 30674 insertions(+)
 create mode 100644 .github/workflows/CI.yml
 create mode 100644 .github/workflows/Linux.yml
 create mode 100644 .github/workflows/Windows.yml
 create mode 100644 CMakeLists.txt
 create mode 100644 CPackConfig.cmake
 create mode 100644 Dockerfile
 create mode 100644 README.md
 create mode 100644 build/CMakeCache.txt
 create mode 100644 build/CMakeFiles/3.24.3/CMakeCCompiler.cmake
 create mode 100644 build/CMakeFiles/3.24.3/CMakeCXXCompiler.cmake
 create mode 100755 build/CMakeFiles/3.24.3/CMakeDetermineCompilerABI_C.bin
 create mode 100755 build/CMakeFiles/3.24.3/CMakeDetermineCompilerABI_CXX.bin
 create mode 100644 build/CMakeFiles/3.24.3/CMakeSystem.cmake
 create mode 100644 build/CMakeFiles/3.24.3/CompilerIdC/CMakeCCompilerId.c
 create mode 100755 build/CMakeFiles/3.24.3/CompilerIdC/a.out
 create mode 100644 build/CMakeFiles/3.24.3/CompilerIdCXX/CMakeCXXCompilerId.cpp
 create mode 100755 build/CMakeFiles/3.24.3/CompilerIdCXX/a.out
 create mode 100644 build/CMakeFiles/CMakeDirectoryInformation.cmake
 create mode 100644 build/CMakeFiles/CMakeOutput.log
 create mode 100644 build/CMakeFiles/Export/272ceadb8458515b2ae4b5630a6029cc/print-config-noconfig.cmake
 create mode 100644 build/CMakeFiles/Export/272ceadb8458515b2ae4b5630a6029cc/print-config.cmake
 create mode 100644 build/CMakeFiles/Makefile.cmake
 create mode 100644 build/CMakeFiles/Makefile2
 create mode 100644 build/CMakeFiles/TargetDirectories.txt
 create mode 100644 build/CMakeFiles/cmake.check_cache
 create mode 100644 build/CMakeFiles/demo.dir/DependInfo.cmake
 create mode 100644 build/CMakeFiles/demo.dir/build.make
 create mode 100644 build/CMakeFiles/demo.dir/cmake_clean.cmake
 create mode 100644 build/CMakeFiles/demo.dir/compiler_depend.make
 create mode 100644 build/CMakeFiles/demo.dir/compiler_depend.ts
 create mode 100644 build/CMakeFiles/demo.dir/demo/main.cpp.o
 create mode 100644 build/CMakeFiles/demo.dir/demo/main.cpp.o.d
 create mode 100644 build/CMakeFiles/demo.dir/depend.make
 create mode 100644 build/CMakeFiles/demo.dir/flags.make
 create mode 100644 build/CMakeFiles/demo.dir/link.txt
 create mode 100644 build/CMakeFiles/demo.dir/progress.make
 create mode 100644 build/CMakeFiles/print.dir/DependInfo.cmake
 create mode 100644 build/CMakeFiles/print.dir/build.make
 create mode 100644 build/CMakeFiles/print.dir/cmake_clean.cmake
 create mode 100644 build/CMakeFiles/print.dir/cmake_clean_target.cmake
 create mode 100644 build/CMakeFiles/print.dir/compiler_depend.make
 create mode 100644 build/CMakeFiles/print.dir/compiler_depend.ts
 create mode 100644 build/CMakeFiles/print.dir/depend.make
 create mode 100644 build/CMakeFiles/print.dir/flags.make
 create mode 100644 build/CMakeFiles/print.dir/link.txt
 create mode 100644 build/CMakeFiles/print.dir/progress.make
 create mode 100644 build/CMakeFiles/print.dir/sources/print.cpp.o
 create mode 100644 build/CMakeFiles/print.dir/sources/print.cpp.o.d
 create mode 100644 build/CMakeFiles/progress.marks
 create mode 100644 build/CPackConfig.cmake
 create mode 100644 build/CPackSourceConfig.cmake
 create mode 100644 build/Makefile
 create mode 100644 build/cmake_install.cmake
 create mode 100755 build/demo
 create mode 100644 build/libprint.a
 create mode 100644 demo/main.cpp
 create mode 100644 formatter_ex_lib/CMakeLists.txt
 create mode 100644 formatter_ex_lib/_build/CMakeCache.txt
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/3.22.1/CMakeCCompiler.cmake
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/3.22.1/CMakeCXXCompiler.cmake
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/3.22.1/CMakeDetermineCompilerABI_C.bin
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/3.22.1/CMakeDetermineCompilerABI_CXX.bin
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/3.22.1/CMakeSystem.cmake
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/3.22.1/CompilerIdC/CMakeCCompilerId.c
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/3.22.1/CompilerIdC/a.out
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/3.22.1/CompilerIdCXX/CMakeCXXCompilerId.cpp
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/3.22.1/CompilerIdCXX/a.out
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/CMakeDirectoryInformation.cmake
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/CMakeOutput.log
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/Makefile.cmake
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/Makefile2
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/TargetDirectories.txt
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/cmake.check_cache
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/formatter_ex.dir/DependInfo.cmake
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/formatter_ex.dir/build.make
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/formatter_ex.dir/cmake_clean.cmake
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/formatter_ex.dir/cmake_clean_target.cmake
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/formatter_ex.dir/compiler_depend.make
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/formatter_ex.dir/compiler_depend.ts
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/formatter_ex.dir/depend.make
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/formatter_ex.dir/flags.make
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/formatter_ex.dir/formatter_ex.cpp.o
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/formatter_ex.dir/formatter_ex.cpp.o.d
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/formatter_ex.dir/link.txt
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/formatter_ex.dir/progress.make
 create mode 100644 formatter_ex_lib/_build/CMakeFiles/progress.marks
 create mode 100644 formatter_ex_lib/_build/Makefile
 create mode 100644 formatter_ex_lib/_build/cmake_install.cmake
 create mode 100644 formatter_ex_lib/_build/formatter/CMakeFiles/CMakeDirectoryInformation.cmake
 create mode 100644 formatter_ex_lib/_build/formatter/CMakeFiles/formatter.dir/DependInfo.cmake
 create mode 100644 formatter_ex_lib/_build/formatter/CMakeFiles/formatter.dir/build.make
 create mode 100644 formatter_ex_lib/_build/formatter/CMakeFiles/formatter.dir/cmake_clean.cmake
 create mode 100644 formatter_ex_lib/_build/formatter/CMakeFiles/formatter.dir/cmake_clean_target.cmake
 create mode 100644 formatter_ex_lib/_build/formatter/CMakeFiles/formatter.dir/compiler_depend.make
 create mode 100644 formatter_ex_lib/_build/formatter/CMakeFiles/formatter.dir/compiler_depend.ts
 create mode 100644 formatter_ex_lib/_build/formatter/CMakeFiles/formatter.dir/depend.make
 create mode 100644 formatter_ex_lib/_build/formatter/CMakeFiles/formatter.dir/flags.make
 create mode 100644 formatter_ex_lib/_build/formatter/CMakeFiles/formatter.dir/formatter.cpp.o
 create mode 100644 formatter_ex_lib/_build/formatter/CMakeFiles/formatter.dir/formatter.cpp.o.d
 create mode 100644 formatter_ex_lib/_build/formatter/CMakeFiles/formatter.dir/link.txt
 create mode 100644 formatter_ex_lib/_build/formatter/CMakeFiles/formatter.dir/progress.make
 create mode 100644 formatter_ex_lib/_build/formatter/CMakeFiles/progress.marks
 create mode 100644 formatter_ex_lib/_build/formatter/Makefile
 create mode 100644 formatter_ex_lib/_build/formatter/cmake_install.cmake
 create mode 100644 formatter_ex_lib/_build/formatter/libformatter.a
 create mode 100644 formatter_ex_lib/_build/libformatter_ex.a
 create mode 100644 formatter_ex_lib/formatter_ex.cpp
 create mode 100644 formatter_ex_lib/formatter_ex.h
 create mode 100644 formatter_lib/CMakeLists.txt
 create mode 100644 formatter_lib/_build/CMakeCache.txt
 create mode 100644 formatter_lib/_build/CMakeFiles/3.22.1/CMakeCCompiler.cmake
 create mode 100644 formatter_lib/_build/CMakeFiles/3.22.1/CMakeCXXCompiler.cmake
 create mode 100644 formatter_lib/_build/CMakeFiles/3.22.1/CMakeDetermineCompilerABI_C.bin
 create mode 100644 formatter_lib/_build/CMakeFiles/3.22.1/CMakeDetermineCompilerABI_CXX.bin
 create mode 100644 formatter_lib/_build/CMakeFiles/3.22.1/CMakeSystem.cmake
 create mode 100644 formatter_lib/_build/CMakeFiles/3.22.1/CompilerIdC/CMakeCCompilerId.c
 create mode 100644 formatter_lib/_build/CMakeFiles/3.22.1/CompilerIdC/a.out
 create mode 100644 formatter_lib/_build/CMakeFiles/3.22.1/CompilerIdCXX/CMakeCXXCompilerId.cpp
 create mode 100644 formatter_lib/_build/CMakeFiles/3.22.1/CompilerIdCXX/a.out
 create mode 100644 formatter_lib/_build/CMakeFiles/CMakeDirectoryInformation.cmake
 create mode 100644 formatter_lib/_build/CMakeFiles/CMakeOutput.log
 create mode 100644 formatter_lib/_build/CMakeFiles/Makefile.cmake
 create mode 100644 formatter_lib/_build/CMakeFiles/Makefile2
 create mode 100644 formatter_lib/_build/CMakeFiles/TargetDirectories.txt
 create mode 100644 formatter_lib/_build/CMakeFiles/cmake.check_cache
 create mode 100644 formatter_lib/_build/CMakeFiles/formatter.dir/DependInfo.cmake
 create mode 100644 formatter_lib/_build/CMakeFiles/formatter.dir/build.make
 create mode 100644 formatter_lib/_build/CMakeFiles/formatter.dir/cmake_clean.cmake
 create mode 100644 formatter_lib/_build/CMakeFiles/formatter.dir/cmake_clean_target.cmake
 create mode 100644 formatter_lib/_build/CMakeFiles/formatter.dir/compiler_depend.make
 create mode 100644 formatter_lib/_build/CMakeFiles/formatter.dir/compiler_depend.ts
 create mode 100644 formatter_lib/_build/CMakeFiles/formatter.dir/depend.make
 create mode 100644 formatter_lib/_build/CMakeFiles/formatter.dir/flags.make
 create mode 100644 formatter_lib/_build/CMakeFiles/formatter.dir/formatter.cpp.o
 create mode 100644 formatter_lib/_build/CMakeFiles/formatter.dir/formatter.cpp.o.d
 create mode 100644 formatter_lib/_build/CMakeFiles/formatter.dir/link.txt
 create mode 100644 formatter_lib/_build/CMakeFiles/formatter.dir/progress.make
 create mode 100644 formatter_lib/_build/CMakeFiles/progress.marks
 create mode 100644 formatter_lib/_build/Makefile
 create mode 100644 formatter_lib/_build/cmake_install.cmake
 create mode 100644 formatter_lib/_build/libformatter.a
 create mode 100644 formatter_lib/formatter.cpp
 create mode 100644 formatter_lib/formatter.h
 create mode 100644 hello_world_application/CMakeLists.txt
 create mode 100644 hello_world_application/_build/CMakeCache.txt
 create mode 100644 hello_world_application/_build/CMakeFiles/3.22.1/CMakeCCompiler.cmake
 create mode 100644 hello_world_application/_build/CMakeFiles/3.22.1/CMakeCXXCompiler.cmake
 create mode 100644 hello_world_application/_build/CMakeFiles/3.22.1/CMakeDetermineCompilerABI_C.bin
 create mode 100644 hello_world_application/_build/CMakeFiles/3.22.1/CMakeDetermineCompilerABI_CXX.bin
 create mode 100644 hello_world_application/_build/CMakeFiles/3.22.1/CMakeSystem.cmake
 create mode 100644 hello_world_application/_build/CMakeFiles/3.22.1/CompilerIdC/CMakeCCompilerId.c
 create mode 100644 hello_world_application/_build/CMakeFiles/3.22.1/CompilerIdC/a.out
 create mode 100644 hello_world_application/_build/CMakeFiles/3.22.1/CompilerIdCXX/CMakeCXXCompilerId.cpp
 create mode 100644 hello_world_application/_build/CMakeFiles/3.22.1/CompilerIdCXX/a.out
 create mode 100644 hello_world_application/_build/CMakeFiles/CMakeDirectoryInformation.cmake
 create mode 100644 hello_world_application/_build/CMakeFiles/CMakeOutput.log
 create mode 100644 hello_world_application/_build/CMakeFiles/Makefile.cmake
 create mode 100644 hello_world_application/_build/CMakeFiles/Makefile2
 create mode 100644 hello_world_application/_build/CMakeFiles/TargetDirectories.txt
 create mode 100644 hello_world_application/_build/CMakeFiles/cmake.check_cache
 create mode 100644 hello_world_application/_build/CMakeFiles/example.dir/DependInfo.cmake
 create mode 100644 hello_world_application/_build/CMakeFiles/example.dir/build.make
 create mode 100644 hello_world_application/_build/CMakeFiles/example.dir/cmake_clean.cmake
 create mode 100644 hello_world_application/_build/CMakeFiles/example.dir/compiler_depend.internal
 create mode 100644 hello_world_application/_build/CMakeFiles/example.dir/compiler_depend.make
 create mode 100644 hello_world_application/_build/CMakeFiles/example.dir/compiler_depend.ts
 create mode 100644 hello_world_application/_build/CMakeFiles/example.dir/depend.make
 create mode 100644 hello_world_application/_build/CMakeFiles/example.dir/flags.make
 create mode 100644 hello_world_application/_build/CMakeFiles/example.dir/hello_world.cpp.o
 create mode 100644 hello_world_application/_build/CMakeFiles/example.dir/hello_world.cpp.o.d
 create mode 100644 hello_world_application/_build/CMakeFiles/example.dir/link.txt
 create mode 100644 hello_world_application/_build/CMakeFiles/example.dir/progress.make
 create mode 100644 hello_world_application/_build/CMakeFiles/progress.marks
 create mode 100644 hello_world_application/_build/Makefile
 create mode 100644 hello_world_application/_build/cmake_install.cmake
 create mode 100644 hello_world_application/_build/example
 create mode 100644 hello_world_application/_build/formatter_ex/CMakeFiles/CMakeDirectoryInformation.cmake
 create mode 100644 hello_world_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/DependInfo.cmake
 create mode 100644 hello_world_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/build.make
 create mode 100644 hello_world_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/cmake_clean.cmake
 create mode 100644 hello_world_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/cmake_clean_target.cmake
 create mode 100644 hello_world_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/compiler_depend.internal
 create mode 100644 hello_world_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/compiler_depend.make
 create mode 100644 hello_world_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/compiler_depend.ts
 create mode 100644 hello_world_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/depend.make
 create mode 100644 hello_world_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/flags.make
 create mode 100644 hello_world_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/formatter_ex.cpp.o
 create mode 100644 hello_world_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/formatter_ex.cpp.o.d
 create mode 100644 hello_world_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/link.txt
 create mode 100644 hello_world_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/progress.make
 create mode 100644 hello_world_application/_build/formatter_ex/CMakeFiles/progress.marks
 create mode 100644 hello_world_application/_build/formatter_ex/Makefile
 create mode 100644 hello_world_application/_build/formatter_ex/cmake_install.cmake
 create mode 100644 hello_world_application/_build/formatter_ex/formatter/CMakeFiles/CMakeDirectoryInformation.cmake
 create mode 100644 hello_world_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/DependInfo.cmake
 create mode 100644 hello_world_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/build.make
 create mode 100644 hello_world_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/cmake_clean.cmake
 create mode 100644 hello_world_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/cmake_clean_target.cmake
 create mode 100644 hello_world_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/compiler_depend.internal
 create mode 100644 hello_world_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/compiler_depend.make
 create mode 100644 hello_world_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/compiler_depend.ts
 create mode 100644 hello_world_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/depend.make
 create mode 100644 hello_world_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/flags.make
 create mode 100644 hello_world_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/formatter.cpp.o
 create mode 100644 hello_world_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/formatter.cpp.o.d
 create mode 100644 hello_world_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/link.txt
 create mode 100644 hello_world_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/progress.make
 create mode 100644 hello_world_application/_build/formatter_ex/formatter/CMakeFiles/progress.marks
 create mode 100644 hello_world_application/_build/formatter_ex/formatter/Makefile
 create mode 100644 hello_world_application/_build/formatter_ex/formatter/cmake_install.cmake
 create mode 100644 hello_world_application/_build/formatter_ex/formatter/libformatter.a
 create mode 100644 hello_world_application/_build/formatter_ex/libformatter_ex.a
 create mode 100644 hello_world_application/hello_world.cpp
 create mode 100644 include/print.hpp
 create mode 100644 logs/log.txt
 create mode 100644 solver_application/CMakeLists.txt
 create mode 100644 solver_application/_build/CMakeCache.txt
 create mode 100644 solver_application/_build/CMakeFiles/3.22.1/CMakeCCompiler.cmake
 create mode 100644 solver_application/_build/CMakeFiles/3.22.1/CMakeCXXCompiler.cmake
 create mode 100644 solver_application/_build/CMakeFiles/3.22.1/CMakeDetermineCompilerABI_C.bin
 create mode 100644 solver_application/_build/CMakeFiles/3.22.1/CMakeDetermineCompilerABI_CXX.bin
 create mode 100644 solver_application/_build/CMakeFiles/3.22.1/CMakeSystem.cmake
 create mode 100644 solver_application/_build/CMakeFiles/3.22.1/CompilerIdC/CMakeCCompilerId.c
 create mode 100644 solver_application/_build/CMakeFiles/3.22.1/CompilerIdC/a.out
 create mode 100644 solver_application/_build/CMakeFiles/3.22.1/CompilerIdCXX/CMakeCXXCompilerId.cpp
 create mode 100644 solver_application/_build/CMakeFiles/3.22.1/CompilerIdCXX/a.out
 create mode 100644 solver_application/_build/CMakeFiles/CMakeDirectoryInformation.cmake
 create mode 100644 solver_application/_build/CMakeFiles/CMakeOutput.log
 create mode 100644 solver_application/_build/CMakeFiles/Makefile.cmake
 create mode 100644 solver_application/_build/CMakeFiles/Makefile2
 create mode 100644 solver_application/_build/CMakeFiles/TargetDirectories.txt
 create mode 100644 solver_application/_build/CMakeFiles/cmake.check_cache
 create mode 100644 solver_application/_build/CMakeFiles/example.dir/DependInfo.cmake
 create mode 100644 solver_application/_build/CMakeFiles/example.dir/build.make
 create mode 100644 solver_application/_build/CMakeFiles/example.dir/cmake_clean.cmake
 create mode 100644 solver_application/_build/CMakeFiles/example.dir/compiler_depend.internal
 create mode 100644 solver_application/_build/CMakeFiles/example.dir/compiler_depend.make
 create mode 100644 solver_application/_build/CMakeFiles/example.dir/compiler_depend.ts
 create mode 100644 solver_application/_build/CMakeFiles/example.dir/depend.make
 create mode 100644 solver_application/_build/CMakeFiles/example.dir/equation.cpp.o
 create mode 100644 solver_application/_build/CMakeFiles/example.dir/equation.cpp.o.d
 create mode 100644 solver_application/_build/CMakeFiles/example.dir/flags.make
 create mode 100644 solver_application/_build/CMakeFiles/example.dir/link.txt
 create mode 100644 solver_application/_build/CMakeFiles/example.dir/progress.make
 create mode 100644 solver_application/_build/CMakeFiles/progress.marks
 create mode 100644 solver_application/_build/Makefile
 create mode 100644 solver_application/_build/cmake_install.cmake
 create mode 100644 solver_application/_build/example
 create mode 100644 solver_application/_build/formatter_ex/CMakeFiles/CMakeDirectoryInformation.cmake
 create mode 100644 solver_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/DependInfo.cmake
 create mode 100644 solver_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/build.make
 create mode 100644 solver_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/cmake_clean.cmake
 create mode 100644 solver_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/cmake_clean_target.cmake
 create mode 100644 solver_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/compiler_depend.internal
 create mode 100644 solver_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/compiler_depend.make
 create mode 100644 solver_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/compiler_depend.ts
 create mode 100644 solver_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/depend.make
 create mode 100644 solver_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/flags.make
 create mode 100644 solver_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/formatter_ex.cpp.o
 create mode 100644 solver_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/formatter_ex.cpp.o.d
 create mode 100644 solver_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/link.txt
 create mode 100644 solver_application/_build/formatter_ex/CMakeFiles/formatter_ex.dir/progress.make
 create mode 100644 solver_application/_build/formatter_ex/CMakeFiles/progress.marks
 create mode 100644 solver_application/_build/formatter_ex/Makefile
 create mode 100644 solver_application/_build/formatter_ex/cmake_install.cmake
 create mode 100644 solver_application/_build/formatter_ex/formatter/CMakeFiles/CMakeDirectoryInformation.cmake
 create mode 100644 solver_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/DependInfo.cmake
 create mode 100644 solver_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/build.make
 create mode 100644 solver_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/cmake_clean.cmake
 create mode 100644 solver_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/cmake_clean_target.cmake
 create mode 100644 solver_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/compiler_depend.internal
 create mode 100644 solver_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/compiler_depend.make
 create mode 100644 solver_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/compiler_depend.ts
 create mode 100644 solver_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/depend.make
 create mode 100644 solver_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/flags.make
 create mode 100644 solver_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/formatter.cpp.o
 create mode 100644 solver_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/formatter.cpp.o.d
 create mode 100644 solver_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/link.txt
 create mode 100644 solver_application/_build/formatter_ex/formatter/CMakeFiles/formatter.dir/progress.make
 create mode 100644 solver_application/_build/formatter_ex/formatter/CMakeFiles/progress.marks
 create mode 100644 solver_application/_build/formatter_ex/formatter/Makefile
 create mode 100644 solver_application/_build/formatter_ex/formatter/cmake_install.cmake
 create mode 100644 solver_application/_build/formatter_ex/formatter/libformatter.a
 create mode 100644 solver_application/_build/formatter_ex/libformatter_ex.a
 create mode 100644 solver_application/_build/solver_lib/CMakeFiles/CMakeDirectoryInformation.cmake
 create mode 100644 solver_application/_build/solver_lib/CMakeFiles/progress.marks
 create mode 100644 solver_application/_build/solver_lib/CMakeFiles/solver_lib.dir/DependInfo.cmake
 create mode 100644 solver_application/_build/solver_lib/CMakeFiles/solver_lib.dir/build.make
 create mode 100644 solver_application/_build/solver_lib/CMakeFiles/solver_lib.dir/cmake_clean.cmake
 create mode 100644 solver_application/_build/solver_lib/CMakeFiles/solver_lib.dir/cmake_clean_target.cmake
 create mode 100644 solver_application/_build/solver_lib/CMakeFiles/solver_lib.dir/compiler_depend.internal
 create mode 100644 solver_application/_build/solver_lib/CMakeFiles/solver_lib.dir/compiler_depend.make
 create mode 100644 solver_application/_build/solver_lib/CMakeFiles/solver_lib.dir/compiler_depend.ts
 create mode 100644 solver_application/_build/solver_lib/CMakeFiles/solver_lib.dir/depend.make
 create mode 100644 solver_application/_build/solver_lib/CMakeFiles/solver_lib.dir/flags.make
 create mode 100644 solver_application/_build/solver_lib/CMakeFiles/solver_lib.dir/link.txt
 create mode 100644 solver_application/_build/solver_lib/CMakeFiles/solver_lib.dir/progress.make
 create mode 100644 solver_application/_build/solver_lib/CMakeFiles/solver_lib.dir/solver.cpp.o
 create mode 100644 solver_application/_build/solver_lib/CMakeFiles/solver_lib.dir/solver.cpp.o.d
 create mode 100644 solver_application/_build/solver_lib/Makefile
 create mode 100644 solver_application/_build/solver_lib/cmake_install.cmake
 create mode 100644 solver_application/_build/solver_lib/libsolver_lib.a
 create mode 100644 solver_application/equation.cpp
 create mode 100644 solver_lib/CMakeLists.txt
 create mode 100644 solver_lib/_build/CMakeCache.txt
 create mode 100644 solver_lib/_build/CMakeFiles/3.22.1/CMakeCCompiler.cmake
 create mode 100644 solver_lib/_build/CMakeFiles/3.22.1/CMakeCXXCompiler.cmake
 create mode 100644 solver_lib/_build/CMakeFiles/3.22.1/CMakeDetermineCompilerABI_C.bin
 create mode 100644 solver_lib/_build/CMakeFiles/3.22.1/CMakeDetermineCompilerABI_CXX.bin
 create mode 100644 solver_lib/_build/CMakeFiles/3.22.1/CMakeSystem.cmake
 create mode 100644 solver_lib/_build/CMakeFiles/3.22.1/CompilerIdC/CMakeCCompilerId.c
 create mode 100644 solver_lib/_build/CMakeFiles/3.22.1/CompilerIdC/a.out
 create mode 100644 solver_lib/_build/CMakeFiles/3.22.1/CompilerIdCXX/CMakeCXXCompilerId.cpp
 create mode 100644 solver_lib/_build/CMakeFiles/3.22.1/CompilerIdCXX/a.out
 create mode 100644 solver_lib/_build/CMakeFiles/CMakeDirectoryInformation.cmake
 create mode 100644 solver_lib/_build/CMakeFiles/CMakeOutput.log
 create mode 100644 solver_lib/_build/CMakeFiles/Makefile.cmake
 create mode 100644 solver_lib/_build/CMakeFiles/Makefile2
 create mode 100644 solver_lib/_build/CMakeFiles/TargetDirectories.txt
 create mode 100644 solver_lib/_build/CMakeFiles/cmake.check_cache
 create mode 100644 solver_lib/_build/CMakeFiles/progress.marks
 create mode 100644 solver_lib/_build/CMakeFiles/solver_lib.dir/DependInfo.cmake
 create mode 100644 solver_lib/_build/CMakeFiles/solver_lib.dir/build.make
 create mode 100644 solver_lib/_build/CMakeFiles/solver_lib.dir/cmake_clean.cmake
 create mode 100644 solver_lib/_build/CMakeFiles/solver_lib.dir/cmake_clean_target.cmake
 create mode 100644 solver_lib/_build/CMakeFiles/solver_lib.dir/compiler_depend.internal
 create mode 100644 solver_lib/_build/CMakeFiles/solver_lib.dir/compiler_depend.make
 create mode 100644 solver_lib/_build/CMakeFiles/solver_lib.dir/compiler_depend.ts
 create mode 100644 solver_lib/_build/CMakeFiles/solver_lib.dir/depend.make
 create mode 100644 solver_lib/_build/CMakeFiles/solver_lib.dir/flags.make
 create mode 100644 solver_lib/_build/CMakeFiles/solver_lib.dir/link.txt
 create mode 100644 solver_lib/_build/CMakeFiles/solver_lib.dir/progress.make
 create mode 100644 solver_lib/_build/CMakeFiles/solver_lib.dir/solver.cpp.o
 create mode 100644 solver_lib/_build/CMakeFiles/solver_lib.dir/solver.cpp.o.d
 create mode 100644 solver_lib/_build/Makefile
 create mode 100644 solver_lib/_build/cmake_install.cmake
 create mode 100644 solver_lib/_build/libsolver_lib.a
 create mode 100644 solver_lib/solver.cpp
 create mode 100644 solver_lib/solver.h
 create mode 100644 sources/print.cpp
```

</details>

```sh
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/lab08-to4no]
└─$ git push origin master   
Username for 'https://github.com': HECCYLLIujTbmy
Password for 'https://HECCYLLIujTbmy@github.com': 
Enumerating objects: 280, done.
Counting objects: 100% (280/280), done.
Delta compression using up to 2 threads
Compressing objects: 100% (262/262), done.
Writing objects: 100% (280/280), 111.16 KiB | 5.29 MiB/s, done.
Total 280 (delta 149), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (149/149), done.
To https://github.com/HECCYLLIujTbmy/lab08-to4no
 * [new branch]      master -> master
```
## Links

- [Book](https://www.dockerbook.com)
- [Instructions](https://docs.docker.com/engine/reference/builder/)

```
Copyright (c) 2015-2021 The ISC Authors
```
                                                          
