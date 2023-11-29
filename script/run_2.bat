cd ../config
set LogFile=\"../logs/app_run2.log\"
werl +P 1024000 -pa ../ebin -name ygzj_game2@127.0.0.1 -setcookie ygzj -boot start_sasl -config run_2 -kernel error_logger {file,"%LogFile%"}  -s yg server_start
