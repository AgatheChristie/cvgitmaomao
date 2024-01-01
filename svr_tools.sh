#!/bin/bash

prefix=$(cd `dirname $0` && pwd)
cd ${prefix}

ARGS_FILE="./config/vm.args"
CONFIG_FILE="./config/sys.config"


SOURCE_DIR="." # 需要保证SOURCE_DIR一定在第十行

TOOL_BEAM="./tools/protobuf/protobuf_pb.beam"

ACTION=$1

COOKIE_ARG="$(grep '^-setcookie' "$ARGS_FILE" || true)"
COOKIE="$(echo "$COOKIE_ARG" | awk '{print $2}')"

get_ebin_dir() {
    if [ -d "ebin" ];then
        echo "-pa ${SOURCE_DIR}/ebin"
    else
        echo "-pa ${SOURCE_DIR}/_build/default/lib/*/ebin"
    fi
}

stop() {
    erl_call -c "$COOKIE" -n "ygzj_game1@127.0.0.1" -e <<Erl
    application:stop(recon_web),
    application:stop(cowboy),
    myproj:stop_game_server().
Erl
}

hot_reload() {
    erl_call -c "$COOKIE" -n "ygzj_game1@127.0.0.1" -a 'reloader reload_all'
}

start() {
    path=$(get_ebin_dir)
    erl ${path} -config "$CONFIG_FILE" -hidden \
        -run inets -args_file "$ARGS_FILE" -run crypto -run ssl \
        -boot start_sasl -run myproj
    echo
}

clean() {
    rebar3 clean -a
}

make() {
    rebar3 compile
    cp -f "$TOOL_BEAM"  "./_build/default/lib/myproj/ebin"
}

mongodb() {
    mongod -f /data/mongodb.conf
}

case "$ACTION" in
    start)
        start;;
    remsh)
        remsh;;
    hot_reload)
        hot_reload
        ;;
    stop)
        stop;;
    clean)
        clean;;
    make_and_reload)
        rebar3 compile
        mycmd=$?
        case $mycmd in
            0)
                echo "begin hot reload ......................"
                hot_reload
                ;;
            *)
                echo "make error ........................"
                ;;
        esac
        ;;
    mongodb)
        mongodb;;
    make)
        make;;
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
