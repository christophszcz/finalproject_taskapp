path = File.join(Rails.root, "config/twilio.yml")
TWILIO_CONFIG = YAML.load(File.read(path))[Rails.env] || {'sid' => '', 'from' => '', 'token' => ''}
# from: '+16479315872',
# sid: 'AC963c9c6d258b05be89d0fcdf1b4ad35a',
# token: '1e9292e34414e6cad9b56f9320268a02'


# config/application.yml

# pusher_app_id: "2954"
# pusher_key: "7381a978f7dd7f9a1117"
# pusher_secret: "abdc3b896a0ffb85d373"

# test:
#   pusher_app_id: "5112"
#   pusher_key: "ad69caf9a44dcac1fb28"
#   pusher_secret: "83ca7aa160fedaf3b350"

