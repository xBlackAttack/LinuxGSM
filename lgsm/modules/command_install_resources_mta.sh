#!/bin/bash
# LinuxGSM command_install_resources_mta.sh module
# Author: Daniel Gibbs
# Contributors: https://linuxgsm.com/contrib
# Website: https://linuxgsm.com
# Description: Installs the default resources for Multi Theft Auto.

commandname="DEFAULT-RESOURCES"
commandaction="Default Resources"
moduleselfname="$(basename "$(readlink -f "${BASH_SOURCE[0]}")")"
fn_firstcommand_set

fn_install_resources() {
	echo -e ""
	echo -e "${bold}${lightyellow}Installing Default Resources${default}"
	fn_messages_separator
	fn_fetch_file "http://mirror.mtasa.com/mtasa/resources/mtasa-resources-latest.zip" "" "" "" "${tmpdir}" "mtasa-resources-latest.zip" "nochmodx" "norun" "noforce" "nohash"
	fn_dl_extract "${tmpdir}" "mtasa-resources-latest.zip" "${resourcesdir}"
	echo -e "Default Resources Installed."
}

fn_print_header

if [ -z "${autoinstall}" ]; then
	fn_print_warning_nl "Installing the default resources with existing resources may cause issues."
	if fn_prompt_yn "Do you want to install MTA default resources?" Y; then
		fn_install_resources
	fi
else
	fn_print_warning_nl "Default resources are not installed when using ./${selfname} auto-install."
	fn_print_information_nl "To install default resources use ./${selfname} install"
fi
