cd ../config
erl +P 1024000 -pa ../ebin -name ygzj_game1@127.0.0.1 -setcookie ygzj -boot start_sasl -config run_1 -s yg server_start
pause
:a exit
