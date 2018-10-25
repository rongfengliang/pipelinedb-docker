#!/bin/bash

PG_PIPELINEDB='pipelinedb'
echo "shared_preload_libraries =  ${PG_PIPELINEDB} " >> ${PGDATA}/postgresql.conf
echo "max_worker_processes = 128 " >> ${PGDATA}/postgresql.conf
# create extension pipelinedb in initial databases
psql -U "${POSTGRES_USER}" postgres -c "CREATE EXTENSION IF NOT EXISTS pipelinedb ;"
psql -U "${POSTGRES_USER}" pipelinedb -c "CREATE EXTENSION IF NOT EXISTS pipelinedb ;"

if [ "$POSTGRES_DB" != 'postgres' ]; then
  psql -U "${POSTGRES_USER}" "${POSTGRES_DB}" -c "CREATE EXTENSION IF NOT EXISTS pipelinedb ;"
fi