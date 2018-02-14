@echo off
mode con:cols=103 lines=30
goto start
:: SET STUFF TO CALL

	:doubleblank
	echo.
	echo.
	GOTO:EOF

	:withoutmod
	cls
	@echo off
	youtube-dl.exe -R infinite -o %%(title)s.%%(ext)s %dlurl%
	goto :fin

	:withmod
	cls
	@echo off
	youtube-dl.exe %finmods% -R infinite -o %%(title)s.%%(ext)s %dlurl%
	if %ERRORLEVEL%==1 (
		call :dlffmpeg
		goto :withmod
	)
	goto :fin

	:dlffmpeg
	cls
	if EXIST ffprobe.exe goto fatal
	if EXIST ffmpeg.exe goto fatal
	echo.
	echo You will need ffmpeg and ffprobe to convert and/or merge files.
    echo -We will download it now .
	echo --This is only required once.
	echo .
	pause
	cls
	echo.
	echo Downloading ffmpeg.exe
	powershell Invoke-WebRequest http://fastdl.lamdaprocs.in/ytdl/ffmpeg.exe -OutFile ffmpeg.exe
	cls
	echo.
	echo Downloading ffprobe.exe
	powershell Invoke-WebRequest http://fastdl.lamdaprocs.in/ytdl/ffprobe.exe -OutFile ffprobe.exe
		
	goto :eof

	:fatal
	cls
	echo Fatal Error. Please contact somebody @ https://github.com/RomanticKiller/youtube-dl-toolkit/issues .
	pause >NUL & exit


:start
:: SET CREDITS AND SUCH
	:setcred
	
	setlocal

	set scrauthor=RomanticKiller
	set scrtitle=youtube-dl toolkit
	set scrversion=v1.0

	color 02

	set mods=none

:: STARTSEQUENCE 01
	:start01

	title %scrtitle% (%scrversion%) by %scrauthor%
	echo.
	echo %scrtitle% (%scrversion%) by %scrauthor%
	if not exist "%cd%\youtube-dl.exe" (
	    cls
		echo.
		echo Downloading youtube-dl.exe. This is only required once.
		powershell Invoke-WebRequest https://yt-dl.org/latest/youtube-dl.exe -OutFile youtube-dl.exe
		cls
		call :doubleblank
		echo Done!
		ping localhost -n 2 >NUL
	) ELSE (
	    @echo off
		ping localhost -n 3 >NUL
	)
	cls

:: MAIN MENU
	:mainmen
    @echo off
    echo  " __   __          _         _                ______ _       _____ _____ _____ _     _    _ _       "
    echo  " \ \ / /         | |       | |               |  _  | |     |_   _|  _  |  _  | |   | |  (_| |      "
    echo  "  \ V /___  _   _| |_ _   _| |__   ___ ______| | | | |       | | | | | | | | | |   | | ___| |_     "
    echo  "   \ // _ \| | | | __| | | | '_ \ / _ |______| | | | |       | | | | | | | | | |   | |/ | | __|    "
    echo  "   | | (_) | |_| | |_| |_| | |_) |  __/      | |/ /| |____   | | \ \_/ \ \_/ | |___|   <| | |_     "
    echo  "   \_/______\__,_|\________|_.__/ \___|      |___/ \_____/_  \_/ _\_____\___/\_____|_|\_|_|\__|    "
    echo  "      | ___ \       | ___ \                          | | (_)    | | / (_| | |                      "
    echo  "      | |_/ /_   _  | |_/ /___  _ __ ___   __ _ _ __ | |_ _  ___| |/ / _| | | ___ _ __             "
    echo  "      | ___ | | | | |    // _ \| '_ \` _ \ / _\` | '_ \| __| |/ __|    \| | | |/ _ | '__|          "
    echo  "      | |_/ | |_| | | |\ | (_) | | | | | | (_| | | | | |_| | (__| |\  | | | |  __| |               "
    echo  "      \____/ \__, | \_| \_\___/|_| |_| |_|\__,_|_| |_|\__|_|\___\_| \_|_|_|_|\___|_|               "
    echo  "              __/ |                                                                                "
    echo  "             |___/                                                                                 "     
	echo Enter URL of any kind of media/playlist to download it!
	set /p dlurl=URL: 
	cls
	echo Custom modifiers? Leave blank for default ones. Or type "mp3" to download as mp3.
	set /p mods=MODIFIERS: 
	set finmods=%mods% 
	set mods="%mods%"

