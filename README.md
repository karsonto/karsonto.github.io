# 开奖笔记 · 轮盘标注

单文件静态站点 [`index.html`](./index.html)，可托管在 **[karsonto/karsonto](https://github.com/karsonto/karsonto)**（用户主页仓库），通过 GitHub Pages 公网访问。

## 上线地址（启用 Pages 后）

- **https://karsonto.github.io/** （该仓库发布后默认用户站点）

## 在 GitHub 上开启 Pages

1. 打开仓库 **Settings → Pages**。
2. **Build and deployment**：若使用本仓库自带的工作流，选 **GitHub Actions**（推送 `main` 后会触发 [`.github/workflows/pages.yml`](./.github/workflows/pages.yml)）。
3. 或选 **Deploy from a branch**：Branch **main** / **/(root)**，同样可发布静态 `index.html`。
4. 等待几分钟后访问 `https://karsonto.github.io/`。

## 推送到现有仓库（本机）

在 `index.html` 所在目录执行（需已登录 [GitHub CLI](https://cli.github.com/) 或配置 HTTPS/SSH）：

```bash
git init
git add index.html README.md .github .gitignore
git commit -m "Add lottery note roulette static page"

git branch -M main
git remote add origin https://github.com/karsonto/karsonto.git

# 若远程已有提交（例如原 README/profile），先拉再合：
git pull origin main --rebase --allow-unrelated-histories
git push -u origin main
```

若 `git pull --rebase` 有冲突，解决冲突后继续 `git rebase --continue`，再 `git push`。

仅用 SSH 时将 `remote` URL 换成 `git@github.com:karsonto/karsonto.git` 即可。

## 免责声明

页面内策略与推演为启发式示意，不构成真实概率或可依赖的下注依据。
