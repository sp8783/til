# TwitterのURI設計

|Method|Path|Description|
|---|---|---|
|POST|/tweets|ツイートする, ツイートに返信する, リツイートする, 引用リツイートする|
|GET|/users/{user_id}|特定のユーザを表示する|
|POST|/following|フォローする|
|GET|/users/{user_id}/following|フォロー一覧を表示する|
|GET|/users/{user_id}/followers|フォロワー一覧を表示する|
|POST|/lists|リストを追加する|
|POST|/lists/{list_id}/members|リストにユーザーを追加する|
|DELETE|/lists/{list_id}/members|リストからユーザーを削除する|
|GET|/lists/{list_id}|特定のリストを表示する|
|GET|/users/{user_id}/lists|特定のユーザーのリスト一覧を表示する|

## 補足：設計意図
- ツイート、返信、リツイート、引用リツイート
  - 返信、リツイート、引用リツイートについては、pathの後ろに`/replies`,`/retweets`,`/quote_retweets`を追加することも考えましたが、全て"tweet"である＆よりシンプルなURIとするため`/tweets`と設定しました
  - どの操作のPOSTか（ツイート、返信、リツイート、引用リツイート）については、リクエストボディに記載する想定でいます
- ユーザの表示（`/users/{user_id}`）、リストの表示（`/lists/{list_id}`）
  - より簡略化するためにそれぞれ`/{user_id}`、`/{list_id}`とすることも考えましたが、「各id＝別々に採番された数値列」という想定のため同一のURIとなる可能性がある点を考慮し、path上の各idの前に`/users`,`/lists`を追加しました
