rd /q /s libraries\react-lite-lib
md libraries\react-lite-lib\typings libraries\react-lite-lib\wwwroot\lib
XCOPY /E ..\NetCoreTemplates\react-lite\typings libraries\react-lite-lib\typings
XCOPY /E ..\NetCoreTemplates\react-lite\wwwroot\lib libraries\react-lite-lib\wwwroot\lib

rd /q /s libraries/vue-lite-lib
md libraries\vue-lite-lib\typings libraries\vue-lite-lib\wwwroot\lib
XCOPY /E ..\NetCoreTemplates\vue-lite\typings libraries\vue-lite-lib\typings
XCOPY /E ..\NetCoreTemplates\vue-lite\wwwroot\lib libraries\vue-lite-lib\wwwroot\lib
