:: vem, Virtual Environment Manager
:: -------------------------------------------------
:: Default behaviour is to find and enable Virtual Environments
:: in a subfolder named \venv*, e.g. \venv, \venv-test, \venvdemo
:: 
:: If an argument is passed then that name is used instead
:: 
:: Use 'vem -h' to display the options.

@echo off

IF "%1" == "" (SET VENV=venv*) ELSE (SET VENV=%1)
IF "%1" == "-n" (GOTO NEW)
IF "%1" == "-s" (GOTO SHOW)
IF "%1" == "off" (GOTO DEACTIVATE)
IF "%1" == "-h" (GOTO HELP)
IF "%1" == "--help" (GOTO HELP)
IF "%1" == "-p" (GOTO PY)

ECHO Enable Virtual Environment \%VENV%\...

SET TARGET=""
SET VENV_MARKER=_OLD_VIRTUAL_PROMPT

FOR /D %%d IN ("%VENV%") DO (
  SET TARGET=%%d
)

IF EXIST "%TARGET%" (GOTO ACTIVATE) ELSE (GOTO NOTFOUND)

:NEW
  IF [%2]==[] (
	ECHO Please provide a name for the new Virtual Environment.
  ) ELSE (
    echo Creating a new Virtual Environment, %2
    python -m venv %2
  )
  GOTO END

:ACTIVATE
  ECHO Virtual Environment '%TARGET%' found.
  call "%TARGET%\Scripts\activate.bat"
  ECHO Virtual Environment enabled.
  python -c "import sys;print('Active Interpreter: ' + sys.executable)"
  GOTO END	

:NOTFOUND
  ECHO No Virtual Environment found.
  GOTO END

:SHOW
  IF DEFINED %VENV_MARKER% (
	ECHO Current active Virtual Environment:
  ) ELSE (
	ECHO No currently active Virtual Environment.
	ECHO Base Interpreter:
  )
  python -c "import sys;print(sys.executable)"
  GOTO END

:DEACTIVATE
  IF DEFINED %VENV_MARKER% (
	ECHO Deactivate %VIRTUAL_ENV%
	deactivate 
  ) ELSE (
	ECHO No currently active Virtual Environment.
  )
  GOTO END
  
:PY
	IF DEFINED %VENV_MARKER% (
		ECHO Start Python Interpreter
		python 
	) ELSE (
		ECHO No currently active Virtual Environment.
	)
		
	GOTO END
  
:HELP
	echo.
	echo. vem [name] [off] [-n name] [-s]  [-h^|--help] [-p]
	echo.
	echo.
	echo By default vem searches for Virtual Environments with a name matching venv*
	echo Pass `name` argument to search for custom name. This can also include wildcards.
	echo -n `name`, creates a new Virtual Environment, `name` in the current directory.
	echo off, deactivate the current interpreter.
	echo -s, show the current interpreter path.
	echo -p, open the Python interpreter for the currently active Virtual Environment.
	echo -h, show this help.

:END