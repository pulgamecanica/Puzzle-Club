class Vote < ApplicationRecord
  belongs_to :puzzle_contender
  validates_presence_of :username
  validate :valid_user_42api, :duplicated_vote, :active_tournament

  private

    def valid_user_42api
      user = username.downcase.strip
      client = OAuth2::Client.new(Rails.application.credentials.api42_uid, Rails.application.credentials.api42_secret, site: "https://api.intra.42.fr")
      token = client.client_credentials.get_token
      puts ">>>" * 10 + "---" * 20 + "<<<" * 10
      begin
        response = token.get("/v2/users/" + user)
        puts "Response: (should be 200): " + response.status.to_s
        puts "New Vote registered"
        puts "Login: " + response.parsed["login"]
        puts "Campus: " + response.parsed["campus"].first["country"]
        puts "Puzzle: " + self.puzzle_contender.puzzle.title +  " | Last Votes Count: " + self.puzzle_contender.votes.count.to_s
      rescue
        puts "something went wrong when check if #{user} exists..."
        errors.add(:username, "Not a valid username __REASON_TODO__")
      end
      puts ">>>" * 10 + "-*-" * 20 + "<<<" * 10
    end

    def duplicated_vote
      if self.puzzle_contender.tournament.votes.where(username: username).any?
          errors.add(:username, "That username has been used once already :( ")
      end
    end

    def active_tournament
      if not self.puzzle_contender.tournament.active
        errors.add(:puzzle_contender, "The Tournament is not active atm :( ")
      end
    end
end
