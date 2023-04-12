# GhostWriter
![MacOS](https://img.shields.io/badge/macOS-13.0-000000?style=flat&logo=apple)
![Swift version](https://img.shields.io/badge/Swift-5.7-f05138?style=flat&logo=swift)
![ChatGPT](https://img.shields.io/badge/ChatGPT-3.5_turbo-000000?style=flat)

ChatGPTを使ったCLIです。

このツールで以下の機能を提供しています。

- UnitTests生成
- Mock生成
- オブジェクトマッパー生成

## Requried

このCLIはOpenAIのAPI Keyが必要になるので、
[こちら](https://platform.openai.com/account/api-keys)でAPI Keyを作成してください。

<img width=600 src='https://user-images.githubusercontent.com/86991723/231377992-62e49560-065b-433d-a77e-197bbeff1da1.png' />

## Installation

当ツールはSwift Package Managerを使ってインストールできます。
現状はSwiftファイルを対象にしているので、Mac環境以外は適用外です。

## Usage

当リポジトリをクローン後にリポジトリのルートに移動後にそれぞれのツールのコマンドが実行できます。 

#### ユニットテスト生成

```
$ swift run testwriter [--input-file-path <input-file-path>] [--output-directory-path <output-directory-path>] [--open-aiapi-key <open-aiapi-key>]
```

| パラメータ | 説明 |
|---|---|
| -k, --open-aiapi-key |　OpenAI API Key　|
| -i, --input-file-path |　ユニットテストを生成したいファイルのパス　|
| -o, --output-directory-path |　生成したファイルの出力先パス　|

#### Mock生成

```
$ swift run mockwriter [--input-file-path <input-file-path>] [--output-directory-path <output-directory-path>] [--open-aiapi-key <open-aiapi-key>]
```

| パラメータ | 説明 |
|---|---|
| -k, --open-aiapi-key |　OpenAI API Key　|
| -i, --input-file-path |　モックを生成したいファイルのパス　|
| -o, --output-directory-path |　生成したファイルの出力先パス　|

#### オブジェクトマッパー生成

```
$ swift run mapperwriter [--source-file-path <source-file-path>] [--destination-file-path <destination-file-path>] [--output-directory-path <output-directory-path>] [--open-aiapi-key <open-aiapi-key>]
```

| パラメータ | 説明 |
|---|---|
| -k, --open-aiapi-key |　OpenAI API Key　|
| -s, --source-file-path |　変換元のクラスのファイルパス　|
| -d, --destination-file-path |　変換先のクラスのファイルパス　|
| -o, --output-directory-path |　生成したファイルの出力先パス　|

