#!/bin/bash

prefix=$(cd `dirname $0` && pwd)
cd ${prefix}

ARGS_FILE="./config/vm.args"
CONFIG_FILE="./config/sys.config"


SOURCE_DIR="." # 需要保证SOURCE_DIR一定在第十行



ACTION=$1

get_ebin_dir() {
    if [ -d "ebin" ];then
        echo "-pa ${SOURCE_DIR}/ebin"
    else
        echo "-pa ${SOURCE_DIR}/_build/default/lib/*/ebin"
    fi
}

start() {
    path=$(get_ebin_dir)
    erl ${path} -config "$CONFIG_FILE" -hidden \
        -args_file "$ARGS_FILE" \
        -boot start_sasl -s yg server_start
    echo
}

clean() {
    rebar3 clean -a
}

mongodb() {
    mongod -f /data/mongodb.conf
}

case "$ACTION" in
    start)
        start;;
    remsh)
        remsh;;
    clean)
        clean;;
    mongodb)
        mongodb;;
    make)
        rebar3 compile;;
    *)
        echo "
        Usage: ./svr_tools.sh task [-config ConfigFile] [-args_file ArgsFile]

        默认配置
            args_file: ./config/vm.args
            config ./config/sys.config
        可以通过参数改变配置文件

        task 包括如下:

        1.游戏服务器操作:
        start                                   启动服务器
        debug                                   debug模式启动服务器(可以打印出io:format)
        "
        ;;
esac
