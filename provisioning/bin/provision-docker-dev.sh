#!/bin/bash -e


source lib/common.sh


_create_app_user
_apt_update
_install_utils
_install_nodejs