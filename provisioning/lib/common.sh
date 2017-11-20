#!/bin/bash -e


function _apt_update
{
  apt-get update -yqq
}

function _apt_dist_upgrade
{
  _apt_update
  DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -fyqq
}

function _install_utils
{
  apt-get install -fyqq sudo moreutils nano vim netcat wget curl

  # install the add-apt-repository command
  #apt-get install software-properties-common python-software-properties
}


function _create_app_user
{
  # create  user
  groupadd -g 1001 $APP_USERNAME && useradd -u 1001 -g $APP_USERNAME $APP_USERNAME -m -d /home/$APP_USERNAME -s /bin/bash
}


function _copy_authorized_keys
{
  mkdir -p /home/$APP_USERNAME/.ssh
  cat $1 >> /home/$APP_USERNAME/.ssh/authorized_keys
  chown $APP_USERNAME:$APP_USERNAME /home/$APP_USERNAME/.ssh/authorized_keys
}


function _install_git
{
  apt-get install -fyqq git git-flow
}


function _install_nodejs
{
  # On ubuntu 16.04, apt-get will by default install the 4.2.6 version of node

  # This will install v8.9.1
  pushd ~
  curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh
  bash nodesource_setup.sh
  apt-get install -fyqq nodejs
  popd
}


function _init_project
{
  pushd $APP_ROOT

  # Create package.json
  npm init -y
  # Currently version 16.1.1
  npm install --save react react-dom

  # install dev dependencies
  npm install --save-dev webpack babel-core babel-loader babel-preset-react babel-preset-es2015
  # CSS loaders
  npm install --save-dev css-loader style-loader
  # dev server
  npm install --save-dev webpack-dev-server

  popd
}
