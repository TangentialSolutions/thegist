module Gisty
  # this is what is returned from the `Gist.list_all_gists` call
  def get_gist_pages(url, access_token = "", descriptions = [])
    puts "yep"
    request = Net::HTTP::Get.new(url)
    request['Authorization'] = "token #{access_token}" if access_token.to_s != ''
    response = http(api_url, request)
    descriptions.concat(pretty_gist(response))

    link_header = response.header['link']

    if link_header
      links = Hash[ link_header.gsub(/(<|>|")/, "").split(',').map { |link| link.split('; rel=') } ].invert

      get_gist_pages(links['next'], access_token, descriptions) if links['next']
    end

    descriptions
  end

  def pretty_gist(response)
    descriptions = []
    body = JSON.parse(response.body)
    if response.code == '200'
      body.each do |gist|
        descriptions << "#{gist['description'] || gist['files'].keys.join(" ")} #{gist['public'] ? '' : '(secret)'}"
      end
    else
      raise Error, body['message']
    end

    descriptions
  end
end