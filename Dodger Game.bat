@echo off
color 0a
title Dodger Game

setlocal EnableDelayedExpansion

:: Set the size of the console window
mode con: cols=80 lines=30

:: Initialize game variables
set "playerX=40"
set "playerY=25"
set "enemyX=0"
set "enemyY=0"
set "score=0"

:game_loop
cls

:: Move player
set /P "=Score: !score!  " < NUL
echo Player: X=!playerX! Y=!playerY!
echo.

:: Move enemy
set /A "enemyY+=1"
if !enemyY! geq 30 (
    set /A "enemyX=%random% %% 80"
    set "enemyY=0"
    set /A "score+=1"
)

:: Draw player
for /L %%i in (!playerX! 1 !playerX!) do (
    for /L %%j in (!playerY! 1 !playerY!) do (
        set "screen[%%j][%%i]=O"
    )
)

:: Draw enemy
for /L %%i in (!enemyX! 1 !enemyX!) do (
    for /L %%j in (!enemyY! 1 !enemyY!) do (
        set "screen[%%j][%%i]=X"
    )
)

:: Draw screen
for /L %%i in (1 1 30) do (
    for /L %%j in (1 1 80) do (
        set "char=!screen[%%i][%%j]!"
        if not defined char set "char= "
        set /P "=!char!" < NUL
        set "screen[%%i][%%j]="
    )
    echo.
)

:: Check for collision
if !playerX! equ !enemyX! (
    if !playerY! equ !enemyY! (
        echo.
        echo Game Over!
        echo Final Score: !score!
        pause
        exit /B
    )
)

:: Move player left or right based on user input
set /P "=Move (L/R): " < NUL
set /P "key="
if /I "!key!" equ "L" (
    if !playerX! gtr 1 (
        set /A "playerX-=1"
    )
) else if /I "!key!" equ "R" (
    if !playerX! lss 80 (
        set /A "playerX+=1"
    )
)

goto game_loop