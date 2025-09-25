#! /usr/bin/env bash

CONF_HOME="${HOME}/.config/nvim"
echo removing old directory to $CONF_HOME.old
mv $CONF_HOME $CONF_HOME.old
echo installing to $CONF_HOME
mkdir -p $CONF_HOME
cp -r ./lua $CONF_HOME/lua
cp -r ./lsp $CONF_HOME/lsp
cp ./init.lua $CONF_HOME/init.lua
cp ./.luarc.json $CONF_HOME/luarc.json
