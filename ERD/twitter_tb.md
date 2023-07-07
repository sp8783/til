# データ表
## timeline

|id|author_id|tweet_id|reply_id|quote_id|retweet_id|created_at|updated_at|
|---|---|---|---|---|---|---|---|
|1|1|1||||YYYY/MM/DD|YYYY/MM/DD|
|2|2|2|1|||YYYY/MM/DD|YYYY/MM/DD|
|3|3|3||1||YYYY/MM/DD|YYYY/MM/DD|
|4|1|4|2|2||YYYY/MM/DD|YYYY/MM/DD|
|5|4||||1|YYYY/MM/DD|YYYY/MM/DD|

## users

|id|user_name|nickname|profile|location|website|birthday|profile_image|header_image|created_at|updated_at|deleted_at|
|---|---|---|---|---|---|---|---|---|---|---|---|
|1|userA|A|hello||test_a@example.com|YYYY/MM/DD|/hoge/foo/image.png||YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|
|2|userB|B||日本||YYYY/MM/DD||/hoge/bar/image.png|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|
|3|userC|C||japan|||||YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|
|4|userD|D|||test_d@example.com||||YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|
|5|userE|E|こんにちは||||||YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|

## tweets

|id|author_id|content|created_at|updated_at|
|---|---|---|---|---|
|1|1|プラクティス「XXX」を終了しました🎉 #fjordbootcamp|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|
|2|2|Aさん、おめでとうございます！|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|
|3|3|「A」って人もFBC生なのか～～～|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|
|4|4|引用元のプラクティス終わりました！DさんEさん褒めて下さい！！|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|

## replies

|id|author_id|tweet_id|replied_tweet_id|created_at|updated_at|
|---|---|---|---|---|---|---|
|1|2|2|1|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|
|2|1|4||YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|

## replied_users

|id|reply_id|replied_user_id|created_at|updated_at|
|---|---|---|---|---|
|1|1|1|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|
|2|2|4|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|
|3|2|5|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|

## quote_retweets

|id|author_id|tweet_id|quoted_tweet_id|created_at|
|---|---|---|---|---|
|1|3|3|1|YYYY-MM-DD hh:mm:ss|
|2|1|4|1|YYYY-MM-DD hh:mm:ss|

## retweets

|id|author_id|retweeted_tweet_id|created_at|
|---|---|---|---|
|1|4|1|YYYY-MM-DD hh:mm:ss|

## followers

|id|follow_user_id|followed_user_id|created_at|
|---|---|---|---|
|1|1|2|YYYY-MM-DD hh:mm:ss|
|2|1|4|YYYY-MM-DD hh:mm:ss|
|3|1|5|YYYY-MM-DD hh:mm:ss|
|4|2|1|YYYY-MM-DD hh:mm:ss|
|5|3|2|YYYY-MM-DD hh:mm:ss|
|6|4|1|YYYY-MM-DD hh:mm:ss|
|7|5|1|YYYY-MM-DD hh:mm:ss|

## lists

|id|list_name|author_id|description|list_image|is_private|created_at|updated_at|
|---|---|---|---|---|---|---|---|
|1|listA|1|友達を監視します||1|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|
|2|listB|2|FBC生|/hoge/foo/bar/image.png|0|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|

## list_members

|id|list_id|member_id|created_at|
|---|---|---|---|
|1|1|4|YYYY-MM-DD hh:mm:ss|
|2|1|5|YYYY-MM-DD hh:mm:ss|
|3|2|1|YYYY-MM-DD hh:mm:ss|
|4|2|4|YYYY-MM-DD hh:mm:ss|
