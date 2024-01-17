#!/bin/bash

prefix=$(cd `dirname $0` && pwd)
cd ${prefix}

ARGS_FILE="./config/vm.args"
CONFIG_FILE="./config/sys.config"


SOURCE_DIR="." # 需要保证SOURCE_DIR一定在第十行

TOOL_BEAM="./tools/protobuf/protobuf_pb.beam"

ACTION=$1
NAME_TYPE="-name"
NAME="ygzj_game1@127.0.0.1"
NAME2="ygzj_game2@127.0.0.1"
COOKIE_ARG="$(grep '^-setcookie' "$ARGS_FILE" || true)"
COOKIE="$(echo "$COOKIE_ARG" | awk '{print $2}')"

ARGS_FILE2="./config/vm2.args"
CONFIG_FILE2="./config/sys2.config"

get_ebin_dir() {
    if [ -d "ebin" ];then
        echo "-pa ${SOURCE_DIR}/ebin"
    else
        echo "-pa ${SOURCE_DIR}/_build/default/lib/*/ebin"
    fi
}

stop() {
    erl_call -c "$COOKIE" -n "$NAME" -e <<Erl
    application:stop(recon_web),
    application:stop(cowboy),
    myproj:stop_game_server().
Erl
}

stop2() {
    erl_call -c "$COOKIE" -n "$NAME2" -e <<Erl
    application:stop(recon_web),
    application:stop(cowboy),
    myproj:stop_game_server().
Erl
}

hot_reload() {
    erl_call -c "$COOKIE" -n "$NAME" -a 'reloader reload_all'
    erl_call -c "$COOKIE" -n "$NAME2" -a 'reloader reload_all'
}

start() {
    path=$(get_ebin_dir)
    erl ${path} -config "$CONFIG_FILE"  \
        -detached -run inets -args_file "$ARGS_FILE" -run crypto -run ssl \
        -boot start_sasl -run myproj
    echo
}

start2() {
    path=$(get_ebin_dir)
    erl ${path} -config "$CONFIG_FILE2"  \
        -detached -run inets -args_file "$ARGS_FILE2" -run crypto -run ssl \
        -boot start_sasl -run myproj
    echo
}

clean() {
    rebar3 clean -a
}

relx_gen_id() {
    od -t x -N 4 /dev/urandom | head -n1 | awk '{print $2}'
}


remsh() {
    id="remsh$(relx_gen_id)-${NAME}"
    erl "$NAME_TYPE" "$id" -setcookie "$COOKIE" -remsh "$NAME" -hidden
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
    start2)
        start2;;
    remsh)
        remsh;;
    hot_reload)
        hot_reload
        ;;
    stop)
        stop;;
    stop2)
        stop2;;
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
