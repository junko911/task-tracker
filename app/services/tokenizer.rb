class Tokenizer
  # NOTICE: Can be in secrets.yml or .env
  SECRET = "MySeCrEt".freeze

  def self.encode(user)
    JWT.encode({ user_id: user.id }, SECRET)
  end

  def self.decode(token)
    return if token.blank?

    token = token.split(" ")[1]

    decoded_token = JWT.decode(token, SECRET, true, algorithm: "HS256")

    user_id = decoded_token[0]["user_id"]

    User.find_by(id: user_id)
  rescue JWT::DecodeError
    nil
  end
end
