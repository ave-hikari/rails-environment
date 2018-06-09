# テスト時は画像のリサイズをしない
if Rails.env.test?
  CarrierWave.configure do |config|
    config.enable_processing = false
  end
end
