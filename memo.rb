require "csv"

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i

if memo_type == 1
  # 新規メモ作成処理
  puts "拡張子を除いたファイルを入力してください :"
  file_name = gets.chomp #ファイル名の取得
  puts "メモしたい内容を入力してください（完了したらCtrl+Dを押してください）:"
  memo_content = STDIN.read #標準入力から複数行の入力を受け付ける

  CSV.open("#{file_name}.csv", "w") do |csv|
    csv << [memo_content]
  end
  puts "#{file_name}.csv ファイルを作成しました。"

elsif memo_type == 2
  # 既存ファイル編集処理
  puts "拡張子を除いた編集するファイルを入力してください :"
  file_name = gets.chomp #ファイル名の取得

  if File.exist?("#{file_name}.csv")
    puts "追加したい内容を入力してください（完了したらCtrl+Dを押してください）:"
    memo_content = STDIN.read #標準入力から複数行の入力を受け付ける

    # CSVファイルに追記する
    CSV.open("#{file_name}.csv", "a") do |csv|
      csv << [memo_content]
    end
    puts "#{file_name}.csv ファイルを編集しました。"
  else
    puts "エラー: #{file_name}.csv ファイルが存在しません。"
  end

else
  # 不正な入力の場合
  puts "不正な値です。1か2を入力してください。"
end
