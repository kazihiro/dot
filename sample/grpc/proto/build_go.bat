

@echo on

set batPath=%~dp0
cd %batPath%
%~d0
cd ../go_out
set outPath=%cd%
cd ../../../../../../
set proPath=%cd%
cd %proPath%
protoc --proto_path=%proPath% --proto_path=%batPath% --go_out=plugins=grpc:./ hi.proto

cd %outPath%/hidot
go build

cd %batPath%