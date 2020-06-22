---
title: docker
keywords: docker
last_updated: July 3, 2016
tags: [getting_started]
summary: ""
sidebar: mydoc_sidebar
permalink: docker.html
folder: /docker
---

docker

To list available commands, either run docker with no parameters or execute docker help:

+ 查看所有命令  

        $ docker  
        Usage: docker [OPTIONS] COMMAND [ARG...]  
            docker [ --help | -v | --version ]  

       A self-sufficient runtime for containers.  

        Options:   
            --config string      Location of client config files (default "/root/.docker")  
        -c, --context string     Name of the context to use to connect to the daemon   (overrides DOCKER_HOST env var and default context set with "docker context use") 
        -D, --debug              Enable debug mode 
            --help               Print usage 
        -H, --host value         Daemon socket(s) to connect to (default []) 
        -l, --log-level string   Set the logging level ("debug"|"info"|"warn"|"error"|"fatal") (default "info") 
            --tls                Use TLS; implied by --tlsverify 
            --tlscacert string   Trust certs signed only by this CA (default "/root/.docker/ca.pem")
            --tlscert string     Path to TLS certificate file (default "/root/.docker/cert.pem") 
            --tlskey string      Path to TLS key file (default "/root/.docker/key.pem") 
            --tlsverify          Use TLS and verify the remote 
        -v, --version            Print version information and quit 

        Commands: 
            attach    Attach to a running container 
            # […]    

+ 查看子命令  
  
        语法：  
            docker COMMAND --help  
        示例：  
            docker images --help  
        输出：  
            Usage:   docker images [OPTIONS] [REPOSITORY[:TAG]]

            List images

            Options:  
            -a, --all             Show all images (default hides intermediate images)  
                --digests         Show digests  
            -f, --filter filter   Filter output based on conditions provided  
                --format string   Pretty-print images using a Go template  
                --no-trunc        Don't truncate output  
            -q, --quiet           Only show numeric IDs  

+ 常用命令

1. docker images  

        描述: 查看本地镜像  
        语法:  
            docker images [OPTIONS] [REPOSITORY[:TAG]]  
            OPTIONS说明：  
                    -a :列出本地所有的镜像（含中间映像层，默认情况下，过滤掉中间映像层）；  
                    --digests :显示镜像的摘要信息；  
                    -f :显示满足条件的镜像；  
                    --format :指定返回值的模板文件；  
                    --no-trunc :显示完整的镜像信息；  
                    -q :只显示镜像ID。  

2. docker rmi  

        描述: 删除本地镜像
        语法:  
            docker rmi [OPTIONS] IMAGE [IMAGE...]  
            OPTIONS说明：  
                    -f :强制删除；  
                    --no-prune :不移除该镜像的过程镜像，默认移除；  

3. docker tag  

        描述: 标记本地镜像，将其归入某一仓库  
        语法:  
            docker tag [OPTIONS] IMAGE[:TAG] [REGISTRYHOST/][USERNAME/]NAME[:TAG]  

4. docker build

        描述: 使用Dockerfile创建镜像  
        语法:  
            docker build [OPTIONS] PATH | URL | -

        options:

            --build-arg=[] :设置镜像创建时的变量；
            --cpu-shares :设置 cpu 使用权重；
            --cpu-period :限制 CPU CFS周期；
            --cpu-quota :限制 CPU CFS配额；
            --cpuset-cpus :指定使用的CPU id；
            --cpuset-mems :指定使用的内存 id；
            --disable-content-trust :忽略校验，默认开启；
            -f :指定要使用的Dockerfile路径；
            --force-rm :设置镜像过程中删除中间容器；
            --isolation :使用容器隔离技术；
            --label=[] :设置镜像使用的元数据；
            -m :设置内存最大值；
            --memory-swap :设置Swap的最大值为内存+swap，"-1"表示不限swap；
            --no-cache :创建镜像的过程不使用缓存；
            --pull :尝试去更新镜像的新版本；
            --quiet, -q :安静模式，成功后只输出镜像 ID；
            --rm :设置镜像成功后删除中间容器；
            --shm-size :设置/dev/shm的大小，默认值是64M；
            --ulimit :Ulimit配置。
            --tag, -t: 镜像的名字及标签，通常 name:tag 或者 name 格式；可以在一次构建中为一个镜像设置多个标签。
            --network: 默认 default。在构建期间设置RUN指令的网络模式

