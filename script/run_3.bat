cd ../config
set LogFile=\"../logs/app_run3.log\"
werl +P 1024000 -pa ../ebin -name ygzj_game3@127.0.0.1 -setcookie ygzj -boot start_sasl -config run_3 -kernel error_logger {file,"%LogFile%"}  -s yg server_start
