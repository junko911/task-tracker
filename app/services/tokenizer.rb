class Tokenizer
  def self.encode(user)
    JWT.encode({ user_id: user.id }, ENV["SECRET"])
  end

  def self.decode(token)
    return if token.blank?

    token = token.split(" ")[1]

    decoded_token = JWT.decode(token, ENV["SECRET"], true, algorithm: "HS256")

    user_id = decoded_token[0]["user_id"]

    User.find_by(id: user_id)
  rescue JWT::DecodeError
    nil
  end
end