5. docker history

        描述: 查看镜像的创建历史  
        语法:  
            docker history [OPTIONS] IMAGE  
        options:  
                -H :以可读的格式打印镜像大小和日期，默认为true；  
                --no-trunc :显示完整的提交记录；  
                -q :仅列出提交记录ID。

6. docker save  

        描述: 将镜像保存成tar归档文件  
        语法:  
            docker save [OPTIONS] IMAGE [IMAGE...]  
        options:  
                -o :保存到文件  

7. docker load  

        描述: 导入镜像  
        语法:  
            docker load [OPTIONS]  
        options:  
                -i, --input string: 从归档文件读入
                -q, --quit: 精简输出信息

8. docker import  

        描述: 从归档文件中创建镜像  
        语法:  
            docker import [OPTIONS] file|URL|- [REPOSITORY[:TAG]]  
        options:  
                -c: 应用docker指令创建镜像
                -m:提交时的说明文字     

9. docker login/logout  

        描述: 登录/退出镜像仓库  
        语法:  
            docker login [OPTIONS] [SERVER]  
            docker logout [OPTIONS] [SERVER]    
        options:  
                -p, --password string: 密码
                -u, --username string: 用户名   

10. docker pull  

        描述: 登录/退出镜像仓库  
        语法:  
            docker pull [OPTIONS] NAME[:TAG|@DIGEST]                  
        options:  
                -a: 拉取所有 tagged 镜像
                --disable-content-trust :忽略镜像的校验,默认开启
        示例:
            docker pull java                                      

11. docker push  

        描述: 将本地的镜像上传到镜像仓库  
        语法:  
            docker push [OPTIONS] NAME[:TAG]                  
        options:                  
                --disable-content-trust :忽略镜像的校验,默认开启
        示例:
            docker push mytest:v1 

12. docker search  

        描述: 从Docker Hub查找镜像  
        语法:  
            docker search [OPTIONS] TERM                  
        options:                  
                -f, --filter filter :按条件过滤  
                --limit int:限制搜索结果数量
                --no-trunc :显示完整的镜像描述
        示例:
            docker search --limit 10 java     

13. docker run  

        描述: 创建一个新的容器并运行一个命令  
        语法:  
            docker run [OPTIONS] IMAGE [COMMAND] [ARG...]                  
        options:              

            -a stdin: 指定标准输入输出内容类型，可选 STDIN/STDOUT/STDERR 三项  
            -d: 后台运行容器，并返回容器ID  
            -i: 以交互模式运行容器，通常与 -t 同时使用  
            -P: 随机端口映射，容器内部端口随机映射到主机的端口  
            -p: 指定端口映射，格式为：主机(宿主)端口:容器端口  
            -t: 为容器重新分配一个伪输入终端，通常与 -i 同时使用  
            --name="nginx-lb": 为容器指定一个名称  
            --dns 8.8.8.8: 指定容器使用的DNS服务器，默认和宿主一致  
            --dns-search example.com: 指定容器DNS搜索域名，默认和宿主一致  
            -h "mars": 指定容器的hostname  
            -e username="ritchie": 设置环境变量  
            --env-file=[]: 从指定文件读入环境变量  
            --cpuset="0-2" or --cpuset="0,1,2": 绑定容器到指定CPU运行  
            -m :设置容器使用内存最大值  
            --net="bridge": 指定容器的网络连接类型，支持 bridge/host/none/container: 四种类型  
            --link=[]: 添加链接到另一个容器  
            --expose=[]: 开放一个端口或一组端口  
            --volume , -v: 绑定一个卷  
        示例:

14. docker start/stop/restart  

        描述: 启动/停止/重启容器  
        语法:  
            docker start [OPTIONS] CONTAINER [CONTAINER...]
            docker stop [OPTIONS] CONTAINER [CONTAINER...]
            docker restart [OPTIONS] CONTAINER [CONTAINER...]                  
        options:                  
                -f, --filter filter :按条件过滤  
                --limit int:限制搜索结果数量
                --no-trunc :显示完整的镜像描述
        示例:

