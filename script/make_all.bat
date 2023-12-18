
cd ..\ebin

::werl -s mysql_to_base_data start

del *.beam

cd ..

erl -make

copy tools\protobuf\protobuf_pb.beam ebin

pause

