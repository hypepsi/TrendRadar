@echo off
chcp 65001 >nul
echo ========================================
echo 推送更新到 GitHub
echo ========================================
echo.
echo 远程仓库: https://github.com/hypepsi/TrendRadar.git
echo.

REM 检查 Git 是否安装
where git >nul 2>&1
if errorlevel 1 (
    echo [错误] 未检测到 Git 命令
    echo.
    echo 请选择以下方式之一：
    echo 1. 安装 Git: https://git-scm.com/download/win
    echo 2. 使用 GitHub Desktop: https://desktop.github.com/
    echo 3. 使用 VS Code 的源代码管理功能
    echo.
    pause
    exit /b 1
)

echo [1/4] 检查当前状态...
git status

echo.
echo [2/4] 添加所有更改的文件...
git add .

echo.
echo [3/4] 提交更改...
git commit -m "更新：添加中英文新闻源，增强翻译功能（标题+摘要）"

echo.
echo [4/4] 推送到 GitHub...
git push origin master

if errorlevel 1 (
    echo.
    echo [尝试] 推送到 main 分支...
    git push origin main
)

echo.
echo ========================================
echo ✅ 完成！
echo ========================================
echo.
echo 如果推送失败，可能需要：
echo 1. 输入 GitHub 用户名和密码（或 Personal Access Token）
echo 2. 检查网络连接
echo 3. 确认有推送权限
echo.
echo 生成 Personal Access Token:
echo https://github.com/settings/tokens
echo.
pause

