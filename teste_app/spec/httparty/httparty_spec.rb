describe 'HTTParty' do
  # it 'HTTParty - content-type', vcr: { cassette_name: 'jsonplaceholder/posts', match_requests_on: [:body] } do
  # it 'HTTParty - content-type', vcr: { record: :new_episodes } do
  it 'HTTParty - content-type', vcr: { record: :all } do
  	# VCR.use_cassette('jsonplaceholder/posts') do
	  	response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/12')
	  	content_type = response.headers['content-type']
	  	expect(content_type).to match(/application\/json/)
	  # end
  end
end