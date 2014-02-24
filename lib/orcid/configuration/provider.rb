module Orcid
  class Configuration::Provider
    attr_reader :store
    def initialize(store = ::ENV)
      @store = store
    end

    attr_writer :authentication_scope
    def authentication_scope
      @authentication_scope ||= store.fetch('ORCID_APP_AUTHENTICATION_SCOPE') {
        "/authenticate,/orcid-works/create,/orcid-works/update,/read-public"
      }
    end

    attr_writer :site_url
    def site_url
      @site_url ||= store.fetch('ORCID_SITE_URL') { "http://api.sandbox-1.orcid.org" }
    end

    attr_writer :token_url
    def token_url
      @token_url ||= store.fetch('ORCID_TOKEN_URL') { "https://api.sandbox-1.orcid.org/oauth/token" }
    end

    attr_writer :signin_via_json_url
    def signin_via_json_url
      @signin_via_json_url ||= store.fetch('ORCID_REMOTE_SIGNIN_URL') { "https://sandbox-1.orcid.org/signin/auth.json" }
    end

    attr_writer :authorize_url
    def authorize_url
      @authorize_url ||= store.fetch('ORCID_AUTHORIZE_URL') { "https://sandbox-1.orcid.org/oauth/authorize" }
    end

    attr_writer :id
    def id
      @id ||= store.fetch('ORCID_APP_ID') {
        Rails.logger.error('Set your Orcid.provider.id')
      }
    end

    attr_writer :secret
    def secret
      @secret ||= store.fetch('ORCID_APP_SECRET') {
        Rails.logger.error('Set your Orcid.provider.secret')
      }
    end
  end
end