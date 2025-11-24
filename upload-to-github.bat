@echo off
chcp 65001 >nul
echo ========================================
echo GitHub 上传脚本
echo ========================================
echo.

REM 检查 Git 是否安装
git --version >nul 2>&1
if errorlevel 1 (
    echo [错误] 未检测到 Git，请先安装 Git
    echo 下载地址: https://git-scm.com/download/win
    pause
    exit /b 1
)

echo [1/5] 检查 Git 状态...
git status >nul 2>&1
if errorlevel 1 (
    echo [信息] 初始化 Git 仓库...
    git init
)

echo [2/5] 添加所有文件...
git add .

echo [3/5] 提交更改...
git commit -m "更新：添加中英文新闻源，增强翻译功能（标题+摘要）"

echo.
echo [4/5] 检查远程仓库...
git remote -v >nul 2>&1
if errorlevel 1 (
    echo.
    echo [提示] 未检测到远程仓库配置
    echo 请先执行以下命令添加远程仓库：
    echo   git remote add origin https://github.com/你的用户名/仓库名.git
    echo.
    echo 或者如果已有仓库，请输入远程仓库地址：
    set /p REMOTE_URL="请输入远程仓库地址（如：https://github.com/用户名/仓库名.git）: "
    if not "!REMOTE_URL!"=="" (
        git remote add origin !REMOTE_URL!
    ) else (
        echo [错误] 未输入远程仓库地址，退出
        pause
        exit /b 1
    )
)

echo.
echo [5/5] 推送到 GitHub...
echo 如果这是第一次推送，可能需要输入 GitHub 用户名和密码（或 Personal Access Token）
echo.
git push -u origin main 2>nul
if errorlevel 1 (
    git push -u origin master 2>nul
    if errorlevel 1 (
        echo [错误] 推送失败，请检查：
        echo   1. 远程仓库地址是否正确
        echo   2. 是否有推送权限
        echo   3. GitHub 认证信息是否正确
        echo.
        echo 如果使用 HTTPS，可能需要使用 Personal Access Token 代替密码
        echo 生成地址: https://github.com/settings/tokens
        pause
        exit /b 1
    )
)

echo.
echo ========================================
echo ✅ 上传成功！
echo ========================================
echo.
echo 下一步：
echo 1. 进入 GitHub 仓库页面
echo 2. Settings → Pages → 启用 GitHub Pages
echo 3. Settings → Secrets → 配置通知渠道（如需要）
echo 4. Actions → 手动触发一次运行测试
echo.
pause

