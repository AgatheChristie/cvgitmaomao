cd ../config
start werl +P 1024000  -pa ../ebin -name ygzj_gateway@127.0.0.1 -setcookie ygzj -boot start_sasl -config gateway  -s yg gateway_start
exit
