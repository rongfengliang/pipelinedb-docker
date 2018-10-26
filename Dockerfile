FROM postgres:10
LABEL author="dalongrong"
LABEL email="1141591465@qq.com"
COPY docker-entrypoint-initdb.d/install_pipelinedb.sh /docker-entrypoint-initdb.d/
COPY docker-entrypoint-initdb.d/reenable_auth.sh /docker-entrypoint-initdb.d/
RUN apt-get update && apt-get  -y install curl ca-certificates  \
    && curl -s http://download.pipelinedb.com/apt.sh |  bash \
    && apt-get install -y pipelinedb-postgresql-10 
RUN echo "shared_preload_libraries = 'pipelinedb' max_worker_processes = 128" >> ${PGDATA}/postgresql.conf
