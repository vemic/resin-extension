# Resin Java スタンドアローン起動バッチ集

.NET Framework 3.5不要のJavaスタンドアローン版Resin起動バッチ集です。

## 対応製品

- **Resin Open Source** - GPL v2ライセンス（オープンソース版）
- **Resin Pro** - Caucho商用ライセンス（商用サポート版）

いずれのバージョンでも本バッチ集をご利用いただけます。

## 特徴

- ✅ Resin本体と分離された拡張バッチ集
- ✅ 親ディレクトリのresin.exeを自動認識
- ✅ 設定ファイル不要
- ✅ Javaスタンドアローン実行（.NET Framework不要）

## 前提条件

- Java 8以上がインストールされていること
- JAVA_HOMEが設定されているか、javaコマンドにパスが通っていること
- Resin本体が親ディレクトリに配置されていること

## 基本的な使用方法

```cmd
# 通常起動（フォアグラウンド）
resin-java-standalone.bat

# バックグラウンド起動
resin-start.bat

# 停止
resin-stop.bat

# デバッグモード起動
resin-debug.bat

# ポート指定起動（対話式）
resin-port.bat
```

## 配布元

このバッチ集の最新版および詳細な使用方法については、以下をご確認ください：

- **GitHub リポジトリ**: [vemic/resin-extension](https://github.com/vemic/resin-extension)
- **詳細ドキュメント**: [README.md](../README.md)

## ライセンス

このバッチユーティリティ集はMITライセンスで提供されています。

**重要:** このツールはResin本体の拡張（Extension）であり、Resin本体を改変するものではありません。そのため、GPL制約は適用されず、自由に使用・改変・配布可能です。ただし、Resin本体の商用利用時は別途適切なライセンスが必要です。

## 配布元

[@vemic](https://github.com/vemic)

