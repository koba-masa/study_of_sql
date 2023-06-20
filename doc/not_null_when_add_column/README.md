# ADD COLUMN実行時におけるNot Null制約の扱いに関して

## 検証内容

## 検証
### 検証手順
1. 以下のテーブルを作成する
   | カラム | 型 | 主キー制約 | NotNull制約 |
   |:--|:--|:--|:--|
   | id | ID | ◯ | |
   | name | 名前 |  | |
1. テーブルにレコードを登録する
1. 以下のカラムを追加する
   | カラム | 型 | 主キー制約 | NotNull制約 |
   |:--|:--|:--|:--|
   | added_column | 追加 | | ◯ |

   - 以下の2パターンを検証する
      1. カラム追加と同時にNotNull制約を付与する・・・パターン1
      1. カラムを追加後にNotNull制約を付与する・・・パターン2

### 検証パターン
| データベース | パターン | 結果 | 備考 |
|:--|:--|:--|:--|
| MySQL | 1 | OK | |
| | 2 | NG | カラム追加には成功する |
| PostgreSQL | 1 | NG | |
| | 2 | NG | カラム追加には成功する |

## 結論
### MySQL
- NotNull制約のあるカラムを追加する際にデフォルト値が設定されていない場合、(SQLモードによるが)その型のデフォルト値が設定されるため、NotNull制約を回避する
- しかし、NotNull制約が設定されていない状態で追加する場合にはNullが設定され、そのカラムに対してNotNull制約を設定するとエラーとなる

### PostgreSQL
- デフォルト値が指定されていないとNullが設定されるため、エラーとなる

## 参考
### MySQL
- https://dev.mysql.com/doc/refman/8.0/ja/data-type-defaults.html
> 明示的な DEFAULT 句のない NOT NULL カラムに対するデータエントリでは、INSERT または REPLACE ステートメントにカラムの値を含まれていない場合、または UPDATE ステートメントがカラムを NULL に設定する場合、MySQL はその時点で有効な SQL モードに従ってカラムを処理します。

### PostgreSQL
- https://www.postgresql.jp/document/14/html/ddl-alter.html#DDL-ALTER-ADDING-A-COLUMN
> 新しい列にはデフォルト値が初期値として入ります（DEFAULT句を指定しない場合はNULL値が入ります）。
