# docker-compose-for-fastadmin
FastAdmin通过docker，docker-compose 部署的配置


### 安装步骤

0. 将本项目文件复制到`fastadmin` 项目的根目录
1. 修改`docker-compose.yml`中的数据书密码等相关配置项
2. `cp .env.example .env`
3. `docker-compose build`
4. `docker-compose up -d`
5. 修改`.env`文件连接项目