module OmniAuth
  module Strategies
    class StellenboschUniversity < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, 'stellenbosch_university'

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        site: 'https://api-sandbox.sun.ac.za',
        authorize_url: 'https://oauth-sandbox.sun.ac.za/oauth/authorize',
      }
      
      # You may specify that your strategy should use PKCE by setting
      # the pkce option to true: https://tools.ietf.org/html/rfc7636
      option :pkce, true

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid { raw_info['usNumber'] }

      info do
        {
          name: "#{raw_info['givenName']} #{raw_info['familyName']}",
          email: raw_info['emailPersonal'] || raw_info['emailOfficial'],
          identity: raw_info['idNumber'],
          nationality: raw_info['nationality']['code'],
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/info').parsed
      end
    end
  end
end