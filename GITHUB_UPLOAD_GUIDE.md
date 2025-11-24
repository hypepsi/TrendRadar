# GitHub 上传和 GitHub Pages 配置指南

## 📋 准备工作

### 1. 安装 Git（如果还没有安装）

- 下载地址：https://git-scm.com/download/win
- 安装后重启命令行工具

### 2. 检查 Git 是否安装成功

打开命令行（PowerShell 或 CMD），运行：
```bash
git --version
```

## 🚀 上传代码到 GitHub

### 方法一：如果这是新项目（还没有 GitHub 仓库）

1. **在 GitHub 上创建新仓库**
   - 登录 GitHub
   - 点击右上角 "+" → "New repository"
   - 仓库名称：`TrendRadar`（或你喜欢的名字）
   - 选择 Public 或 Private
   - **不要**勾选 "Initialize this repository with a README"
   - 点击 "Create repository"

2. **在本地初始化 Git 并推送**

   打开命令行，进入项目目录：
   ```bash
   cd "C:\Users\hypep\OneDrive\Desktop\Cursor\TrendRadar-1"
   ```

   初始化 Git 仓库：
   ```bash
   git init
   git add .
   git commit -m "初始提交：添加中英文新闻源和翻译功能"
   ```

   添加远程仓库（替换 `你的用户名` 为你的 GitHub 用户名）：
   ```bash
   git remote add origin https://github.com/你的用户名/TrendRadar.git
   git branch -M main
   git push -u origin main
   ```

### 方法二：如果已经有 GitHub 仓库

1. **检查远程仓库配置**
   ```bash
   git remote -v
   ```

2. **如果没有配置，添加远程仓库**
   ```bash
   git remote add origin https://github.com/你的用户名/仓库名.git
   ```

3. **提交并推送更改**
   ```bash
   git add .
   git commit -m "更新：添加中英文新闻源，增强翻译功能（标题+摘要）"
   git push origin main
   ```

## 📄 本次更新的内容

本次提交包含以下更新：

1. ✅ **增强翻译功能**：英文新闻现在会翻译标题和摘要
2. ✅ **添加中文新闻源**：今日头条、微博、知乎、抖音等11个平台
3. ✅ **添加英文RSS源**：
   - 综合新闻：BBC、纽约时报、路透社、CNN等
   - 中国相关：路透社中国、BBC亚洲等（关注中国海外关系）
   - 科技AI：TechCrunch、The Verge、Wired等
   - 比特币：Cointelegraph、CoinDesk等
4. ✅ **更新关键词配置**：添加中国海外关系、科技AI、比特币等关键词

## 🌐 配置 GitHub Pages

### 1. 启用 GitHub Pages

1. 进入你的 GitHub 仓库页面
2. 点击 **Settings**（设置）
3. 在左侧菜单找到 **Pages**
4. 在 "Source" 部分：
   - 选择 **"Deploy from a branch"**
   - Branch 选择 **"main"**（或 "master"）
   - Folder 选择 **"/ (root)"**
5. 点击 **Save**

### 2. 等待部署完成

- GitHub Pages 通常需要几分钟来部署
- 部署完成后，你的网站地址将是：
  ```
  https://你的用户名.github.io/仓库名/
  ```

### 3. 访问你的网站

- 在仓库的 **Settings → Pages** 页面可以看到你的网站地址
- 或者直接访问：`https://你的用户名.github.io/仓库名/`

## ⚙️ 配置 GitHub Actions（自动运行爬虫）

### 1. 配置 Secrets（推送通知）

1. 进入仓库页面
2. 点击 **Settings** → **Secrets and variables** → **Actions**
3. 点击 **New repository secret**
4. 添加你需要的通知渠道配置（参考 README.md）

**常用 Secrets：**
- `FEISHU_WEBHOOK_URL` - 飞书机器人
- `WEWORK_WEBHOOK_URL` - 企业微信
- `TELEGRAM_BOT_TOKEN` - Telegram Bot Token
- `TELEGRAM_CHAT_ID` - Telegram Chat ID
- `EMAIL_FROM` - 发件邮箱
- `EMAIL_PASSWORD` - 邮箱密码/授权码
- `EMAIL_TO` - 收件邮箱

### 2. 手动触发运行

1. 进入仓库页面
2. 点击 **Actions** 标签
3. 选择 **"Hot News Crawler"** workflow
4. 点击 **"Run workflow"** 按钮
5. 选择分支（通常是 main）
6. 点击 **"Run workflow"**

### 3. 自动运行（定时）

- 默认配置为每小时运行一次
- 可以在 `.github/workflows/crawler.yml` 中修改 cron 表达式
- 修改后需要提交并推送到 GitHub

## 📝 常见问题

### Q: 如何更新代码？

```bash
git add .
git commit -m "你的提交信息"
git push origin main
```

### Q: GitHub Pages 没有显示最新内容？

1. 检查 Actions 是否成功运行
2. 等待几分钟让 Pages 更新
3. 检查 `output/` 目录是否有生成的 HTML 文件

### Q: 如何修改运行频率？

编辑 `.github/workflows/crawler.yml` 文件中的 cron 表达式：
```yaml
- cron: "0 * * * *"  # 每小时
- cron: "*/30 * * * *"  # 每30分钟
```

### Q: 如何查看运行日志？

1. 进入 **Actions** 标签
2. 点击最新的 workflow run
3. 查看各个步骤的日志

## 🎉 完成！

现在你的项目已经：
- ✅ 代码已上传到 GitHub
- ✅ GitHub Pages 已启用
- ✅ GitHub Actions 会自动运行爬虫
- ✅ 支持中英文新闻源和翻译功能

享受你的热点追踪系统吧！

