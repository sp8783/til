## tweets

|id|author_id|content|created_at|updated_at|
|---|---|---|---|---|
|1|1|hello|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|
|2|2|hi|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|
|3|3||YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|
|4|1|how are you?|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|

## replies

|id|tweet_id|replied_tweet_id|created_at|updated_at|
|---|---|---|---|---|
|1|2|1|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|

## quote_retweets

|id|tweet_id|quoted_tweet_id|created_at|
|---|---|---|---|
|1|4|2|YYYY-MM-DD hh:mm:ss|

## retweets

|id|tweet_id|retweeted_tweet_id|created_at|
|---|---|---|---|
|1|3|2|YYYY-MM-DD hh:mm:ss|

## users

|id|user_name|nickname|profile|location|website|birthday|profile_image|header_image|created_at|updated_at|deleted_at|
|---|---|---|---|---|---|---|---|---|---|---|---|
|1|1|A|hello||test_a@example.com|YYYY/MM/DD|/hoge/foo/image.png||YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|
|2|2|B||日本||YYYY/MM/DD||/hoge/bar/image.png|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|
|3|3|C||japan|||||YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|
|4|4|D|||test_d@example.com||||YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|

## followers

|id|follow_user_id|followed_user_id|created_at|
|---|---|---|---|
|1|1|2|YYYY-MM-DD hh:mm:ss|
|2|2|3|YYYY-MM-DD hh:mm:ss|

## lists

|id|list_name|author_id|description|list_image|is_private|created_at|updated_at|
|---|---|---|---|---|---|---|---|
|1|A|1|友達を監視します||1|YYYY-MM-DD hh:mm:ss|YYYY-MM-DD hh:mm:ss|

## list_members

|id|list_id|member_id|created_at|
|---|---|---|---|
|1|1|2|YYYY-MM-DD hh:mm:ss|
