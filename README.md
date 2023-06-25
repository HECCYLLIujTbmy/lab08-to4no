# laba-4etverka
Сейчас вам требуется настроить систему непрерывной интеграции для библиотек и приложений, с которыми вы работали в прошлый раз. Настройте сборочные процедуры на различных платформах:

# Task 1
Используйте GitHub Actions для сборки на операционной системе Linux с использованием компиляторов gcc и clang

# Копируем репозиторий из предыдущей ЛР:
```sh
(kali㉿kali)-[~]
└─$ cd HECCYLLIujTbmy/workspace/projects && mkdir laba-4etverka && cd laba-4etverka
$ git clone https://github.com/HECCYLLIujTbmy/lab03                    
Cloning into 'lab03'...
remote: Enumerating objects: 121, done.
remote: Counting objects: 100% (50/50), done.
remote: Compressing objects: 100% (19/19), done.
remote: Total 121 (delta 42), reused 31 (delta 31), pack-reused 71
Receiving objects: 100% (121/121), 1.03 MiB | 1.31 MiB/s, done.
Resolving deltas: 100% (60/60), done.
```

```sh
kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/laba-4etverka]
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
Initialized empty Git repository in /home/kali/HECCYLLIujTbmy/workspace/projects/laba-4etverka/.git/
```
```sh
cat>> Linux.yml<<EOF
name: CMake
on:
push:
branches: [master]
pull_request:
branches: [master]
jobs:
build_Linux:
runs-on: ubuntu-latest
steps:
- uses: actions/checkout@v3
- name: Configure Solver
run: cmake ${{github.workspace}}/solver_application/ -B ${{github.workspace}}/solver_application/build
- name: Build Solver
run: cmake --build ${{github.workspace}}/solver_application/build
- name: Configure HelloWorld
run: cmake ${{github.workspace}}/hello_world_application/ -B ${{github.workspace}}/hello_world_application/build
- name: Build HelloWorld
run: cmake --build ${{github.workspace}}/hello_world_application/build
EOF
```
```sh
(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/laba-4etverka]
└─$ git status                                       
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        Linux.yml
        lab03/

nothing added to commit but untracked files present (use "git add" to track)
                                                                                                                                                                                                                                           
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/laba-4etverka]
└─$ git add Linux.yml
                                                                                                                                                                                                                                           
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/laba-4etverka]
└─$ git commit -m"Linux.yml - 1"                     
[master (root-commit) 6d8cfb9] Linux.yml - 1
 1 file changed, 27 insertions(+)
 create mode 100644 Linux.yml
 ```
 ```sh
 $ git push origin master
Username for 'https://github.com': HECCYLLIujTbmy
Password for 'https://HECCYLLIujTbmy@github.com': 
Enumerating objects: 3, done.
Counting objects: 100% (3/3), done.
Delta compression using up to 2 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 467 bytes | 467.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
To https://github.com/HECCYLLIujTbmy/laba-4etverka
 * [new branch]      master -> master
 ```

# Task II 

```sh
(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/laba-4etverka]
└─$ cat >> Windows.yml <<EOF
name: CMake

on:
 push:
  branches: [master]
 pull_request:
  branches: [master]

jobs: 
 build_Windows:

  runs-on: windows-latest

  steps:
  - uses: actions/checkout@v3

  - name: Configure Solver
    run: cmake ${{github.workspace}}/solver_application/ -B ${{github.workspace}}/solver_application/build

  - name: Build Solver
    run: cmake --build ${{github.workspace}}/solver_application/build

  - name: Configure HelloWorld
    run: cmake ${{github.workspace}}/hello_world_application/ -B ${{github.workspace}}/hello_world_application/build

  - name: Build HelloWorld
    run: cmake --build ${{github.workspace}}/hello_world_application/build

EOF
```
```sh
git status            
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        Windows.yml
        lab03/
 nothing added to commit but untracked files present (use "git add" to track)
```
```sh
(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/laba-4etverka]
└─$ git commit -m"Windows.yml - 1"
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        Windows.yml
        lab03/
```

```sh
(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/laba-4etverka]
└─$ git pull origin master         
remote: Enumerating objects: 4, done.
remote: Counting objects: 100% (4/4), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), 2.16 KiB | 2.16 MiB/s, done.
From https://github.com/HECCYLLIujTbmy/laba-4etverka
 * branch            master     -> FETCH_HEAD
   6d8cfb9..3d18e38  master     -> origin/master
Updating 6d8cfb9..3d18e38
Fast-forward
 README.md | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 README.md
```

```sh
(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/laba-4etverka]
└─$ git commit -m"Windows.yml - 1" 
[master 21d77bd] Windows.yml - 1
 1 file changed, 27 insertions(+)
 create mode 100644 Windows.yml
                                                                                                                                                                                                                                           
┌──(kali㉿kali)-[~/HECCYLLIujTbmy/workspace/projects/laba-4etverka]
└─$ git push origin master        
Username for 'https://github.com': HECCYLLIujTbmy
Password for 'https://HECCYLLIujTbmy@github.com': 
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 2 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 569 bytes | 569.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
To https://github.com/HECCYLLIujTbmy/laba-4etverka
   3d18e38..21d77bd  master -> master
                                        