:: VIDEO DOWNLOAD SECTION
	:dlsec

	if %mods%=="mp3" (
		set finmods= --extract-audio --audio-format mp3
		goto withmod
	)
	if %mods%=="none" (
		goto withoutmod
	)
	goto withoutmod

:: FINISH
	:fin

	cls
	echo .
	echo -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo Finished downloading and/or converting your file !
	echo -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
	echo .
	echo Do you want to download another file ? (Y/N)
	set /p lels=Answering no will exit the script: 
	set lels="%lels%"
	if %lels%=="Y" (
	    cls
		goto mainmen
	)
	if %lels%=="y" (
	    cls
		goto mainmen
	)
	
	echo The script will exit in 3 seconds.
	ping -n 3 localhost >NUL
	@echo off
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo    Loading...        Please Wait
    echo ---------------------------------------
    echo                                 =   0 ]
    echo ---------------------------------------
    ping localhost -n 1 >nul
    cls
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo    Loading.          Please Wait
    echo ---------------------------------------
    echo []                              =   5 ]
    echo ---------------------------------------
    ping localhost -n 1 >nul
    cls
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo    Loading..         Please Wait
    echo ---------------------------------------
    echo [][]                            =  15 ]
    echo ---------------------------------------
    ping localhost -n 1 >nul
    cls
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo    Loading...        Please Wait
    echo ---------------------------------------
    echo [][][]                          =  23 ]
    echo ---------------------------------------
    ping localhost -n 1 >nul
    cls
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo    Loading.          Please Wait
    echo ---------------------------------------
    echo [][][][]                        =  30 ]
    echo ---------------------------------------
    ping localhost -n 1 >nul
    cls
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo    Loading..         Please Wait
    echo ---------------------------------------
    echo [][][][][]                      =  38 ]
    echo ---------------------------------------
    ping localhost -n 1 >nul
    cls
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo    Loading...        Please Wait
    echo ---------------------------------------
    echo [][][][][]                      =  42 ]
    echo ---------------------------------------
    ping localhost -n 1 >nul
    cls
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo    Loading.          You suck
    echo ---------------------------------------
    echo [][][][][][]                    =  45 ]
    echo ---------------------------------------
    ping localhost -n 1 >nul
    cls
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo.
    echo    Loading..         You suck
    echo ---------------------------------------
    echo [][][][][][][]                  =  48 ]
    echo ---------------------------------------
    ping localhost -n 1 >nul
    cls
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo    Loading...        You suck
	echo ---------------------------------------
	echo [][][][][][][][]                =  50 ]
	echo ---------------------------------------
	ping localhost -n 1 >nul
	cls
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo    Loading.           You suck
	echo ---------------------------------------
	echo [][][][][][][][][]              =  56 ]
	echo ---------------------------------------
	ping localhost -n 1 >nul
	cls
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo    Loading..           You suck
	echo ---------------------------------------
	echo [][][][][][][][][][]            =  63 ]
	echo ---------------------------------------
	ping localhost -n 1 >nul
	cls
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo    Loading...        Please Wait
	echo ---------------------------------------
	echo [][][][][][][][][][][]          =  69 ]
	echo ---------------------------------------
	ping localhost -n 1 >nul
	cls
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo    Loading.          Please Wait
	echo ---------------------------------------
	echo [][][][][][][][][][][][]        =  75 ]
	echo ---------------------------------------
	ping localhost -n 1 >nul
	cls
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo    Loading..         Please Wait
	echo ---------------------------------------
	echo [][][][][][][][][][][][][]      =  79 ]
	echo ---------------------------------------
	ping localhost -n 1 >nul
	cls
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo    Loading...        Please Wait
	echo ---------------------------------------
	echo [][][][][][][][][][][][][][]    =  86 ]
	echo ---------------------------------------
	ping localhost -n 1 >nul
	cls
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo    Loading.          Please Wait
	echo ---------------------------------------
	echo [][][][][][][][][][][][][][][]  =  90 ]
	echo ---------------------------------------
	ping localhost -n 1 >nul
	cls
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo    Loading..         Please Wait
	echo ---------------------------------------
	echo [][][][][][][][][][][][][][][]  =  96 ]
	echo ---------------------------------------
	ping localhost -n 1 >nul
	cls
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo    Loading...        .Complete.
	echo ---------------------------------------
	echo [][][][][][][][][][][][][][][][]= 100 ]
	echo ---------------------------------------
	exit >NUL
	