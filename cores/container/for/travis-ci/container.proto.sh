#!/bin/bash
if [ -z "$HOME" ]; then
	echo "ERROR: 'HOME' environment variable is not set!"
	exit 1
fi
# Source https://github.com/bash-origin/bash.origin
. "$HOME/.bash.origin"
function init {
	eval BO_SELF_BASH_SOURCE="$BO_READ_SELF_BASH_SOURCE"
	BO_deriveSelfDir ___TMP___ "$BO_SELF_BASH_SOURCE"
	local __BO_DIR__="$___TMP___"

	__BO_DIR__CONTAINER_TRAVIS_CI__="$__BO_DIR__"


	# Automatically install on first use.
	pushd "$__BO_DIR__CONTAINER_TRAVIS_CI__" > /dev/null
	    if [ ! -e "node_modules" ]; then
		    BO_log "$VERBOSE" "Installing dependenceis for 'container-for-travis-ci' ..."
	    	BO_run_npm install
	   	fi
	popd > /dev/null


	function setSecureEnvironmentVariables {
		BO_format "$VERBOSE" "HEADER" "Set travis-ci secure environment variables ..."

		BO_run_node "$__BO_DIR__CONTAINER_TRAVIS_CI__/setSecureEnvironmentVariables.js" $@

		BO_format "$VERBOSE" "FOOTER"
	}
}
init $@