@echo off
setlocal enabledelayedexpansion
REM --------------------------------------------------------------------------------------
REM �t�@�C���s���J�E���g�o�b�`
REM --------------------------------------------------------------------------------------
REM �T�v:
REM ���s�t�@�C���Ɠ����f�B���N�g���ɑ��݂���t�@�C���̍s�����J�E���g���܂��B
REM �Ώۂ̃t�@�C�����t�B���^����ꍇ�́uFILTER�v�ϐ���ύX���Ă��������B
REM --------------------------------------------------------------------------------------
REM ------------------�g���q-----
REM �e�L�X�g�t�@�C��
REM SET FILTER=*.txt *.pdf *.tif *.xlsx *.pptx *.log *.csv
REM -----------------------------
REM HTML/XML
REM SET FILTER=*.html *.htm *.shtml *.xml *.chm
REM -----------------------------
REM �X�^�C���V�[�g
REM SET FILTER=*.css *.xsl *.otf
REM -----------------------------
REM �X�N���v�g
REM SET FILTER=*.js *.jsp *.json *.asp *.bat *.php *.vbs
REM -----------------------------
REM Java
REM SET FILTER=*.class *.jar *.java
REM -----------------------------
REM C/C++
REM SET FILTER=*.c *.cs *.cpp *.h
REM -----------------------------
REM �A�v���P�[�V�����g��
REM SET FILTER=*.ini *.dll *.meta *.pdb *.db
REM -----------------------------
REM �t�@�C��
REM SET FILTER=*.zip
REM -----------------------------
REM �摜�t�@�C��
REM SET FILTER=*.png *.jpg
REM -----------------------------
REM �����t�@�C��
REM SET FILTER=*.mp3 *.m4a *.midi *.wav
REM -----------------------------
REM ����t�@�C��
REM SET FILTER=*.mp4
REM -----------------------------
REM ���̑�
REM SET FILTER=*.csv *bin *.tmp *.dat *.project
REM SET FILTER=*.mdb *.sprite *.install *.gz
REM -------------------------------------------------
REM �A�v���P�[�V������p�g���q
REM -------------------------------------------------
REM MineCraft
REM SET FILTER=*.mcmeta *.mcfunction *.nbt
REM -----------------------------
REM Unity
REM SET FILTER=*.unity *.asset *.mat *.prefab *.anim
REM SET FILTER=*.prefs *.dwlt *.buildreport *.CopyComplete
REM -----------------------------
REM Visual Studio
REM SET FILTER=*.sln *.lock *.ide *.ide-shm *.ide-wal *.csproj
REM -----------------------------
REM Studio One
REM SET FILTER=*.peak *.song *.soundset
REM -----------------------------
REM Scratch
REM SET FILTER=*.sb
REM -----------------------------
REM WOLF RPG �G�f�B�^�[
REM SET FILTER=*.mps *.dbtype *.common
REM -----------------------------

REM �ϐ�
REM -------------------------------------------------

set FILTER=*.txt *.pdf *.tif *.xlsx *.pptx *.log *.csv *.html *.htm *.shtml *.xml *.chm *.css *.xsl *.otf *.js *.jsp *.json *.asp *.bat *.php *.vbs *.class *.jar *.java *.c *.cs *.cpp *.h *.ini *.dll *.meta *.pdb *.db *.zip *.png *.jpg *.mp3 *.m4a *.midi *.wav *.mp4 *bin *.tmp *.dat *.project *.mdb *.sprite *.install *.gz *.mcmeta *.mcfunction *.nbt *.unity *.asset *.mat *.prefab *.anim *.prefs *.dwlt *.buildreport *.CopyComplete *.sln *.lock *.ide *.ide-shm *.ide-wal *.csproj *.peak *.song *.soundset *.sb *.mps *.dbtype *.common

set FILE=rowCount.txt
set CURDIR=%CD%
set TMPFILE=%CURDIR%\tmp.txt

set /A cou=0
set /A allline=0
set /A allsize=0
set /A maxline=0
set /A minline=1000000000
set /A maxsize=0
set /A minsize=1000000000

echo. [%DATE% %TIME%] �o�b�`�����J�n > %FILE%
echo. >> %FILE%

for /R %%I in (%FILTER%) do (
	find /c /v "" < %%I > "%TMPFILE%"
	for /F "usebackq" %%t in ("%TMPFILE%") do (
		echo. %%~FI
		echo. �s�� :%%t,�T�C�Y :%%~zI
		echo. %%~FI >> "%FILE%"
		echo. �s�� :%%t,�T�C�Y :%%~zI >> "%FILE%"

		if /I %%t gtr !maxline! (
			set /A maxline = %%t
		)
		if /I %%t lss !minline! (
			set /A minline = %%t
		)
		if /I %%~zI gtr !maxsize! (
			set /A maxsize = %%~zI
		)
		if /I %%~zI lss !minsize! (
			set /A minsize = %%~zI
		)
		set /A cou+=1
		set /A allline+=%%t
		set /A allsize+=%%~zI
		echo. ���ݍ��v :!allline!,!allsize!
	)
)

echo. >> %FILE%
echo. ���v�t�@�C���� :%cou%>> %FILE%
echo. ���v�s�� :%allline%>> %FILE%
echo. ���v�T�C�Y :%allsize%>> %FILE%
echo. >> %FILE%
echo. �ő�s�� :%maxline%>> %FILE%
echo. �ŏ��s�� :%minline%>> %FILE%
echo. �ő�T�C�Y :%maxsize%>> %FILE%
echo. �ŏ��T�C�Y :%minsize%>> %FILE%
echo. >> %FILE%
echo. [%DATE% %TIME%] �o�b�`�����I�� >> %FILE%
 
del "%TMPFILE%"