export NLS_LANG="AMERICAN_AMERICA.UTF8"
export ORACLE_HOME=/site/oracle_client/client-11.2.0.1/
export DYLD_LIBRARY_PATH=${ORACLE_HOME}lib
export LD_LIBRARY_PATH=${ORACLE_HOME}lib
export TNS_ADMIN="${HOME}/.oracle"

conditionally_prefix_path "${ORACLE_HOME}/bin"
