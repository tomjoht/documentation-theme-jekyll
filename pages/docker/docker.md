---
title: docker
keywords: documentation theme, jekyll, technical writers, help authoring tools, hat replacements
last_updated: July 3, 2016
tags: [getting_started]
summary: "I have used this theme for projects that I've worked on as a professional technical writer."
sidebar: mydoc_sidebar
permalink: docker.html
folder: /docker
---

docker

To list available commands, either run docker with no parameters or execute docker help:

    $ docker 
    Usage: docker [OPTIONS] COMMAND [ARG...] 
           docker [ --help | -v | --version ] 

    A self-sufficient runtime for containers. 

        Options: 
            --config string      Location of client config files (default "/root/.docker")
        -c, --context string     Name of the context to use to connect to the daemon (overrides DOCKER_HOST env var and default context set with "docker context use") 
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


1.docker images 
  
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

2.docker rmi
      
    描述: 删除本地镜像
    语法: 
        docker rmi [OPTIONS] IMAGE [IMAGE...]
        OPTIONS说明：
                -f :强制删除；
                --no-prune :不移除该镜像的过程镜像，默认移除；

