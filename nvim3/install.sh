#! /usr/bin/env bash

CONF_HOME="${HOME}/.config/nvim"
echo installing to $CONF_HOME
mkdir -p $CONF_HOME
cp -r ./lua $CONF_HOME/lua
cp -r ./lsp $CONF_HOME/lsp
cp ./init.lua $CONF_HOME/init.lua
