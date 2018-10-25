FROM postgres:10
LABEL author="dalongrong"
LABEL email="1141591465@qq.com"
COPY docker-entrypoint-initdb.d/install_pipelinedb.sh /docker-entrypoint-initdb.d/
COPY docker-entrypoint-initdb.d/reenable_auth.sh /docker-entrypoint-initdb.d/
RUN  apt-get update && apt-get install -yqq wget curl
RUN  wget -O pipelinedb-postgresql-10_1.0.0-1.debian8_amd64.deb https://github.com/pipelinedb/pipelinedb/releases/download/1.0.0/pipelinedb-postgresql-10_1.0.0-1.debian8_amd64.deb
RUN dpkg -i pipelinedb-postgresql-10_1.0.0-1.debian8_amd64.deb
RUN echo "shared_preload_libraries = 'pipelinedb' max_worker_processes = 128" >> ${PGDATA}/postgresql.conf