15. docker kill  

        描述: 强制关闭一个运行中的容器  
        语法:  
            docker kill [OPTIONS] CONTAINER [CONTAINER...]           
        options:                  
                -s :向容器发送一个信号  
        示例:           

16. docker rm  

        描述: 删除一个或多个容器  
        语法:  
            docker rm [OPTIONS] CONTAINER [CONTAINER...]           
        options:                  
            -f :通过 SIGKILL 信号强制删除一个运行中的容器
            -l :移除容器间的网络连接，而非容器本身
            -v :删除与容器关联的卷 
        示例:  

17. docker pause/unpause  

        描述: 暂停/恢复容器中所有的进程
        语法:  
            docker pause CONTAINER [CONTAINER...]
            docker unpause CONTAINER [CONTAINER...]           
        options:                  

        示例:          

18. docker create  

        描述: 创建一个新的容器但不启动它,同docker run 
        语法:  
            docker create [OPTIONS] IMAGE [COMMAND] [ARG...]           
        options:                  
            
        示例:  

19. docker exec  

        描述: 在运行的容器中执行命令
        语法:  
            docker exec [OPTIONS] CONTAINER COMMAND [ARG...]           
        options:                  
            -d :分离模式: 在后台运行
            -i :即使没有附加也保持STDIN 打开
            -t :分配一个伪终端
        示例:    

20. docker ps  

        描述: 列出容器
        语法:  
            docker ps [OPTIONS]           
        options:                
            -a :显示所有的容器，包括未运行的
            -f :根据条件过滤显示的内容
            --format :指定返回值的模板文件
            -l :显示最近创建的容器
            -n :列出最近创建的n个容器
            --no-trunc :不截断输出
            -q :静默模式，只显示容器编号
            -s :显示总的文件大小
        示例:  

21. docker inspect  

        描述: 获取容器/镜像的元数据
        语法:  
            docker inspect [OPTIONS] NAME|ID [NAME|ID...]           
        options:                
            -f :指定返回值的模板文件
            -s :显示总的文件大小
            --type :为指定类型返回JSON
        示例:                      

22. docker top  

        描述: 查看容器中运行的进程信息，支持 ps 命令参数
        语法:  
            docker top [OPTIONS] CONTAINER [ps OPTIONS]           
        options:                

        示例:   

23. docker attach  

        描述: 连接到正在运行中的容器
        语法:  
            docker attach [OPTIONS] CONTAINER           
        options:                

        示例:         

24. docker events  

        描述: 从服务器获取实时事件
        语法:  
            docker events [OPTIONS]           
        options:               
            -f ：根据条件过滤事件
            --since ：从指定的时间戳后显示所有事件
            --until ：流水时间显示到指定的时间为止
        示例:               

25. docker logs  

        描述: 获取容器的日志
        语法:  
            docker logs [OPTIONS] CONTAINER           
        options:               
            -f : 跟踪日志输出
            --since :显示某个开始时间的所有日志
            -t : 显示时间戳
            --tail :仅列出最新N条容器日志
        示例: 

26. docker export  

        描述: 将文件系统作为一个tar归档文件导出到STDOUT
        语法:  
            docker export [OPTIONS] CONTAINER           
        options:               
            -o :将输入内容写到文件            
        示例:

27. docker port  

        描述: 列出指定的容器的端口映射，或者查找将PRIVATE_PORT NAT到面向公众的端口
        语法:  
            docker port [OPTIONS] CONTAINER [PRIVATE_PORT[/PROTO]]           
        options:               
                        
        示例:   

28. docker commit  

        描述: 从容器创建一个新的镜像
        语法:  
            docker commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]           
        options:               
            -a :提交的镜像作者
            -c :使用Dockerfile指令来创建镜像
            -m :提交时的说明文字
            -p :在commit时，将容器暂停 
        示例:  

29. docker cp  

        描述: 从容器创建一个新的镜像
        语法:  
            docker cp [OPTIONS] CONTAINER:SRC_PATH DEST_PATH|-
            docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH           
        options:               
            -L :保持源目标中的链接 
        示例:    

30. docker diff  

        描述: 检查容器里文件结构的更改
        语法:  
            docker diff [OPTIONS] CONTAINER                      
        options:               
            
        示例:               