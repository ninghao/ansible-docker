FROM centos
MAINTAINER wanghao <wanghao@ninghao.net>

# epel-release 软件仓库
# ansible 配置管理，在 epel-release 仓库里
# openssh，openssh-clients，跟 ssh 相关的小工具，比如 ssh-keygen, ssh-copy-id
# python-pip，pip 命令行工具
# passlib 生成密码用的 python 库
# 执行下面命令，生成 sha512_crypt 加密的密码，用在 ansible 的 user 模块里，作为用户的密码。
# python -c "from passlib.hash import sha512_crypt; import getpass; print sha512_crypt.encrypt(getpass.getpass())"
# glibc-common，重新安装一下支持的语言，因为我需要简体中文

RUN yum install epel-release -y \
  # && yum install ansible -y \
  && yum install openssh -y \
  && yum install openssh-clients -y \
  && yum install python-pip -y \
  && pip install passlib \
  && yum reinstall glibc-common -y

COPY ./files/ansible-2.2.0-0.git201608022100.5f12731.devel.el7.centos.noarch.rpm /root/ansible-2.2.0-0.git201608022100.5f12731.devel.el7.centos.noarch.rpm
RUN yum install /root/ansible-2.2.0-0.git201608022100.5f12731.devel.el7.centos.noarch.rpm -y

RUN echo "PS1='[console]# '" >> /root/.bashrc

# 把语言设置成简体中文

ENV LANG zh_CN.UTF-8
ENV LC_ALL=zh_CN.UTF-8
ENV LANGUAGE zh_CN:zh

# 其它设置
WORKDIR /etc/ansible
RUN mkdir -p /root/.ssh
