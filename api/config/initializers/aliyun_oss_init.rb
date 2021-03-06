require 'aliyun/oss'

module OSS
  def self.client
    unless @client
      Aliyun::Common::Logging.set_log_file('./log/oss_sdk.log')

      @client = Aliyun::OSS::Client.new(
        endpoint:
        'http://oss-cn-shanghai.aliyuncs.com',
        access_key_id:
        Rails.application.credentials.aliyun_access_key_id,
        access_key_secret:
        Rails.application.credentials.aliyun_access_key_secret
      )
    end
    @client
  end
end
