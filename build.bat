@echo off

echo Building Super Metroid + A Link to the Past
cd resources

echo Combining originals (M3:3mb + Z3:1mb) into ExHiROM (Z3M3:6mb)
python create_exhirom.py sm_orig.sfc alttp_orig.sfc zsm_orig.sfc

echo Creating working copy
copy /y zsm_orig.sfc zsm.sfc > NUL:

echo Patching working copy
asar ..\src\main.asm zsm.sfc

echo Copy working copy to \build\
if not exist "..\build\" mkdir "..\build\"
copy zsm.sfc "..\build\zsm.sfc" > NUL:

cd ..
echo Done
