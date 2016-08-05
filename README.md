这是[宁皓网](http://ninghao.net) 介绍 Docker 相关技术用的小项目，可以用来配置 CentOS 系统的服务器，在上面安装运行 Docker 。先下载 docker for windows 或 docker for mac ，然后启动 docker 。再执行下面这些步骤：

1 → 克隆仓库到本地
```
git clone https://github.com/ninghao/ansible-docker
```
2 → 进入项目所在目录
```
cd ansible-docker
```
3 → 创建并启动服务
```
docker-compose build
docker-compose up -d
```
4 → 登录到 ansible 控制容器
```
docker-compose exec ansible bash
```
5 → 配置并运行 playbook
```
ansible-playbook app.yml -k
```

[ninghao.net](http://ninghao.net)
