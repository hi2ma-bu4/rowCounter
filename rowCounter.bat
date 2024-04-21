@echo off
setlocal enabledelayedexpansion
REM --------------------------------------------------------------------------------------
REM ファイル行数カウントバッチ
REM --------------------------------------------------------------------------------------
REM 概要:
REM 実行ファイルと同じディレクトリに存在するファイルの行数をカウントします。
REM 対象のファイルをフィルタする場合は「FILTER」変数を変更してください。
REM --------------------------------------------------------------------------------------
REM ------------------拡張子-----
REM テキストファイル
REM SET FILTER=*.txt *.pdf *.tif *.xlsx *.pptx *.log *.csv
REM -----------------------------
REM HTML/XML
REM SET FILTER=*.html *.htm *.shtml *.xml *.chm
REM -----------------------------
REM スタイルシート
REM SET FILTER=*.css *.xsl *.otf
REM -----------------------------
REM スクリプト
REM SET FILTER=*.js *.jsp *.json *.asp *.bat *.php *.vbs
REM -----------------------------
REM Java
REM SET FILTER=*.class *.jar *.java
REM -----------------------------
REM C/C++
REM SET FILTER=*.c *.cs *.cpp *.h
REM -----------------------------
REM アプリケーション拡張
REM SET FILTER=*.ini *.dll *.meta *.pdb *.db
REM -----------------------------
REM ファイル
REM SET FILTER=*.zip
REM -----------------------------
REM 画像ファイル
REM SET FILTER=*.png *.jpg
REM -----------------------------
REM 音声ファイル
REM SET FILTER=*.mp3 *.m4a *.midi *.wav
REM -----------------------------
REM 動画ファイル
REM SET FILTER=*.mp4
REM -----------------------------
REM その他
REM SET FILTER=*.csv *bin *.tmp *.dat *.project
REM SET FILTER=*.mdb *.sprite *.install *.gz
REM -------------------------------------------------
REM アプリケーション専用拡張子
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
REM WOLF RPG エディター
REM SET FILTER=*.mps *.dbtype *.common
REM -----------------------------

REM 変数
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

echo. [%DATE% %TIME%] バッチ処理開始 > %FILE%
echo. >> %FILE%

for /R %%I in (%FILTER%) do (
	find /c /v "" < %%I > "%TMPFILE%"
	for /F "usebackq" %%t in ("%TMPFILE%") do (
		echo. %%~FI
		echo. 行数 :%%t,サイズ :%%~zI
		echo. %%~FI >> "%FILE%"
		echo. 行数 :%%t,サイズ :%%~zI >> "%FILE%"

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
		echo. 現在合計 :!allline!,!allsize!
	)
)

echo. >> %FILE%
echo. 合計ファイル数 :%cou%>> %FILE%
echo. 合計行数 :%allline%>> %FILE%
echo. 合計サイズ :%allsize%>> %FILE%
echo. >> %FILE%
echo. 最大行数 :%maxline%>> %FILE%
echo. 最小行数 :%minline%>> %FILE%
echo. 最大サイズ :%maxsize%>> %FILE%
echo. 最小サイズ :%minsize%>> %FILE%
echo. >> %FILE%
echo. [%DATE% %TIME%] バッチ処理終了 >> %FILE%
 
del "%TMPFILE%"