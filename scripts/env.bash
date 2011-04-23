#!/dev/null

_scripts="$( readlink -e -- ./scripts || true )"
_tools="$( readlink -f -- ./.tools || true )"
_outputs="$( readlink -f -- ./.outputs || true )"
_make=ninja

_PATH="${_tools}/bin:${PATH}"

_erl="$( PATH="${_PATH}" type -P -- erl || true )"
if test -z "${_erl}" ; then
	echo "[ww] missing \`erl\` (Erlang interpreter) executable in path: \`${_PATH}\`; ignoring!" >&2
	_erl=erl
fi

_python="$( PATH="${_PATH}" type -P -- python || true )"
if test -z "${_python}" ; then
	echo "[ww] missing \`python\` (Python interpreter) executable in path: \`${_PATH}\`; ignoring!" >&2
	_python=python
fi

_httperf="$( PATH="${_PATH}" type -P -- httperf || true )"
if test -z "${_httperf}" ; then
	echo "[ww] missing \`httperf\` executable in path: \`${_PATH}\`; ignoring!" >&2
	_httperf=httperf
fi

_vbs="$( PATH="${_PATH}" type -P -- vbs || true )"
if test -z "${_vbs}" ; then
	echo "[ww] missing \`vbs\` (Volution Build System tool) executable in path: \`${_PATH}\`; ignoring!" >&2
	_vbs=vbs
fi

_ninja="$( PATH="${_PATH}" which -- ninja 2>/dev/null || true )"
if test -z "${_ninja}" ; then
	echo "[ww] missing \`ninja\` (Ninja build tool) executable in path: \`${_PATH}\`; ignoring!" >&2
	_ninja=ninja
fi

_erl_libs="${_outputs}/erlang/applications"
_erl_args=(
	+Bd +Ww
	-env ERL_CRASH_DUMP /dev/null
	-env ERL_LIBS "${_erl_libs}"
)

_python_args=(
	-B
)

_httperf_args=(
	--recv-buffer=131072
	--send-buffer=131072
)

_ninja_file="${_outputs}/.make.ninja"
_ninja_args=(
	-f "${_ninja_file}"
)