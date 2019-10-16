#!/usr/bin/env bash

declare -g -x _DIR="$( cd "$(dirname "$0")" ; pwd -P )/"
declare -g -x _ROOT="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )/"

source $_DIR"../.env"

function _init_db() {

	psql postgres -c "CREATE USER $DB_USER WITH LOGIN SUPERUSER INHERIT CREATEDB CREATEROLE NOREPLICATION PASSWORD '$DB_PASS'"
	psql postgres -c "CREATE DATABASE $DB_NAME WITH OWNER = $DB_USER ENCODING = 'UTF8' CONNECTION LIMIT = -1;"
	psql $DB_NAME -f $_DIR"../schema/config.sql"
	psql $DB_NAME -f $_DIR"../schema/types/authenticated-user.sql"
	psql $DB_NAME -f $_DIR"../schema/functions/hash.sql"
	psql $DB_NAME -f $_DIR"../schema/functions/create-user.sql"
	psql $DB_NAME -f $_DIR"../schema/functions/authenticate-user.sql"
}

function _reset_db() { echo "not yet implemented"; }

function main() {

	declare -A -x command_table=(
		['init-db']="_init_db" 
		['reset-db']="_reset_db"
	)

	local commands="${!command_table[@]}"
	local msg="usage: db.sh [ $commands ]"
	if [[ $# < 1 ]]; then echo "$msg" && exit; fi

	local command=${1}; shift
	local fn_name=${command_table[$command]}

	if [[ $fn_name == '' ]]; then echo "$msg" && exit; fi
	if $fn_name $@; then return 0; else return 1; fi
}

main $@