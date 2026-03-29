# Plugin and Script Collection

> 个人收集/编写的实用脚本与插件合集

## 📂 目录结构

```
Plugin_and_Script_Collection/
├── tampermonkey/        # 油猴脚本
│   └── toc-reader/      # 网页目录阅读器
├── chrome-extensions/   # Chrome 扩展（预留）
└── ahk/                 # AutoHotkey 脚本
    └── window-hotedge/  # 屏幕边缘触发器
```

## 🧩 脚本列表

### Tampermonkey 脚本

| 脚本                                     | 说明                                                         | 安装                                                         |
| ---------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| [toc-reader](./tampermonkey/toc-reader/) | 网页目录阅读器，自动提取 H1~H6 标题生成悬浮目录面板，支持点击跳转、搜索过滤、拖拽移动 | [安装](https://raw.githubusercontent.com/JBC-JJM/Plugin_and_Script_Collection/main/tampermonkey/toc-reader/toc-reader.user.js) |

### AutoHotkey 脚本

| 脚本 | 说明 |
|------|------|
| [window-hotedge](./ahk/window-hotedge/) | 屏幕边缘触发器，在屏幕边缘/任务栏区域执行滚轮操作实现切换虚拟桌面、调节音量、切换标签页等功能 |

---

## 🔧 使用方法

### 安装油猴脚本

1. 浏览器安装 [Tampermonkey](https://www.tampermonkey.net/) 扩展
2. 点击上方「安装」链接
3. 在弹出页面确认安装

### 使用 AutoHotkey 脚本

1. 安装 [AutoHotkey v2.0](https://www.autohotkey.com/)
2. 双击运行 `.ahk` 文件

### 本地开发

```bash
git clone https://github.com/JBC-JJM/Plugin_and_Script_Collection.git
cd Plugin_and_Script_Collection
```

---

## 📄 License

MIT
