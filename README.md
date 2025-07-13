# Resin Extension - Batch Utils

![Resin](https://img.shields.io/badge/Resin-4.0.67-blue)
![Java](https://img.shields.io/badge/Java-8%2B-orange)
![Platform](https://img.shields.io/badge/Platform-Windows-lightgrey)
![License](https://img.shields.io/badge/License-MIT-green)

Resin Webサーバー用の拡張バッチユーティリティ集です。.NET Framework不要のJavaスタンドアローン実行を実現します。

## 💡 対応製品

このバッチユーティリティ集は、以下のResin製品に対応しています：

| 製品名 | ライセンス | 概要 | 対象ユーザー |
|--------|------------|------|--------------|
| **Resin Open Source** | GPL v2 | オープンソース版 | 開発者、小規模利用 |
| **Resin Pro** | Caucho商用ライセンス | 商用サポート版 | 企業、商用環境 |

**注意:** 商用環境でResinを使用する場合は、Resin Proライセンスの取得を検討してください。

## 🌟 特徴

- ✅ **.NET Framework不要** - Javaのみで動作
- ✅ **簡単セットアップ** - フォルダをコピーするだけ
- ✅ **自動検出** - Resin本体を自動で認識
- ✅ **多様な起動モード** - コンソール、バックグラウンド、デバッグ対応
- ✅ **対話式操作** - ポート番号の対話式入力
- ✅ **設定ファイル不要** - 即座に使用開始

## 📁 プロジェクト構成

```
resin-extension/
├── README.md                          ← このファイル
└── resin-batch-utils/                 ← バッチユーティリティ集
    ├── README.md                      ← 詳細な使用方法
    ├── resin-java-standalone.bat      ← メイン起動スクリプト
    ├── resin-start.bat                ← バックグラウンド起動
    ├── resin-stop.bat                 ← 停止
    ├── resin-debug.bat                ← デバッグモード起動
    └── resin-port.bat                 ← ポート指定起動
```

## 🚀 クイックスタート

### 1. セットアップ

1. **resin-batch-utilsフォルダをコピー**
   ```
   resin-4.0.67/                     ← あなたのResinディレクトリ
   ├── resin.exe
   ├── lib/resin.jar
   └── resin-batch-utils/            ← ここにコピー
       ├── resin-java-standalone.bat
       └── ...
   ```

2. **前提条件確認**
   - Java 8以上がインストール済み
   - JAVA_HOMEが設定済み、またはjavaコマンドにパスが通っている

### 2. 基本的な使用方法

```cmd
# フォルダ移動
cd resin-4.0.67\resin-batch-utils

# 通常起動
resin-java-standalone.bat

# バックグラウンド起動
resin-start.bat

# 停止
resin-stop.bat
```

## 📋 利用可能なバッチファイル

| ファイル名 | 説明 | 主な用途 |
|------------|------|----------|
| `resin-java-standalone.bat` | メイン起動スクリプト | 柔軟な起動オプション |
| `resin-start.bat` | バックグラウンド起動 | サーバー運用 |
| `resin-stop.bat` | 停止 | サーバー停止 |
| `resin-debug.bat` | デバッグモード起動 | 開発・デバッグ |
| `resin-port.bat` | ポート指定起動 | ポート競合回避 |

## 🔧 高度な使用方法

### コマンドライン引数の組み合わせ

```cmd
# デバッグモード + ポート9080でバックグラウンド起動
resin-java-standalone.bat start debug -port 9080

# ポート8888でフォアグラウンド起動
resin-java-standalone.bat console -port 8888

# デバッグモードでフォアグラウンド起動
resin-java-standalone.bat debug
```

### Eclipse連携（デバッグ）

1. `resin-debug.bat` でResinを起動
2. Eclipseで「Remote Java Application」デバッグ設定を作成
3. ホスト: `localhost`、ポート: `8000`で接続

## 🛠️ 開発者向け情報

### アーキテクチャ

- **メインスクリプト**: `resin-java-standalone.bat`
- **自動検出機能**: RESIN_HOMEの親ディレクトリ検索
- **Java実行**: システムのjavaコマンドまたはJAVA_HOME
- **引数解析**: 動的なコマンドライン引数処理

### カスタマイズポイント

- デフォルトポート番号の変更
- デバッグポート番号の変更
- JVMオプションの追加
- ログレベルの調整

## 📖 詳細ドキュメント

各バッチファイルの詳細な使用方法については、[resin-batch-utils/README.md](resin-batch-utils/README.md) をご覧ください。

## 🐛 トラブルシューティング

### よくある問題

1. **"java が見つからない"**
   - Java 8以上をインストール
   - JAVA_HOMEを設定するか、PATHにjavaを追加

2. **"resin.exe が見つからない"**
   - resin-batch-utilsがResinディレクトリの直下にあることを確認

3. **ポート競合エラー**
   - `resin-port.bat`で別のポートを指定
   - または`resin-java-standalone.bat -port <ポート番号>`を使用

### サポート

問題が解決しない場合は、以下の情報とともにお問い合わせください：

- Resinのバージョン
- Javaのバージョン（`java -version`）
- エラーメッセージの全文
- 実行したコマンド

## 🤝 貢献

プルリクエストやイシューの報告をお待ちしています。

### 開発手順

1. このリポジトリをフォーク
2. フィーチャーブランチを作成 (`git checkout -b feature/amazing-feature`)
3. 変更をコミット (`git commit -m 'Add amazing feature'`)
4. ブランチにプッシュ (`git push origin feature/amazing-feature`)
5. プルリクエストを作成

## 📄 ライセンス

このプロジェクトはMITライセンスの下で提供されています。

**重要な注意事項:**
- このバッチユーティリティ集は、Resin本体を改変するものではありません
- Resin本体とは独立したExtension（拡張ツール）として提供されています
- Resin本体のライセンス制約は、このツール自体には適用されません
- ただし、Resin本体の使用時は、適切なResinライセンスが必要です

**使用に関して:**
- 本ツールは自由に使用・改変・配布可能です
- 商用・非商用問わずご利用いただけます
- Resin本体の商用利用時は、別途Resin Proライセンスをご検討ください

## 👥 作者

**[@vemic](https://github.com/vemic)** - システムエンジニア・開発者

---

## 🔗 関連リンク

- [Resin公式サイト](http://resin.caucho.com/)
- [Java SE Downloads](https://www.oracle.com/java/technologies/javase-downloads.html)
- [Eclipse IDE](https://www.eclipse.org/downloads/)

---

<div align="center">

**⭐ このプロジェクトが役に立ったら、スターをお願いします！**

</div>
