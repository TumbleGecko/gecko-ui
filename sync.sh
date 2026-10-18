#!/usr/bin/env bash
# Copy the shared gecko parts into an app, the one way an app gets them
#
# The app keeps its copy in Git, so it needs nothing extra at run time, and this file records the commit it came from

readonly EXIT_SUCCESS=0
readonly EXIT_USAGE=2
readonly SOURCE="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"

main() {
	local destination="${1:-}"
	if [[ -z "${destination}" ]]; then
		echo "Usage: sync.sh APP_FOLDER/gecko-ui" >&2
		return "${EXIT_USAGE}"
	fi
	rm -rf "${destination}"
	mkdir -p "${destination}" || return 1
	cp -r "${SOURCE}/qml" "${SOURCE}/python" "${SOURCE}/assets" "${destination}/" || return 1
	find "${destination}" -name __pycache__ -prune -exec rm -rf {} +
	git -C "${SOURCE}" rev-parse HEAD > "${destination}/SOURCE_COMMIT" 2>/dev/null
	echo "Copied gecko-ui into ${destination}"
	return "${EXIT_SUCCESS}"
}

main "$@"; exit $?
