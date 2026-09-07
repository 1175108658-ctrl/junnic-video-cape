# Junnic video cape

Junnic video cape 是一套用于本地 MP4/MOV 拆解和 Seedance 2.5 提示词编写的 Codex skill。

## 功能

- 从本地视频提取时长、画面规格、关键帧、镜头顺序和对白
- 按约 30 秒容量保留原始播放顺序并划分独立生成块
- 绑定 A/B/C/D 人物参考图，支持系统生成的辅助角色和场景参考图
- 将镜头轴线、对白归属、道具连续性、微表情和关键动作写成可复制中文提示词
- 在空间事实之后加入简洁、可视化的故事氛围
- 区分源视频事实、用户创作改写、格式偏好和对白清理

## 安装到 Codex

将本目录复制到 `$CODEX_HOME/Skills/junnic-video-cape`，或放入用户 skill 目录 `~/.codex/skills/junnic-video-cape`。目录中的 `SKILL.md` 是入口文件，`agents/openai.yaml` 提供 Codex 界面元数据。

## 使用

在 Codex 中提供本地 MP4/MOV 路径，并说明需要按 Junnic video cape 分析。输出会包含一个可直接提交给 Seedance 2.5 的 Markdown 提示词文件。

## 目录

```text
junnic-video-cape/
|- SKILL.md
|- README.md
`- agents/openai.yaml
```
